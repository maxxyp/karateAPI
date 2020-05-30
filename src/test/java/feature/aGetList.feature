Feature: GET Endpoint verification

  Background:
    * call read('classpath:karate-config.js')
    * url baseHostname
    * header Accept = 'application/json'

  Scenario: GET all users successfully
    Given path '/posts/'
    When method GET
    Then status 200
    And print response
    * def userResponse = response
    Then match userResponse.[*].title contains "automation"
    Then match userResponse.[*].author contains "John"

  Scenario: GET a particular user from the system
    Given path '/posts/5'
    When method GET
    Then status 200
    And print response
    * def userResponse = response
    Then match userResponse.title contains "Engineering"
    Then match userResponse.author contains "Philips"
