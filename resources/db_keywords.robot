*** Settings ***
Library    Collections
Resource  ../resources/db_data.robot  


*** Keywords ***

Get Data From DB

    [Arguments]    ${case_number}

    # Build variable name dynamically

    ${db_key}=    Set Variable    DB_CASE_${case_number}

    ${case_no}=    Set Variable    ${${db_key}[Case_Number]}

    ${name}=       Set Variable    ${${db_key}[Name]}

    ${subject}=    Set Variable    ${${db_key}[Subject]}

    ${status}=     Set Variable    ${${db_key}[Status]}

    ${date_time}=  Set Variable    ${${db_key}[Date_Time]}

    ${db_data}=    Create Dictionary

    ...    Case_Number=${case_no}

    ...    Name=${name}

    ...    Subject=${subject}

    ...    Status=${status}

    ...    Date_Time=${date_time}

    Log    DB Data: ${db_data}

    RETURN    ${db_data}
 