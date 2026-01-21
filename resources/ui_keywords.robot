*** Settings ***
Library    QWeb

*** Keywords ***
   
Get UI Case Data
    [Documentation]    Collect Case data from Salesforce UI
 
    ${ui_Name}=        Get Text    //a[@title\='SKood']
    ${ui_Status}=      Get Text    //td[@data-label\='Status']//span[normalize-space()\='En espera']
    ${ui_Subject}=      Get Text    //td[@data-label\='Subject']//a[normalize-space()\='Caso de ejemplo 3: no es posible realizar un seguimiento de nuestro pedido.']
    ${ui_Date_Time}=     Get Text    //td[@data-label\='Date/Time Opened']//span[normalize-space()\='12/22/2025, 7:09 AM']
    ${ui_Case_Number}=   Get Text    //a[normalize-space()\='00001002']/ancestor::tr//input[@type\='checkbox']

    ${ui_data}=      Create Dictionary
    ...              Case_Number=${ui_Case_Number}
    ...              Name=${ui_Name}
    ...              Status=${ui_Status}
    ...              subject=${ui_Subject}
    ...              Date_Timee=${ui_Date_Time}
    Log    UI Data: ${ui_data}
    RETURN    ${ui_data}
