*** Settings ***

Library    DatabaseLibrary

*** Keywords ***
Create Mock SQLite DB
   Connect To Database    sqlite3    ${CURDIR}/mock.db
   Execute Sql Script     ${CURDIR}/create_db.sql
   Disconnect From Database
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
  