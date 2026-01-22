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


### Match Validation: 

- The UI field `Case Number` is captured from the Salesforce UI.
- The value is stored in the UI dictionary using the key .
- The corresponding database column 
- During execution, the test successfully retrieves the value from the DB.
- UI value and DB value are compared after normalization.
- The values match exactly.
 

### Known Mismatch: Subject Field

- The UI field `subject` exists only in the Salesforce UI.
- There is no corresponding database column.
- During execution, the DB dictionary does not contain this key.
- This results in the following expected failure:

  Dictionary does not contain key 'subject'
  this behavior is intentional and validates UI DB inconsistency handling.
 

 ### Test Behavior
- The test iterates through UI keys.
- For each key, it attempts to fetch the corresponding DB value.
- If the DB key is missing, the test fails with a clear message.
- This confirms mismatch detection is working as designed.

### Execution Evidence

- The dictionary lookup succeeds for key `Case_Number`.
 - No errors are thrown during DB value retrieval.
- Comparison passes without mismatch.
- Test iteration for this field is marked as PASSED.
 
 
 
 