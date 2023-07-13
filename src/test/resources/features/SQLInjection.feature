Feature: Login SQL Injection Prevention
  As a security-conscious developer
  I want to ensure that our login system is immune to SQL Injection attacks
  So that our users' data remains secure and private.

  Feature: Login SQL Injection Prevention
  As a security-conscious user
  I want to ensure that the bank login system is immune to SQL injection attacks
  So that my personal information remains secure
  @wip
  Scenario Outline: Login should not be susceptible to SQL injection
    Given a user navigates to the bank login page
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
