*** Settings ***
Library    Collections
Library    String
Resource  ../resources/db_data.robot  


*** Keywords ***

Get Data From DB

    [Arguments]    ${case_number}

    # Get mocked DB row from db_data.robot

    ${row}=    Get From Dictionary    ${DB_DATA}    ${case_number}

    # Extract fields correctly

    ${case_no}=     Get From Dictionary    ${row}    Case_Number

    ${name}=        Get From Dictionary    ${row}    Name

    ${subject}=     Get From Dictionary    ${row}    Subject

    ${status}=      Get From Dictionary    ${row}    Status

    ${date_time}=   Get From Dictionary    ${row}    Date_Time

    # Return final dictionary

    ${db_data}=    Create Dictionary

    ...    Case_Number=${case_no}

    ...    Name=${name}

    ...    Subject=${subject}

    ...    Status=${status}

    ...    Date_Time=${date_time}

    RETURN    ${db_data}
 