*** Settings ***
Library    DatabaseLibrary
Library    OperatingSystem
Library    String
Library    Collections
Resource    ../db_data.robot


*** Keywords ***
Get Data from DB
   [Arguments]    ${case_number}
   
    Run Keyword If    '${case_number}' != '00001002'
   ...    Fail    No mock DB data found for case ${case_number}
   RETURN    &{DB_CASE_00001002}