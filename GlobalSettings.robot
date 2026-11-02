*** Settings ***
Documentation    This file manages global variables by initializing default values.
Library    SeleniumLibrary    timeout=10    implicit_wait=10.0
Library    Libraries/ExecutionProfileData.py
Library    Collections

*** Variables ***
${ExecutionProfile}
${BaseUrl}
${AdminUsername}
${AdminPassword}
${Browser}    Chrome
${NumberOfRetries}    0

*** Keywords ***
Set Execution Profile
    ${ProfileData}=    Get Execution Profile Data    ${ExecutionProfile}
    Dictionary Should Contain Key    ${ProfileData}    BaseUrl
    Dictionary Should Contain Key    ${ProfileData}    AdminUsername
    Dictionary Should Contain Key    ${ProfileData}    AdminPassword
    Set Global Variable    ${BaseUrl}    ${ProfileData['BaseUrl']}
    Set Global Variable    ${AdminUsername}    ${ProfileData['AdminUsername']}
    Set Global Variable    ${AdminPassword}    ${ProfileData['AdminPassword']}
