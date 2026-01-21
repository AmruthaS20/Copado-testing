*** Settings ***
Library    DatabaseLibrary
Library    OperatingSystem
Library    String
Library    Collections
Resource    ../db_data.robot


*** Keywords ***
Get Data from DB
   [Arguments]    ${case_number}
   
   # 1️ Initialize variable (VERY IMPORTANT)
   ${db_data}=    Set Variable    ${EMPTY}

   # 2️ Populate based on case number
   Run Keyword If    '${case_number}' == '00001002'
   ...    Set Variable    ${db_data}    &{DB_CASE_00001002}
   
   # 3️ Validate DB record exists
   Should Not Be Empty    ${db_data}
   RETURN    ${db_data}