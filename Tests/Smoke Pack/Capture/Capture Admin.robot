*** Settings ***
Documentation    Test Suite - Capture Admin.
Resource	../../../Keywords/Utility/Browser.robot
Test Teardown    Close All Browsers

*** Variables ***
${EnvironmentVariablesTable}    //table[@class='environment-variables']
${EnvironmentVariables}    //table[
...                            .//div[text()='ADMIN_EMAIL']/../..//div[text()='noreply@rldatix.cloud'] and
...                            .//div[text()='BASE_URL']/../..//div[text()='${BaseUrl}capture/']
...                        ]

*** Test Cases ***
91223 Environment Variables
    [Tags]    TC_91223
    Open Browser And Log In With [${AdminUsername}] And [${AdminPassword}]
    Go To    ${BaseUrl}capture/?action=environmentvariables
    Wait Until Page Contains Element    ${EnvironmentVariablesTable}
    Wait Until Page Contains Element    ${EnvironmentVariables}
