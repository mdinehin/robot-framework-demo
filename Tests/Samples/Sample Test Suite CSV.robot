# This file contains samples of scripts that were created during the completion of a Robot Framework course.
# Course: Robot Framework with Python - Selenium/API Automation Testing
# URL: https://www.udemy.com/course/robot-framework-with-python-selenium/

*** Settings ***
Documentation    This sample test suite runs test cases from a CSV file using a test template.
Library    DataDriver    file=../../Resources/sample-data.csv    encoding=utf_8    dialect=excel
Resource	../../Libraries/Execution Profile.robot
Suite Setup    Set Execution Profile
Test Template    Sample Template

*** Test Cases ***
Default CSV Test With ID: ${Argument1}    z1    z2    # default arguments if CSV file is not found

*** Keywords ***
Sample Template
    [Arguments]    ${Argument1}    ${Argument2}
    Log To Console    ${\n}This is a template keyword used by all test cases in the CSV file
    Log To Console    Arguments: ${Argument1}, ${Argument2}
