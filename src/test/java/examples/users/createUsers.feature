Feature: E2E Tests for creating users
  Background: create the base url
    * url baseUrl

  Scenario: Test E2E 1) Create a user and get 201 status
    Given path '/tokens'
    And request {"username": "admin", "password": "admin"}
    And headers {Accept : "application/json", Content-type : "application/json"}
    When method post
    #And status 201
    * def token = response.token
    #Create user for
    Given path '/users'
    Given header Authorization = 'Bearer ' + token
    And request {"username": "test", "password": "test"}
    When method post
    And status 201

  Scenario: Test E2E 2) Create a duplicate user and get 409 (Conflict) status
    Given path '/tokens'
    And request {"username": "admin", "password": "admin"}
    And headers {Accept : "application/json", Content-type : "application/json"}
    When method post
    #And status 201
    * def token = response.token
    #Create user for
    Given path '/users'
    Given header Authorization = 'Bearer ' + token
    And request {"username": "test", "password": "test"}
    When method post
    And status 409

  Scenario: Test E2E 3) Create a duplicate user and get 401 (Unauthorized) status
    Given path '/tokens'
    And request {"username": "admin", "password": "admin"}
    And headers {Accept : "application/json", Content-type : "application/json"}
    When method post
    #And status 201
    * def token = response.token
    #Create user for
    Given path '/users'
    # using a bidon token
    Given header Authorization = 'Bearer 0e946fc6a681c207252765e6dfc1293f55d220a7b716d7399d3b359c1931b70b'
    And request {"username": "test", "password": "test"}
    When method post
    And status 401

  Scenario: Test E2E 3) Create a duplicate user and get 403 (Forbidden) status
    Given path '/tokens'
    # test user will not be able to create user
    And request {"username": "test", "password": "test"}
    And headers {Accept : "application/json", Content-type : "application/json"}
    When method post
    #And status 201
    * def token = response.token
    #Create user for
    Given path '/users'
    # using a bidon token
    Given header Authorization = 'Bearer ' + token
    And request {"username": "test", "password": "test"}
    When method post
    And status 403
