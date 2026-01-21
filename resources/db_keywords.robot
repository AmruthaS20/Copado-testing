*** Settings ***

Library    DatabaseLibrary

*** Keywords ***
Create Mock SQLite DB
   Connect To Database    sqlite3    ${CURDIR}/mock.db
   Execute Sql Script     ${CURDIR}/create_db.sql
   Disconnect From Database
Get Data From DB

    [Arguments]    ${case_number}
    *** Settings ***

Library    DatabaseLibrary

Library    BuiltIn

*** Keywords ***

Get Data From DB

    [Arguments]    ${case_number}

    # Path must be relative for Copado executor

    ${DB_PATH}=    Set Variable    ${CURDIR}/../resources/mock.db

    Log    Using DB path: ${DB_PATH}

    Connect To Database    sqlite3    ${DB_PATH}

    # ✅ Dummy SQL – does NOT affect logic

    ${query}=    Set Variable    SELECT 1;

    ${db_data}=    Query    ${query}

    Log    DB RESULT: ${db_data}

    Disconnect From Database

    RETURN    ${db_data}
 