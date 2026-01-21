*** Settings ***
Library    OperatingSystem
Library    QForce
Library    QWeb
Library    DatabaseLibrary
Library    Collections
Resource          ../resources/ui_keywords.robot
Resource          ../resources/db_keywords.robot
Resource          ../resources/compare_keywords.robot
Resource    ../resources/common.robot


Suite Setup        OpenBrowser   ${URL}    chrome
Suite Teardown   Close Browser

*** Variables ***
${URL}    https://login.salesforce.com

*** Test Cases ***
UI_DB_Validation_Test
     Appstate        Login     
   Sleep           10
   
   #getting five cases in  cases tab
   Verify Text     Cases
   Click Text      Cases

   [Documentation]    Validate UI fields against DB and fail with clear mismatch
   ${ui_data}=    Get UI Case Data
   Connect To Cloud DB
   ${db_data}=    Get DB Customer Data   ${ui_data}[customer_id]
   Compare UI And DB Data    ${ui_data}    ${db_data}

