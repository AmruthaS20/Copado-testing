*** Settings ***
Library    DatabaseLibrary

*** Variables ***

${DB_HOST}      db.lycgvxeibrmzcicmfruh.supabase.co
${DB_USER}      postgres
${DB_PASSWORD}    Sathyanarayana@20
${DB_PORT}      5432
${DB_ENGINE}    psycopg2
${DB_NAME}    postgres

*** Keywords ***
Connect To Cloud DB

    connect To Database
    ...    ${DB_ENGINE}
    ...    ${DB_NAME}
    ...    ${DB_HOST}
    ...    ${DB_USER}
    ...    ${DB_PASSWORD}
    ...    ${DB_PORT}
   
#Get DB Record Data
Get DB Customer Data
    [Arguments]    ${record_id}
    ${query}=    Set Variable
    ...    SELECT Case_Number,name,status,Subject,Date_Time
    ...    FROM Cases
    ...    WHERE Case_Number='${record_id}';
    ${rows}=    Query    ${query}
    Disconnect From Database
    ${row}=    Set Variable    ${rows}[0]
    ${db_data}=    Create Dictionary
    ...    Case_Number=${row}[0]
    ...    Name=${row}[1]
    ...    Status=${row}[2]
    ...    Subject=${row}[3]
    ...    Date_Timee=${row}[4]
    RETURN    ${db_data}
