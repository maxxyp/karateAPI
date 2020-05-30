Feature: PUT Endpoint verification

  Background:
    * url baseHostname
    * header Accept = 'application/json'

  Scenario: PUT - single user information is successfully updated
    And path '/posts/7'
    When request {"id" : "7", "title" : "put_automation", "author" : "put_Mike" }
    And method PUT
    Then status 200
    And print 'Response is: ', response
    And match response == {"id": "7","title": "put_automation","author": "put_Mike"}

  Scenario Outline: PUT - multiple user information is successfully updated
    And path '/posts/<id>'
    And request {title : '<titles>', author : '<authors>'}
    When method PUT
    Then status 200

    Examples:
      | id | titles       | authors       |
      | 8  | put_Maths    | put_Agnes     |
      | 9  | put_English  | put_Esther    |