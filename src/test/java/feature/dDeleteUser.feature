Feature: DELETE Endpoint verification

  Background:
    * url baseHostname
    * header Accept = 'application/json'

  Scenario: DELETE - single user information is successfully deleted

    Given path 'posts/7'
    And method DELETE
    Then status 200
    And print 'Response is: ', response


  Scenario Outline: DELETE - multiple user information is successfully deleted
    And path '/posts/<id>'
    When method DELETE
    Then status 200

    Examples:
      | id |
      | 8  |
      | 9  |