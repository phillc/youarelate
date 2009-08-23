Feature: Dashboard
    In order for users to play around
    Things should work properly

    Scenario: Prepopulated data
        Given I am logged in as "https://www.google.com/accounts/o8/id"
        Then I should see "Drew"
        And I should see "Harry"
        And I Should see "John"

    Scenario: Move it over
        Given I am logged in as "https://www.google.com/accounts/o8/id"
        When I Drag "Drew" to "calculations"
