Then(/the platform should be loaded/) do
    steps %Q{
        Given the Load_Platform job exists
        Given the Platform_Management/Load_Cartridge_List job exists
        Given the Platform_Management/Setup_Gerrit job exists
        Given the Platform_Management/Load_Platform_Extension job exists
        Given the Platform_Management/Generate_Example_Workspace job exists
        Given the Workspace_Management/Generate_Workspace job exists
    }
end

Then(/the cartridge list should be loaded/) do
    steps %Q{
        Given the cartridges/adop-cartridge-java repository exists in Gerrit
    }
end