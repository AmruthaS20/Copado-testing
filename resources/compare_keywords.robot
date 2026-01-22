*** Settings ***
Library    Collections
Library    String

*** Keywords ***

Compare UI And DB Data

    [Arguments]    ${ui_data}    ${db_data}

   
   ${ui_name}=    Get From Dictionary    ${ui_data}    Name
   ${db_name}=    Get From Dictionary    ${db_data}    Name
   ${ui_name}=    Strip String    ${ui_name}
   ${db_name}=    Strip String    ${db_name}
   Should Be Equal    ${ui_name}    ${db_name}