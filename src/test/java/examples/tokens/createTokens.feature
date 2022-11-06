Feature: E2E Tests for creating tokens

  Background: create the base url
    * url 'http://localhost'

  Scenario: Test E2E 1) Create a token for admin and get 201 status
    Given path '/tokens'
    And request {"username": "admin", "password": "admin"}
    And headers {Accept : "application/json", Content-type : "application/json"}
    When method post
    And status 201

  Scenario: Test E2E 2) Create a token (a token which i still valid) for admin and get 200 status
    Given path '/tokens'
    And request {"username": "admin", "password": "admin"}
    And headers {Accept : "application/json", Content-type : "application/json"}
    When method post
    And status 200

  Scenario: Test E2E 2) Create a token for non authorized user and get 401 status
    Given path '/tokens'
    And request {"username": "admin", "password": "testBidon"}
    And headers {Accept : "application/json", Content-type : "application/json"}
    When method post
    And status 401

