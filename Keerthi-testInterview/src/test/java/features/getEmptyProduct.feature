#Author: keerthipriya@rfpio.com
Feature: GET Single Products

  Background: 
    * def endpoint = "https://api.escuelajs.co/api"
    * def callCreateProduct =  callonce read('createProduct.feature@createProduct')
    * def productId1 = callCreateProduct.response.id
    * def productTitle = callCreateProduct.response.title
    * def productDescription = callCreateProduct.response.description
    * def productPrice = callCreateProduct.response.price
    * def productcategoryId = callCreateProduct.response.category.id
    * print productId1
    * def getResources = Java.type('utilities.Resources')
    * def getGETSingleProductsResource = getResources.crudProduct(productId1)
    * def GETgetSingleProductAPI = endpoint + getGETSingleProductsResource

  @Sanity @E2E @P1
  Scenario: <P1> Delete and try to GET Product which got deleted
    Given url "https://api.escuelajs.co/api/v1/products/" +productId1
    And headers {"Content-type":"application/json"}
    When method DELETE
    Then status 200
    Given url GETgetSingleProductAPI
    And headers {"Content-type":"application/json"}
    When method PUT
    Then status 400

