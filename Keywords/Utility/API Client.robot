*** Settings ***
Documentation    This is an API client for DCIQ

Library    RequestsLibrary

Resource	../../GlobalSettings.robot

*** Keywords ***
Set up API data
    Log To Console    API > ${BaseUrl}

Tear down API data
    Log To Console    API > END
