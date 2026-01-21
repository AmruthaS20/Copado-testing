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
Resource       ../resources/db_keywords.robot
Suite Setup    OpenBrowser    ${URL}    chrome


     
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

   ${ui_data}=    Get UI Case Data
    Log           ${ui_data}
 
   ${db_data}=    Get Data from DB    ${ui_data}[Case_Number]
   Log            ${db_data}
   Compare UI And DB Data    ${ui_data}    ${db_data}
