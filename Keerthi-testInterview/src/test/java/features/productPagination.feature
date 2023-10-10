#Author: keerthipriya@rfpio.com
Feature: GET All Products

  Background: 
    * def endpoint = "https://api.escuelajs.co/api"
    * def offset = 0;
    * def limit = 10;
    * def getResources = Java.type('utilities.Resources')
    * def getGETProductsByPaginaitonResource = getResources.paginationMethod(offset, limit)
    * def GETApplyPaginationforProductsAPI = endpoint + getGETProductsByPaginaitonResource

  @Sanity @E2E @P1
  Scenario: <P1> GET Products by Pagination API
    Given url GETApplyPaginationforProductsAPI
    And headers {"Content-type":"application/json"}
    When method GET
    Then status 200

  @Sanity @E2E @P2
  Scenario: <P2> GET Products by Pagination API - Invalid endpoint
    Given url "https://api.escuelajs.co/api/v1/products-invalid"
    And headers {"Content-type":"application/json"}
    When method GET
    Then status 404
