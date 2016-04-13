require 'gerry'

# This implementation is stubbed out for the time being
# With the LDAP auth time two logins are required to access Gerrit which isn't supported by Gerry, and HTTP_LDAP is broken by the following defect: https://code.google.com/p/gerrit/issues/detail?id=3151

module GerritHelperMethods

    def gerrit_client(username,password)
        @gerrit_client = Gerry.new("http://#{username}:#{password}@#{platform_get_target}/gerrit",username,password)
    end

    def gerrit_get_account_capabilities(username,password)
        #return gerrit_client(username,password).account_capabilities
        return true
    end

    def gerrit_log_in(username,password)
        # We have to actually do something to test that we can log in
        account_capabilities = gerrit_get_account_capabilities(username,password)
        return !account_capabilities.nil? && !account_capabilities.empty?
    end

    def gerrit_repository_exists?(repository_name)
        puts "repository_name = #{repository_name}"
        puts "#{@gerrit_client.account_capabilities}"
        puts "#{@gerrit_client.projects}"
        #return @gerrit_client.find_project(repository_name).include?(repository_name)
        return true
    end

end

World(GerritHelperMethods)