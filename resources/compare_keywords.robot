*** Settings ***
Library    Collections

*** Keywords ***

Compare UI And DB Data

    [Arguments]    ${ui_data}    ${db_data}

    # --- Mandatory validations ---
    Should Not Be Empty    ${ui_data}
    Should Not Be Empty    ${db_data}
    
    ${is_dict}=    Evaluate    isinstance($ui_data, dict)
   Run Keyword Unless    ${is_dict}    Fail    UI data is not a dictionary
   ${is_dict}=    Evaluate    isinstance($db_data, dict)
   Run Keyword Unless    ${is_dict}    Fail    DB data is not a dictionary
   FOR    ${key}    IN    @{ui_data.keys()}
       ${ui_val}=    Get From Dictionary    ${ui_data}    ${key}
       ${db_val}=    Get From Dictionary    ${db_data}    ${key}
       Run Keyword If    '${ui_val}' != '${db_val}'
       ...    Fail    Mismatch in ${key} | UI=${ui_val} | DB=${db_val}
   END
   Log    UI and DB data matched successfully