# Step Definitions
Given(/I can log into the CD tool/) do
  steps %Q{
      Given I can log into #{platform_get_cd_tool()}
  }
end

Given(/the ([\w\/]+) job exists/) do |job_name|
  steps %Q{
      Given the #{job_name} #{platform_get_cd_tool()} job exists
  }
end

Given(/the ([\w\/]+) job is successful with default parameters/) do |job_name|
    steps %Q{
        Given the #{job_name} #{platform_get_cd_tool()} job is successful with default parameters
    }
end

Given(/the ([\w\/]+) job is successful without parameters/) do |job_name|
    steps %Q{
        Given the #{job_name} #{platform_get_cd_tool()} job is successful without parameters
    }
end
