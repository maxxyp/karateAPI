Feature: Random strings creation

  Background:
    * call read('classpath:karate-config.js')
    * url baseHostname
    * header Accept = 'application/json'
    * def random = Math.floor(Math.random() * 1000)


  Scenario: Randomly print random UDID
    * def getDate =
  """
  function(){ return java.util.UUID.randomUUID() + '' }
  """
    * def temp = getDate()
    * print temp


#  Scenario: Generate random string and pass it as parameter to post request
#    Given path '/posts/'
#    * def random1 = Math.floor(Math.random() * 100000)
#    * def random2 = Math.floor(Math.random() * 100000)
#    * def randomTitle = random1 + 'Ryan'
#    * def randomAuthor = random2 + 'Author'
#    And print randomTitle
#    And print randomAuthor
#    When request {"id" : "10", "title" : "#(randomTitle)", "author" : "#(randomAuthor)" }
#    When method POST
#    Then status 201