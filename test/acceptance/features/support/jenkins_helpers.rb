require 'jenkins_api_client'

module JenkinsHelperMethods
    include JenkinsApi::UriHelper

    def jenkins_client(username,password)
        @jenkins_client ||= JenkinsApi::Client.new(:server_url => "http://#{username}:#{password}@#{platform_get_target}/jenkins", :log_location => "jenkins_api_#{Time.now.strftime('%Y-%m-%d')}.log")
    end

    def jenkins_log_in(username,password)
        return jenkins_client(username,password).instance_of? JenkinsApi::Client
    end

    def jenkins_split_job_namespace(job_name)
        return job_name.split("/")
    end

    def jenkins_generate_api_request_target(job_name)
        # Build the API request target
        request_target=jenkins_split_job_namespace(job_name).map { |j| "/job/#{path_encode j}" }.join
        return request_target
    end

    def jenkins_generate_job_namespace(job_name)
        return jenkins_generate_api_request_target(job_name).sub("/job/","")
    end

    def jenkins_run_job(job_name,job_params = {})
        # Wait for up to 30 seconds, attempt to cancel queued build
        opts = {'build_start_timeout' => 60,
                'cancel_on_build_start_timeout' => true}
        build_number = @jenkins_client.job.build(jenkins_generate_job_namespace(job_name), job_params, opts)
        return build_number
    end

    def jenkins_get_job_data(job_name)
        # Go straight to the API as the gem's list method can only show the top level jobs
        return @jenkins_client.api_get_request(jenkins_generate_api_request_target(job_name))
    end

    def jenkins_job_exists?(job_name)
        job_data = jenkins_get_job_data(job_name)
        
        return !job_data.nil? && !job_data.empty?
    end

    def jenkins_get_build_details(job_name,build_number)
        return @jenkins_client.job.get_build_details(jenkins_generate_job_namespace(job_name),build_number)
    end

    def jenkins_wait_for_build_result(job_name, build_number)
        build_result = nil
        while build_result.nil? do
            build_result = jenkins_get_build_details(job_name, build_number)['result']
        end
        return build_result
    end
end

World(JenkinsHelperMethods)