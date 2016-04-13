@core
@platform_management
Feature: Load Cartridge List

    Background: Jenkins is ready for use and Load_Cartridge_List is present
        Given I can log into Jenkins
        And I can log into Gerrit
        And the Platform_Management/Load_Cartridge_List job exists

    Scenario: Load Cartridge List is successful for the first time with the default parameters
        Given the Platform_Management/Load_Cartridge_List job is successful without parameters
        Then the cartridge list should be loaded
    
    Scenario: Load Cartridge List is successful a second time with the default parameters
        Given the Platform_Management/Load_Cartridge_List job is successful without parameters
        Then the cartridge list should be loaded
        