*** Settings ***
Library    Collections
Library    String
Resource  ../resources/db_data.robot  



*** Keywords ***

Get Data From DB

    [Arguments]    ${ui_data}    ${db_data}
   ${ui_raw}=    Get From Dictionary    ${ui_data}    Name
   ${db_raw}=    Get From Dictionary    ${db_data}    Name
   Log    UI RAW: '${ui_raw}'
   Log    DB RAW: '${db_raw}'
   # 🔥 Remove ALL whitespace characters (spaces, nbsp, newline, tabs)
   ${ui_clean}=    Replace Regexp    ${ui_raw}    \\s+    ${EMPTY}
   ${db_clean}=    Replace Regexp    ${db_raw}    \\s+    ${EMPTY}
   Log    UI CLEAN: '${ui_clean}'
   Log    DB CLEAN: '${db_clean}'
   Should Be Equal As Strings    ${ui_clean}    ${db_clean}