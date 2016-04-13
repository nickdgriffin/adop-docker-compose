# Step Definitions
Given(/I can log into Gerrit/) do
    expect(gerrit_get_account_capabilities(platform_get_admin_user,platform_get_admin_password)).to be true
end

Given(/the ([\w\/-]+) repository exists in Gerrit/) do |repository_name|
    expect(gerrit_repository_exists?(repository_name)).to be true
end