module PlatformHelperMethods

    def platform_get_target()
        return ENV['TARGET_HOST']
    end

    def platform_get_admin_user()
        return ENV['INITIAL_ADMIN_USER']
    end

    def platform_get_admin_password()
        return ENV['INITIAL_ADMIN_PASSWORD']
    end

    def platform_get_cd_tool()
      return "Jenkins"
    end

    def platform_get_scm_tool()
      return "Gerrit"
    end

end

World(PlatformHelperMethods)
