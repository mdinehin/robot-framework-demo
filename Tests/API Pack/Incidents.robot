*** Settings ***
Documentation    Test Suite - API Incidents

Resource	../../Keywords/Utility/API Client.robot

Suite Setup    Set up API data
Suite Teardown    Tear down API data

*** Test Cases ***
101457 API GET Incidents
    [Tags]    TC_101457
    Log To Console    Step 1
    Log To Console    Step 2
    Log To Console    Step 3
