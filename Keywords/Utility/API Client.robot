*** Settings ***
Documentation    This resource file is an API client.
Library    RequestsLibrary
Library    SeleniumLibrary
Library    String
Resource	../../Keywords/Utility/Browser.robot

*** Variables ***
${BearerToken}
${DefaultRequestHeaders}

*** Keywords ***
Set Default Request Headers
    Set Bearer Token
    Set Default Header Properties

Set Bearer Token
    [Tags]    robot:private
    ${CookieName}=    Set Variable    datix.jwtToken
    Set Execution Profile
    Open Browser And Log In With [${AdminUsername}] And [${AdminPassword}]
    ${Cookies}=    Get Cookies
    Close All Browsers
    ${Cookies}=    Split String    ${Cookies}    ;${SPACE}
    ${Cookies}=    Evaluate    [item for item in ${Cookies} if '${CookieName}' in item]
    ${Cookie}=    Get From List    ${Cookies}    0
    ${Cookie}=    Split String    ${Cookie}    =
    ${CookieValue}=    Get From List    ${Cookie}    1
    Set Global Variable    ${BearerToken}    ${CookieValue}

Set Default Header Properties
    [Tags]    robot:private
    &{HeaderProperties}=    Create Dictionary
    ...    Accept=*/*
    ...    Accept-Encoding=gzip, deflate, br
    ...    Connection=keep-alive
    ...    Content-Type=application/json
    ...    Authorization=Bearer ${BearerToken}
    Set Global Variable    ${DefaultRequestHeaders}    ${HeaderProperties}
