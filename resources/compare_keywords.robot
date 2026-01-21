*** Settings ***
Library    Collections

*** Keywords ***

Compare UI And DB Data

    [Arguments]    ${ui_data}    ${db_data}
    FOR    ${key}    IN    @{ui_data.keys()}
    ${ui_val}=    Get From Dictionary    ${ui_data}    ${key}
    ${db_val}=    Get From Dictionary    ${db_data}    ${key}
    Run Keyword If    '${ui_val}' != '${db_val}'
    ...    Fail     Mismatch in ${key} | UI=${ui_val} | DB=${db_val}
    END
    
    Log     UI and DB data matched successfully
 