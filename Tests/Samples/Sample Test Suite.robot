# This file contains samples of scripts that were created during the completion of a Robot Framework course.
# Course: Robot Framework with Python - Selenium/API Automation Testing
# URL: https://www.udemy.com/course/robot-framework-with-python-selenium/

*** Settings ***
Documentation    This is a sample test suite.
Library    RequestsLibrary
Library    String
Library    ../../Keywords/Utility/Helpers.py
Resource	../../Keywords/Utility/Browser.robot
Suite Setup    Set Execution Profile
Test Teardown    Close All Browsers

*** Variables ***

*** Test Cases ***
Sample For Loop
    [Tags]    sample_for_loop
    [Documentation]    Log to console menu items from the top menu
    ${MenuItems}=    Set Variable    ul[@id='toolkit-nav']/li/a/span
    ${TopMenu}=    Set Variable    //div[count(${MenuItems}) >= 4]
    ${TopMenuItems}=    Set Variable    //${MenuItems}
    Open Browser And Log In With [${AdminUsername}] And [${AdminPassword}]
    Wait Until Element Is Visible    ${TopMenu}
    @{TopMenuWebElements}=    Get WebElements    ${TopMenuItems}
    ${ListLength}=    Get Length    ${TopMenuWebElements}
    ${Expression}=    Evaluate    ${ListLength} == 4 or ${ListLength} == 5
    Should Be True    ${Expression}
    ${Index}=    Set Variable    0
    FOR    ${MenuWebElement}    IN    @{TopMenuWebElements}
        ${ElementText}=    Set Variable    ${MenuWebElement.text}
        Exit For Loop If    '${ElementText}' == 'Assess'
        ${Index}=    Evaluate    ${Index} + 1
        Log To Console    Menu item at position ${Index}: ${ElementText}
    END

Sample Radio Button Click
    [Tags]    sample_radio_click
    [Documentation]    Click a radio button and verify if it is selected
    ${RiskMatrixTable}=    Set Variable    //table[contains(@class,'risk-matrix')]//tr[7]/td[5]
    ${RadioValueAttribute}=    Set Variable    1,5
    ${SampleRadioButton}=    Set Variable    //input[@value='${RadioValueAttribute}' and @type='radio']
    Open Browser And Log In With [${AdminUsername}] And [${AdminPassword}]
    Go To    ${BaseUrl}#/risk-register/risks/new
    Wait Until Element Is Visible    ${RiskMatrixTable}
    ${RadioNameAttribute}=    Get Element Attribute    ${SampleRadioButton}    name
    ${AllRiskMatrixRadioButtons}=    Set Variable    //input[@name='${RadioNameAttribute}' and @type='radio']
    Page Should Contain Radio Button    ${AllRiskMatrixRadioButtons}
    Radio Button Should Not Be Selected    ${RadioNameAttribute}
    Select Radio Button    ${RadioNameAttribute}    ${RadioValueAttribute}
    # Verify radio button
    Radio Button Should Be Set To    ${RadioNameAttribute}    ${RadioValueAttribute}
    # Return True or False
    ${WebElement}=    Get WebElement    ${SampleRadioButton}
    ${RadioCheckedStatus}=    Execute Javascript    return arguments[0].checked    ARGUMENTS    ${WebElement}
    Log To Console    \nQ: Is the radio button checked? A: ${RadioCheckedStatus}

Sample Checkbox Click
    [Tags]    sample_checkbox_click
    [Documentation]    Select and unselect a checkbox, and verify its states
    ${WasAnyPersonInvolvedCheckbox}=    Set Variable    //input[@id='show_person']
    Open Browser On [INC] Logout Form
    Checkbox Should Not Be Selected    ${WasAnyPersonInvolvedCheckbox}
    Select Checkbox    ${WasAnyPersonInvolvedCheckbox}
    Checkbox Should Be Selected    ${WasAnyPersonInvolvedCheckbox}
    Unselect Checkbox    ${WasAnyPersonInvolvedCheckbox}
    Checkbox Should Not Be Selected    ${WasAnyPersonInvolvedCheckbox}

Sample Drop-Down Select
    [Tags]    sample_drop-down_select
    [Documentation]    Select a drop-down option and verify the selected value
    ${LocaleSelect}=    Set Variable    //select[@name='locale']
    Create Webdriver    ${Browser}
    Go To    ${BaseUrl}
    Page Should Contain List    ${LocaleSelect}
    Select From List By Value    ${LocaleSelect}    fr-CA
    # Verify selected option
    ${SelectedValue}=    Get Selected List Value    ${LocaleSelect}
    Log To Console    ${SelectedValue}
    List Selection Should Be    ${LocaleSelect}    fr-CA
    ${AllValues}=    Get List Items    ${LocaleSelect}    True
    Log To Console    ${AllValues}

