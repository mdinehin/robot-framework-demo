*** Settings ***
Documentation    This file manages the browser initialization.
Resource	../../GlobalSettings.robot

*** Variables ***
${DomainUserLink}    //a[div[text()='Domain User']]
${UsernameInput}    //div[@id='usernameForm']//input[@name='username']
${UsernameNextButton}    //div[@id='usernameForm']//button[text()='Next' and not(@class='disabled')]
${PasswordInput}    //div[@id='passwordForm']//input[@type='password']
${PasswordNextButton}    //div[@id='passwordForm']//button[text()='Next' and not(@class='disabled')]
${LoggedInTable}    //table[@id='loggedin-table']
${ProceedButton}    //button[text()='Click here to proceed']
${MenuLogo}    //img[@alt='RLDatix']
${LoginLink}    //a[contains(@class,'logged-out-buttons') and text()='Login']

*** Keywords ***
Open Browser And Log In With [${Username}] And [${Password}]
    Log In With [${Username}] And [${Password}]
    Handle Logged In Table
    Wait Until Element Is Visible    ${MenuLogo}

Log In With [${Username}] And [${Password}]
    [Tags]    robot:private
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
    ${ElementStatus}=    Run Keyword And Return Status    Wait Until Page Contains Element    ${LoggedInTable}    timeout=2s
    Run Keyword If    '${ElementStatus}' == 'True'    Click Button    ${ProceedButton}

Open Browser On [${CaptureModule}] Logout Form
    Create Webdriver    ${Browser}
    Go To    ${BaseUrl}capture/?module=${CaptureModule}&form_id=0
    Wait Until Element Is Visible    ${LoginLink}
