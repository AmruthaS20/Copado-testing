*** Settings ***

Library    DatabaseLibrary

*** Keywords ***
Create Mock SQLite DB
   Connect To Database    sqlite3    ${CURDIR}/mock.db
   Execute Sql Script     ${CURDIR}/create_db.sql
   Disconnect From Database
Get Data From DB

    [Arguments]    ${case_number}
    Connect To Database    sqlite3    /home/executor/execution/Copado-testing/resources/mock.db
   ${query}=    Set Variable    SELECT case_number, name, subject, status, date_time FROM cases WHERE case_number='${case_number}';
   ${db_result}=    Query    ${query}
   RETURN    ${db_result}
  