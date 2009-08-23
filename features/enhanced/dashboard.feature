Feature: Dashboard
    In order for users to play around
    Things should work properly

    Scenario: Prepopulated data
        Given I am logged in as "http://example.com/"
        Then I should see "Drew"
        And I should see "Harry"
        And I Should see "John"

    Scenario: Move it over
        Given I am logged in as "http://example.com/"
        When I Drag "Drew" to "calculations"
