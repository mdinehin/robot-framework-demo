*** Settings ***
Documentation    This resource file manages the execution profile data by initializing default values.
Library    SeleniumLibrary    timeout=10    implicit_wait=10.0
Library    execution_profile_data.py
Library    Collections

*** Variables ***
${ExecutionProfile}    # Defines environment-specific settings and configuration values.
${BaseUrl}    # Primary web address or root endpoint of the application under test.
${AdminUsername}
${AdminPassword}
${Browser}    Chrome
${RootDirectory}    # ToDo: Set this variable on the command line with the --variable option.

*** Keywords ***
Set Execution Profile
    ${ProfileData}=    Get Execution Profile Data    ${ExecutionProfile}
    Should Not Be Empty    ${ProfileData}
    ...    The execution profile "${ExecutionProfile}" could not be found. Please verify the profile name and try again.
    Dictionary Should Contain Key    ${ProfileData}    BaseUrl
    Dictionary Should Contain Key    ${ProfileData}    AdminUsername
    Dictionary Should Contain Key    ${ProfileData}    AdminPassword
    Set Global Variable    ${BaseUrl}    ${ProfileData['BaseUrl']}
    Set Global Variable    ${AdminUsername}    ${ProfileData['AdminUsername']}
    Set Global Variable    ${AdminPassword}    ${ProfileData['AdminPassword']}
