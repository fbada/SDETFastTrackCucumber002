@login
Feature: Webtable app login
  User Story: User should be able to login webtable application

  Background:
    Given user is on the login page of webtable app

  @smoke @webtableLogin
  Scenario: Login scenario with valid credentials
    When user enters username Test
    And user enters password Tester
    And user clicks to login button
    Then user should see url contains orders

@smoke
  Scenario: Login scenario with invalid credentials
    When user enters username incorrect
    And user enters password incorrect
    And user clicks to login button
    Then user should see url contains login

  @smoke
  Scenario Outline: Login should not be susceptible to SQL injection
    When the user enters "<sample>" as username on the bank login
    And the user enters a random password on the bank site
    Then the login should not be successful on the bank site
    And the system should not return a database error message

    Examples:
      | sample          |
      | 1' OR '1'='1    |
      | admin' --       |
      | 1' OR 'a'='a    |
      | ' OR 'x'='x     |
      | ' OR 1=1; DROP  |
      | ' OR 1=1; DELETE|
