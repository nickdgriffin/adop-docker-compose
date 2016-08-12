# Step Definitions
Given(/I can log into Jenkins/) do
    expect(jenkins_log_in(platform_get_admin_user,platform_get_admin_password)).to be true
end

Given(/the ([\w\/]+) Jenkins job exists/) do |job_name|
    expect(jenkins_job_exists?(job_name)).to be true
end

Given(/the ([\w\/]+) Jenkins job is successful with default parameters/) do |job_name|
    steps %Q{
        Given the #{job_name} job exists
    }

    # Run the job
    # Due to the way the gem works we have to fake a parameter so it makes the correct API call
    build_number = jenkins_run_job(job_name,{ :DUMMY_PARAM => "IGNORE" })
    expect(build_number).to be > 0

    # Test for "result" => "SUCCESS"
    build_result = jenkins_wait_for_build_result(job_name, build_number)
    expect(build_result).to eq("SUCCESS")
end

Given(/the ([\w\/]+) Jenkins job is successful without parameters/) do |job_name|
    steps %Q{
        Given the #{job_name} job exists
    }

    # Run the job
    build_number = jenkins_run_job(job_name)
    expect(build_number).to be > 0

    # Test for "result" => "SUCCESS"
    build_result = jenkins_wait_for_build_result(job_name, build_number)
    expect(build_result).to eq("SUCCESS")
end
