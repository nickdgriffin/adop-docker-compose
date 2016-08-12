# Step Definitions
Given(/I can log into the SCM tool/) do
    steps %Q{
        Given I can log into #{platform_get_scm_tool()}
    }
end

Given(/the ([\w\/-]+) repository exists in the SCM tool/) do |repository_name|
    steps %Q{
        Given the #{repository_name} repository exists in #{platform_get_scm_tool()}
    }
end
