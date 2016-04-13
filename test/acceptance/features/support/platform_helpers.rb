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

end

World(PlatformHelperMethods)