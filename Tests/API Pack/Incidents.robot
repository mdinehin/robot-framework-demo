*** Settings ***
Documentation    Test Suite - API Incidents.
Resource	../../Keywords/Utility/API Client.robot
Suite Setup    Set Default Header Properties

*** Test Cases ***
101457 API GET Incidents
    [Tags]    TC_101457
    Log To Console    ${\n}${DefaultHeaderProperties}
#    Create Session    SessionBaseUrl    https://api.chucknorris.io/    disable_warnings=1    debug=1
#    ${Response}=    GET On Session    SessionBaseUrl    jokes/random
#    ${ParsedResponse}=    Set Variable    ${Response.json()}
#    Dictionary Should Contain Key    ${ParsedResponse}    value
