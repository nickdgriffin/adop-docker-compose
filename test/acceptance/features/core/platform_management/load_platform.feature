@core
@platform_management
Feature: Load Platform

    Background: The CD tool is available and ready for use
        Given I can log into the CD tool

    Scenario: Load Platform is successful for the first time with the default parameters
        Given the Load_Platform job is successful with default parameters
        Then the platform should be loaded

    Scenario: Load Platform is successful a second time with the default parameters
        Given the Load_Platform job is successful with default parameters
        Then the platform should be loaded
