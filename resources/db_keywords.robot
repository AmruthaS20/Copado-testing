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
   ...    SELECT case_number, Name, Subject, Status, Date_Time
   ...    FROM cases
   ...    WHERE case_number= '${case_number}'
   
   Should Not Be Empty    ${rows}
   ${row}=    Set Variable    ${rows[0]}
   ${data}=    Create Dictionary
   ...    Case_Number=${row}[0]
   ...    Name=${row}[1]
   ...    Subject=${row}[2]
   ...    Status=${row}{3}
   ...    Date_Time=${row}{4}
   RETURN    ${data}