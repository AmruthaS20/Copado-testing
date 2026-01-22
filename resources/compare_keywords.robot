*** Settings ***
Library    Collections

*** Keywords ***

Compare UI And DB Data

    [Arguments]    ${ui_data}    ${db_data}

    Should Be Equal As Strings    ${ui_data}[Case_Number]    ${db_data}[Case_Number]
   Should Be Equal As Strings    ${ui_data}[Name]           ${db_data}[Name]
   Should Be Equal As Strings    ${ui_data}[Subject]        ${db_data}[Subject]
   Should Be Equal As Strings    ${ui_data}[Status]         ${db_data}[Status]
   Should Be Equal As Strings    ${ui_data}[Date_Time]      ${db_data}[Date_Time]