Sample Window Switch
    [Tags]    sample_window_switch
    [Documentation]    Switch to a new window tab and go back to the main tab
    ${MatchingContactsButton}=    Set Variable    //button[span[text()='Check for matching contacts']]
    ${ContactListTitleRow}=    Set Variable    //td[@class='title-row']
    ${ContactListCancelButton}=    Set Variable    //input[@value='Cancel']
    Open Browser And Log In With [${AdminUsername}] And [${AdminPassword}]
    Go To    ${BaseUrl}capture/?action=linkcontactgeneral&module=INC&main_recordid=4&formtype=Edit&link_type=A&fromsearch=1
    Wait Until Element Is Visible    ${MatchingContactsButton}
    Click Button    ${MatchingContactsButton}
    Switch Window    NEW
    Wait Until Element Is Visible    ${ContactListTitleRow}
    Element Text Should Be    ${ContactListTitleRow}    Matching contacts
    Click Element    ${ContactListCancelButton}
    # Reopen the second window tab
    Switch Window    MAIN
    Click Button    ${MatchingContactsButton}
    Switch Window    NEW
    Wait Until Element Is Visible    ${ContactListTitleRow}
    Element Text Should Be    ${ContactListTitleRow}    Matching contacts

Sample Text String Split
    [Tags]    sample_string_split
    [Documentation]    Split a text string
    ${FormHeading}=    Set Variable    //div[@id='heading']/h2
    Open Browser On [INC] Logout Form
    Wait Until Element Is Visible    ${FormHeading}
    ${HeadingText}=    Get Text    ${FormHeading}
    @{HeadingParts}=    Split String    ${HeadingText}    (    # split by the left parentheses character
    ${LeadingPart}=    Get From List    ${HeadingParts}    0
    @{AllParts}=    Split String    ${LeadingPart}             # leave the 2nd argument blank to split by whitespace
    Log To Console    \nDCIQ form module: ${AllParts}[1]       # square brackets can be used as a Get From List alternative

Sample Custom Library
    [Tags]    sample_custom_library
    [Documentation]    Use keywords from a custom python file
    @{ListOfItems}=    Create List    a1    b2    c3    d4
    ${Timestamp}=    Get Epoch Unix Timestamp
    Log To Console    \nEpoch unix timestamp: ${Timestamp}
    Join List Of Items    ${ListOfItems}
    Open Browser On [INC] Logout Form
    Use Selenium Library Instance

Sample GET Request
    [Documentation]    Get a random Chuck Norris joke from a public API endpoint
    [Tags]    sample_get_request
    Create Session    SessionBaseUrl    https://api.chucknorris.io/    disable_warnings=1    debug=1
    ${Response}=    GET On Session    SessionBaseUrl    jokes/random
    ${ParsedResponse}=    Set Variable    ${Response.json()}
    Dictionary Should Contain Key    ${ParsedResponse}    value
    ${RandomJoke}=    Get From Dictionary    ${ParsedResponse}    value
    Log To Console    \n\nRandom joke:\n${RandomJoke}\n
    # Alternative ways for accessing a dictionary
    # Log To Console    \n\nRandom joke:\n${ParsedResponse['value']}\n
    # Log To Console    \n\nRandom joke:\n${ParsedResponse}[value]\n
    Log To Console    \n\nExecutionProfile: ${ExecutionProfile}

Sample POST Request
    [Documentation]    Post some random data to a public API endpoint
    [Tags]    sample_post_request
    ${TestStamp}=    Get Epoch Unix Timestamp
    ${RequestBody}=    Create Dictionary    name=Random_Name_${TestStamp}    job=Random_Job_${TestStamp}
    Create Session    SessionBaseUrl    https://reqres.in/    disable_warnings=1    debug=1
    ${Response}=    POST On Session    SessionBaseUrl    api/users    json=${RequestBody}    expected_status=201
    Status Should Be    201    ${Response}                     # alternative for expected_status
    ${ParsedResponse}=    Set Variable    ${Response.json()}
    Dictionary Should Contain Key    ${ParsedResponse}    id
    Dictionary Should Contain Key    ${ParsedResponse}    createdAt
    Log To Console    \nNew user record created successfully:\n${ParsedResponse}
