*** Settings ***
Library    DatabaseLibrary
Library    OperatingSystem
Library    String
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

   # --- SQL for design clarity 

    ${normalized_case}=    Convert To Integer    ${case_number}
     ${query}=    Set Variable
   ...    SELECT case_number, name, status, subject, date_time
   ...    FROM case_test
   ...    WHERE case_number='${case_number}';
   Log    SQL intended for execution: ${query}
   
  
   ${key}=    Set Variable    CASE_${case_number}
   ${db_data}=    Get Variable Value    &{${key}}
   RETURN    ${db_data}