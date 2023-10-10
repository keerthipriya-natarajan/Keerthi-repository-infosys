#Author: keerthipriya@rfpio.com
Feature: POST Create Product

  Background: 
    * def endpoint = "https://api.escuelajs.co/api"
    * def getResources = Java.type('utilities.Resources')
    * def getPOSTCreateProductResource = getResources.createProduct()
    * def POSTCreateProductsAPI = endpoint + getPOSTCreateProductResource
    * def P1TestData = read('POSTCreateProduct-P1.json')
    * def P2TestData = read('POSTCreateProduct-P2.json')
    * def P3TestData = read('POSTCreateProduct-P3.json')

  @Sanity @E2E @P1
  @createProduct
  Scenario Outline: <P1> Create Product API - <testDescription>
    Given url POSTCreateProductsAPI
    And headers {"Content-type":"application/json"}
    And request {"title":"<title>","price":<price>,"description":"<description>","categoryId":<categoryId>,"images":["https://placeimg.com/640/480/any"]}
    When method POST
    Then status <httpstatuscode>
    Then match response.title == "<title>"
    Then match response.price == <price>
    Then match response.description == "<description>"
    Then match response.category.id == <categoryId>
    Then match response.id == '#number'

    Examples: 
      | P1TestData |

  @Sanity @E2E @P2
  Scenario Outline: <P1> Create Product API - <testDescription>
    Given url POSTCreateProductsAPI
    And headers {"Content-type":"application/json"}
    And request {"title":"<title>","price":<price>,"description":"<description>","categoryId":<categoryId>,"images":["https://placeimg.com/640/480/any"]}
    When method POST
    Then status <httpstatuscode>

    Examples: 
      | P2TestData |

  @Sanity @E2E @P3
  Scenario Outline: <P1> Create Product API - <testDescription>
    Given url POSTCreateProductsAPI
    And headers {"Content-type":"application/json"}
    And request {"title":"<title>","price":<price>,"description":"<description>","categoryId":<categoryId>,"images":["https://placeimg.com/640/480/any"]}
    When method POST
    Then status <httpstatuscode>

    Examples: 
      | P3TestData |
