Feature: Accessors

  Scenario: Accessing a Salesforce Text Field
    Given I am viewing a SFDC object record
    When I invoke the sfdc_text_field method for a SFDC text custom field on the page
    Then the value of that field is returned
    When I edit the object record
    And I invoke the sfdc_text_field method for a SFDC text custom field on the page
    Then Then the value of that field is returned

