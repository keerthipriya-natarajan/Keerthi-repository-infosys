#Author: keerthipriya@rfpio.com
Feature: DELETE Product

  Background: 
    * def endpoint = "https://api.escuelajs.co/api"
    * def callCreateProduct =  callonce read('createProduct.feature@createProduct')
    * def productId1 = callCreateProduct.response.id
    * def getResources = Java.type('utilities.Resources')
    * def getDELETEProductResource = getResources.crudProduct(productId1)
    * def DELETEProductAPI = endpoint + getDELETEProductResource

  @deleteProduct @Sanity @E2E @P1
  Scenario: <P1> Delete Product API
    Given url DELETEProductAPI
    And headers {"Content-type":"application/json"}
    When method DELETE
    Then status 200
    Then match response == "true"

  @Sanity @E2E @P2
  Scenario: <P2> Delete Product API  - Invalid id being passed
    Given url "https://api.escuelajs.co/api/v1/products/-20"
    And headers {"Content-type":"application/json"}
    When method DELETE
    Then status 400
