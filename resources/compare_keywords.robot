*** Settings ***
Library    Collections
Library    String


*** Keywords ***

Compare UI And DB Data

    #[Arguments]    ${ui_data}    ${db_data}

    #${ui_raw}=    Get From Dictionary    ${ui_data}    Name

    #${db_raw}=    Get From Dictionary    ${db_data}    Name

    #Log    UI RAW: '${ui_raw}'

    #Log    DB RAW: '${db_raw}'

    # Replace non-breaking space with empty

    #${ui_clean}=    Replace String    ${ui_raw}    \u00A0    ${EMPTY}

    #${db_clean}=    Replace String    ${db_raw}    \u00A0    ${EMPTY}

    # Remove leading/trailing spaces

    #${ui_clean}=    Strip String    ${ui_clean}

    #${db_clean}=    Strip String    ${db_clean}

    #og    UI CLEAN: '${ui_clean}'

    #Log    DB CLEAN: '${db_clean}'

    #Should Be Equal As Strings    ${ui_clean}    ${db_clean}


    

    #for mismatch scinario
          
 Compare UI And DB Data
   [Arguments]    ${ui_data}    ${db_data}
   FOR    ${key}    IN    @{ui_data.keys()}
       ${ui_raw}=    Get From Dictionary    ${ui_data}    ${key}
       ${db_raw}=    Get From Dictionary    ${db_data}    ${key}
       ${ui_clean}=    Replace String    ${ui_raw}    \u00A0    ${EMPTY}
       ${db_clean}=    Replace String    ${db_raw}    \u00A0    ${EMPTY}
       ${ui_clean}=    Strip String    ${ui_clean}
       ${db_clean}=    Strip String    ${db_clean}
       Log    FIELD: ${key}
       Log    UI VALUE: '${ui_clean}'
       Log    DB VALUE: '${db_clean}'
       Run Keyword If    '${ui_clean}' != '${db_clean}'
       ...    Fail     MISMATCH FOUND | Field=${key} | UI='${ui_clean}' | DB='${db_clean}'
   END
   Log     UI and DB data matched successfully