## UI to Database Field Mapping
 
 This section documents the mapping between Salesforce UI field labels
 and database columns used for Ui db validation in Copado CRT.
 It helps distinguish expected mismatches from defects.

 | UI Field Label | UI Key Used in Test | DB Column | Present in DB | Remarks |

|---------------|-------------------|-----------|---------------|---------|

| Case Number   | Case_Number       | case_number | Yes | Direct UI DB mapping |

| Name          | Name              | name        | Yes | Direct UI DB mapping |

| Status        | Status            | status      | Yes | Normalized before comparison |

| Subject       | subject           | Subject        | Yes  | Direct UI DB mapping  |

| Date_Time      | Date_Time           | Date_Time        | Yes  | Direct UI DB mapping  |


### Known Mismatch: Subject Field

- The UI field `subject` exists only in the Salesforce UI.

- There is no corresponding database column.

- During execution, the DB dictionary does not contain this key.

- This results in the following expected failure:

Dictionary does not contain key 'subject'
this behavior is intentional and validates UI DB inconsistency handling.
 
 
 
 