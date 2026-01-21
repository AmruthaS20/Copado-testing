*** Settings ***

Library    DatabaseLibrary

*** Keywords ***
Create Mock SQLite DB
   Connect To Database    sqlite3    ${CURDIR}/mock.db
   Execute Sql Script     ${CURDIR}/create_db.sql
   Disconnect From Database
Get Data From DB

    [Arguments]    ${case_number}
    ${DB_PATH}=    Set Variable    ${CURDIR}/../resources/mock.db
   Log    Using DB path: ${DB_PATH}
   Connect To Database    sqlite3    ${DB_PATH}
   ${query}=    Set Variable    SELECT case_number, name, subject, status, date_time FROM cases WHERE case_number='${case_number}';
   ${db_data}=    Query    ${query}

    Log    DB RESULT: ${db_data}
 
   ${db_result}=    Query    ${query}
   RETURN    ${db_result}
  