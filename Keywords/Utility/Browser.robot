*** Settings ***
Documentation    This file manages the browser initialization and login process.
Resource	../../GlobalSettings.robot

*** Variables ***

*** Keywords ***
Open Browser On [${CaptureModule}] Logout Form
    ${LoginLink}=    Set Variable    //a[contains(@class,'logged-out-buttons') and text()='Login']
    Create Webdriver    ${Browser}
    Go To    ${BaseUrl}capture/?module=${CaptureModule}&form_id=0
    Wait Until Element Is Visible    ${LoginLink}

Open Browser And Log In With [${Username}] And [${Password}]
    Log In With [${Username}] And [${Password}]
    Post Login Actions

Log In With [${Username}] And [${Password}]
    [Tags]    robot:private
    ${DomainUserLink}=    Set Variable    //a[div[text()='Domain User']]
    ${UsernameInput}=    Set Variable    //div[@id='usernameForm']//input[@name='username']
    ${UsernameNextButton}=    Set Variable    //div[@id='usernameForm']//button[text()='Next' and not(@class='disabled')]
    ${PasswordInput}=    Set Variable    //div[@id='passwordForm']//input[@type='password']
    ${PasswordNextButton}=    Set Variable    //div[@id='passwordForm']//button[text()='Next' and not(@class='disabled')]
    Create Webdriver    ${Browser}
    Go To    ${BaseUrl}
    Wait Until Element Is Visible    ${DomainUserLink}
    Click Element    ${DomainUserLink}
    Wait Until Element Is Visible    ${UsernameInput}
    Input Text    ${UsernameInput}    ${Username}
    Click Button    ${UsernameNextButton}
    Wait Until Element Is Visible    ${PasswordInput}
    Input Password    ${PasswordInput}    ${Password}
    Click Button    ${PasswordNextButton}

Post Login Actions
    ${SecondsElapsed}=    Set Variable    0
    ${SecondsTimeout}=    Set Variable    60
    ${MenuLogo}=    Set Variable    //img[@alt='RLDatix']
    ${LoginProcessComplete}=    Set Variable    False
    WHILE    ${LoginProcessComplete} == False
        # Increment the timer
        Sleep    1s
        ${SecondsElapsed}    Evaluate    ${SecondsElapsed} + 1

        # Case: Logged in table
        Handle Logged In Table

        # Case: User agreement modal
        Handle User Agreement

        # Case: Login message
        Handle Login Message

        # Case: The user has successfully completed the login process
        ${MenuVisible}=    Run Keyword And Return Status    Element Should Be Visible    ${MenuLogo}
        Run Keyword If    ${MenuVisible}    Set Global Variable    ${LoginProcessComplete}    True

        # Case: No page elements were identified within the specified timeframe
        Handle Login Timeout    ${SecondsElapsed}    ${SecondsTimeout}
    END

Handle Login Timeout
    [Tags]    robot:private
    [Arguments]    ${SecondsElapsed}    ${SecondsTimeout}
    Run Keyword If    ${SecondsElapsed} >= ${SecondsTimeout}
    ...    Fail    Login succeeded, but there was an issue processing post-login actions.

Handle Logged In Table
    [Tags]    robot:private
    ${LoggedInTable}=    Set Variable    //table[@id='loggedin-table']
    ${ProceedButton}=    Set Variable    //button[text()='Click here to proceed']
    ${TableVisible}=    Run Keyword And Return Status    Element Should Be Visible    ${LoggedInTable}
    Run Keyword If    ${TableVisible}    Click Button    ${ProceedButton}

Handle User Agreement
    [Tags]    robot:private
    ${UserAgreementButton}=    Set Variable    //button[contains(text(),'Accept') and ../h2[text()='User agreement']]
    ${UserAgreementVisible}=    Run Keyword And Return Status    Element Should Be Visible    ${UserAgreementButton}
    Run Keyword If    ${UserAgreementVisible}    Click Button    ${UserAgreementButton}

Handle Login Message
    ${LoginMessageButton}=    Set Variable    //button[text()='Click here to proceed' and ../../div[@id='url' and @class='authForm__panel']]
    ${LoginMessageVisible}=    Run Keyword And Return Status    Element Should Be Visible    ${LoginMessageButton}
    Run Keyword If    ${LoginMessageVisible}    Click Button    ${LoginMessageButton}
