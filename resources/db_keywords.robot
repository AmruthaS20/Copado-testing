*** Settings ***
Library    Collections
Resource  ../resources/db_data.robot  


*** Keywords ***

Get Data From DB


    [Arguments]    ${case_key}

    ${CASE_NUMBER}=    Set Variable    ${${case_key}[Case_Number]}

    ${NAME}=           Set Variable    ${${case_key}[Name]}

    ${SUBJECT}=        Set Variable    ${${case_key}[Subject]}

    ${STATUS}=         Set Variable    ${${case_key}[Status]}

    ${DATE_TIME}=      Set Variable    ${${case_key}[Date_Time]}

    Set Test Variable    ${DB_CASE_NUMBER}    ${CASE_NUMBER}

    Set Test Variable    ${DB_NAME}           ${NAME}

    Set Test Variable    ${DB_SUBJECT}        ${SUBJECT}

    Set Test Variable    ${DB_STATUS}         ${STATUS}

    Set Test Variable    ${DB_DATE_TIME}      ${DATE_TIME}
 