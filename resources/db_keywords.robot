*** Settings ***
Library    DatabaseLibrary
Library    OperatingSystem
Library    String
Library    Collections
Resource    ../db_data.robot

*** Variables ***

${DB_HOST}      db.lycgvxeibrmzcicmfruh.supabase.co
${DB_USER}      postgres
${DB_PASSWORD}    Sathyanarayana@20
${DB_PORT}      5432
${DB_ENGINE}    psycopg2
${DB_NAME}    postgres

*** Keywords ***
Get Data from DB

    [Arguments]    ${case_number}

   ${rows}=    Query
   ...    SELECT case_number, status, priority
   ...    FROM cases
   ...    WHERE case_number ${case_number}
   
   Should Not Be Empty    ${rows}
   ${row}=    Set Variable    ${rows[0]}
   ${data}=    Create Dictionary
   ...    Case_Number=${row}[0]
   ...    Status=${row}[1]
   ...    Priority=${row}[2]
   RETURN    ${data}