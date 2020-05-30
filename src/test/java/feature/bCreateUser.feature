Feature: POST Endpoint verification

  Background:
    * url baseHostname
    * header Accept = 'application/json'
    * def random = Math.floor(Math.random() * 1000)
    * def rand = function(max){ return Math.floor(Math.random() * max) }

  Scenario: Create and retrieve a user
    Given path '/posts/'
    And request {"id" : "7", "title" : "physics", "author" : "Helen" }
    When method POST
    Then status 201
    And def userResponse = response
    Given path '/posts/'+userResponse.id
    When method GET
    Then status 200
    Then match userResponse.author contains "Helen"

  Scenario Outline: POST - multiple user information is successfully created
    And path '/posts'
    And request {id : '<SN>', title : '<titles>', author : '<authors>'}
    When method POST
    Then status 201
    And match response == { id: '#notnull', title : '<titles>', author : '<authors>' }

    Examples:
      | SN  | titles     | authors   |
      | 8   | Maths      | Sarah     |
      | 9   | English    | Martha    |