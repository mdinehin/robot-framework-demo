*** Settings ***
Documentation    Test Suite - API Incidents.
Resource	../../Keywords/Utility/API Client.robot
Suite Setup    Set Default Request Headers

*** Test Cases ***
101457 API GET Incidents
    [Tags]    TC_101457
    ${Endpoint}=    Set Variable    capture/api/incidents
    &{UrlParameters}=    Create Dictionary    days_previous=30    login=${AdminUsername}
    Create Session    SessionBaseUrl    ${BaseUrl}    headers=${DefaultRequestHeaders}    disable_warnings=1    debug=1
    ${Response}=    GET On Session
    ...    SessionBaseUrl    ${Endpoint}    params=${UrlParameters}    expected_status=201    allow_redirects=True
    ${IncidentRecords}=    Set Variable    ${Response.json()}
    Should Not Be Empty    ${IncidentRecords}
    ${IncidentRecord}=    Get From List    ${IncidentRecords}    0
    Dictionary Should Contain Key    ${IncidentRecord}    id
    Dictionary Should Contain Key    ${IncidentRecord}    incidentStatus
