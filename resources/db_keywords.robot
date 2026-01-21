*** Settings ***

Library    DatabaseLibrary

*** Keywords ***

Get Data From DB

    [Arguments]    ${case_number}
    Connect To Database    sqlite3    ${CURDIR}/mock.db
    ${query}=    Set Variable
    ...    SELECT case_number, name, subject, status, date_time
    ...    FROM cases
    ...    WHERE case_number='${case_number}';
    ${result}=    Query    ${query}

    Disconnect From Database

    Run Keyword If    '${result}' == '[]'

    ...    Fail    No DB data found for case ${case_number}

    RETURN    ${result}
  