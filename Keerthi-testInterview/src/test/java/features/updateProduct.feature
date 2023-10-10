#Author: keerthipriya@rfpio.com
Feature: PUt Update Product

  Background: 
    * def endpoint = "https://api.escuelajs.co/api"
    * def callCreateProduct =  callonce read('createProduct.feature@createProduct')
    * def productId1 = callCreateProduct.response.id
    * def title1 = callCreateProduct.response.title
    * def price1 = callCreateProduct.response.price
    * def getResources = Java.type('utilities.Resources')
    * def getPUtUpdateProductResource = getResources.crudProduct(productId1)
    * def PUTUpdateProductAPI = endpoint + getPUtUpdateProductResource
    * def P1TestData = read('PUTUpdateProduct-P1.json')
    * def P2TestData = read('PUTUpdateProduct-P2.json')
    * def P3TestData = read('PUTUpdateProduct-P3.json')

  @Sanity @E2E @P1
  Scenario Outline: <P1> Update Product API - <testDescription>
    Given url PUTUpdateProductAPI
    And headers {"Content-type":"application/json"}
    And request {"title":"<title>","price":<price>}
    When method PUT
    Then status <httpstatuscode>
    Then match response.title != title1
    Then match response.title  == "<title>"
    Then match response.price != price1
    Then match response.price == <price>
    Then match response.id == productId1

    Examples: 
      | P1TestData |

  @Sanity @E2E @P2
  Scenario Outline: <P2> Update Product API - <testDescription>
    Given url PUTUpdateProductAPI
    And headers {"Content-type":"application/json"}
    And request {"title":"<title>","price":<price>}
    When method PUT
    Then status <httpstatuscode>

    Examples: 
      | P2TestData |

  @Sanity @E2E @P3
  Scenario Outline: <P3> Update Product API - <testDescription>
    Given url PUTUpdateProductAPI
    And headers {"Content-type":"application/json"}
    And request {"title":"<title>","price":<price>}
    When method PUT
    Then status <httpstatuscode>

    Examples: 
      | P3TestData |
