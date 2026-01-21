*** Settings ***
Library    Collections

*** Keywords ***

Compare UI And DB Data

    [Arguments]    ${ui_data}    ${db_data}

    ${ui_is_dict}=    Evaluate    isinstance(${ui_data}, dict)

    ${db_is_dict}=    Evaluate    isinstance(${db_data}, dict)

    Run Keyword If    not ${ui_is_dict}    Fail    UI data is not a dictionary

    Run Keyword If    not ${db_is_dict}    Fail    DB data is not a dictionary

    FOR    ${key}    IN    @{ui_data.keys()}

        ${ui_value}=    Get From Dictionary    ${ui_data}    ${key}

        ${db_value}=    Get From Dictionary    ${db_data}    ${key}

        Should Be Equal    ${ui_value}    ${db_value}

        ...    msg=Mismatch for ${key}: UI=${ui_value} | DB=${db_value}

    END
 