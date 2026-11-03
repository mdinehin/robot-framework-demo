# This file contains samples of scripts that were created during the completion of a Robot Framework course.
# Course: Robot Framework with Python - Selenium/API Automation Testing
# URL: https://www.udemy.com/course/robot-framework-with-python-selenium/

*** Settings ***
Documentation    This sample test suite runs all its test cases using a test template.
Resource	../../GlobalSettings.robot
Suite Setup    Set Execution Profile
Test Template    Sample Template

*** Test Cases ***
Sample Test A    a1    a2
Sample Test B    b1    b2
Sample Test C    c1    c2

*** Keywords ***
Sample Template
    [Arguments]    ${Argument1}    ${Argument2}
    # Note: Template tags [Tags] don't appear to work
    Log To Console    ${\n}This is a template keyword used by all test cases in this suite
    Log To Console    Arguments: ${Argument1}, ${Argument2}
