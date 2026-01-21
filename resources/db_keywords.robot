*** Settings ***

Library    DatabaseLibrary
L

*** Keywords ***

Create Mock SQLite DB

    [Documentation]    Creates SQLite DB and inserts mock data
    Connect To Database    sqlite3    ${CURDIR}/mock.db
    Execute Sql Script     ${CURDIR}/create_db.sql
    Disconnect From Database

Get Data From DB

    [Arguments]    ${case_number}
    [Documentation]    Fetch case data using SQL
    Connect To Database    sqlite3    ${CURDIR}/mock.db
    ${result}=    Query
    ...    SELECT case_number,
    ...           name,
    ...           subject,
    ...           status,
    ...           date_time
    ...    FROM cases
    ...    WHERE case_number='${case_number}';

    Disconnect From Database

    Run Keyword If    '${result}' == '[]'

    ...    Fail    No DB data found for case ${case_number}

    RETURN    ${result}
 