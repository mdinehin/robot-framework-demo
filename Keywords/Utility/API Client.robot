*** Settings ***
Documentation    This is an API client.
Library    RequestsLibrary
Library    SeleniumLibrary
Library    String
Resource	../../Keywords/Utility/Browser.robot

*** Variables ***
${BearerToken}
${DefaultHeaderProperties}

*** Keywords ***
Set Default Header Properties
    Set Bearer Token
    &{HeaderProperties}=    Create Dictionary
    ...    Accept=*/*
    ...    Accept-Encoding=gzip, deflate, br
    ...    Connection=keep-alive
    ...    Content-Type=application/json
    ...    Authorization=Bearer ${BearerToken}
    Set Global Variable    ${DefaultHeaderProperties}    ${HeaderProperties}

Set Bearer Token
    ${CookieName}=    Set Variable    datix.jwtToken
    Set Execution Profile
    Open Browser And Log In With [${AdminUsername}] And [${AdminPassword}]
    ${Cookies}=    Get Cookies
    ${Cookies}=    Split String    ${Cookies}    ;${SPACE}
    ${Cookies}=    Evaluate    [item for item in ${Cookies} if '${CookieName}' in item]
    ${Cookie}=    Get From List    ${Cookies}    0
    ${Cookie}=    Split String    ${Cookie}    =
    ${CookieValue}=    Get From List    ${Cookie}    1
    Set Global Variable    ${BearerToken}    ${CookieValue}
