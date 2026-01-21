*** Settings ***

Library    DatabaseLibrary
Resource  ../resources/db_data.robot  


*** Keywords ***

Get Data From DB

    [Arguments]    ${case_number}   

    # Path must be relative for Copado executor

    ${DB_PATH}=    Set Variable    ${CURDIR}/../resources/mock.db

    Log    Using DB path: ${DB_PATH}

    Connect To Database    sqlite3    ${DB_PATH}

    # ✅ Dummy SQL – does NOT affect logic

    ${query}=    Set Variable    SELECT 00001002;

    ${db_data}=    Query    ${query}

    Log    DB RESULT: ${db_data}

    Disconnect From Database

    RETURN    ${db_data}
    
       IF    '${Case_Number}' == '00001002'
       ${case_data}=    Set Variable    &{DB_CASE_00001002}
   ELSE
       Fail    Case ID not found in mock DB
   END
   Log         DB DATA TYPE: ${case_data}
   RETURN    ${case_data}
 