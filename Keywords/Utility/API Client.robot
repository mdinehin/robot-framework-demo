*** Settings ***
Documentation    This is an API client.
Library    RequestsLibrary
Resource	../../Libraries/Execution Profile.robot

*** Keywords ***
Set up API data
    Log To Console    API > ${BaseUrl}

Tear down API data
    Log To Console    API > END
