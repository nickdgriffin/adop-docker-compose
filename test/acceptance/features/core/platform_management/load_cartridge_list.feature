@core
@platform_management
Feature: Load Cartridge List

    Background: The CD tool is ready for use and Load_Cartridge_List is present
        Given I can log into the CD tool
        And I can log into the SCM tool
        And the Platform_Management/Load_Cartridge_List job exists

    Scenario: Load Cartridge List is successful for the first time with the default parameters
        Given the Platform_Management/Load_Cartridge_List job is successful without parameters
        Then the cartridge list should be loaded

    Scenario: Load Cartridge List is successful a second time with the default parameters
        Given the Platform_Management/Load_Cartridge_List job is successful without parameters
        Then the cartridge list should be loaded
