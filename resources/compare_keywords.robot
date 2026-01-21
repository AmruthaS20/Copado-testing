*** Settings ***
Library    Collections

*** Keywords ***

Compare UI And DB Data

    [Arguments]    ${ui_data}    ${db_data}
    FOR    ${field}    IN    @{ui_data.keys()}
    ${ui_value}=    Get From Dictionary    ${ui_data}    ${field}
    ${db_value}=    Get From Dictionary    ${db_data}    ${field}
    Run Keyword If    '${ui_value}' != '${db_value}'
    ...    Fail     MISMATCH in ${field} | UI: ${ui_value} | DB: ${db_value}
    END
    Log     UI and DB data matched successfully

