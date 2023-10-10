#Author: keerthipriya@rfpio.com
Feature: GET All Products

  Background: 
    * def endpoint = "https://api.escuelajs.co/api"
    * def getResources = Java.type('utilities.Resources')
    * def getGETAllProductsResource = getResources.getAllProducts()
    * def GETgetAllProductsAPI = endpoint + getGETAllProductsResource

  @Sanity @E2E @P1
  Scenario: <P1> GET ALL Products API - <testDescription>
    Given url GETgetAllProductsAPI
    And headers {"Content-type":"application/json"}
    When method GET
    Then status 200

  @Sanity @E2E @P2
  Scenario: <P2> Create Product API - Invalid endpoint
    Given url "https://api.escuelajs.co/api/v1/products-invalid"
    And headers {"Content-type":"application/json"}
    When method GET
    Then status 404
