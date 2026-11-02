*** Settings ***
Documentation    This file manages the browser initialization and login process.
Resource	../../GlobalSettings.robot

*** Variables ***

*** Keywords ***
Open Browser And Log In With [${Username}] And [${Password}]
    ${MenuLogo}=    Set Variable    //img[@alt='RLDatix']
    Log In With [${Username}] And [${Password}]
    Handle Logged In Table
    Wait Until Element Is Visible    ${MenuLogo}

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

Handle Logged In Table
    [Tags]    robot:private
    ${LoggedInTable}=    Set Variable    //table[@id='loggedin-table']
    ${ProceedButton}=    Set Variable    //button[text()='Click here to proceed']
    ${ElementStatus}=    Run Keyword And Return Status    Wait Until Page Contains Element    ${LoggedInTable}    timeout=2s
    Run Keyword If    '${ElementStatus}' == 'True'    Click Button    ${ProceedButton}






Post Login Actions
    ${SecondsElapsed}=    Set Variable    0
    ${SecondsTimeout}=    Set Variable    60
    ${LoginProcessComplete}=    Set Variable    False
    WHILE    ${LoginProcessComplete} == False
        # Increment the timer
        Sleep    1s
        ${SecondsElapsed}    Evaluate    ${SecondsElapsed} + 1

        # Case: No page elements were identified within the specified timeframe
        Run Keyword If    ${SecondsElapsed} >= ${SecondsTimeout}
        ...    Fail    Login succeeded, but there was an issue processing post-login actions.


        # Case: The user has successfully logged in
        # Run Keyword If    ${SecondsElapsed} >= ${SecondsTimeout}    Run Keywords
        # ...    Set Global Variable    ${LoginProcessComplete}    True



        Log To Console    \n${SecondsElapsed} >= ${SecondsTimeout}
        Log To Console    \n${LoginProcessComplete}
    END


Open Browser On [${CaptureModule}] Logout Form
    ${LoginLink}=    Set Variable    //a[contains(@class,'logged-out-buttons') and text()='Login']
    Create Webdriver    ${Browser}
    Go To    ${BaseUrl}capture/?module=${CaptureModule}&form_id=0
    Wait Until Element Is Visible    ${LoginLink}
