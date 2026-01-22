*** Settings ***
Library    Collections
Library    String

*** Keywords ***

Compare UI And DB Data

     [Arguments]    ${ui_data}    ${db_data}
   ${ui_name_raw}=    Get From Dictionary    ${ui_data}    Name
   ${db_name_raw}=    Get From Dictionary    ${db_data}    Name
   Log    UI RAW: '${ui_name_raw}'
   Log    DB RAW: '${db_name_raw}'
   ${ui_name}=    Strip String    ${ui_name_raw}
   ${db_name}=    Strip String    ${db_name_raw}
   Log    UI CLEAN: '${ui_name}'
   Log    DB CLEAN: '${db_name}'
   Should Be Equal As Strings    ${ui_name}    ${db_name}