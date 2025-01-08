[Home](README.md)

# Supported Database Versions

Between On-Premises, Engineered Systems, and Oracle Cloud, there are a variety of Oracle database versions avaiable.

## Tested Database Versions

Ver. | Edition       | Deploy | Build Folder   | Notes
-----|---------------|--------|----------------|-------
23.6 | APEX Database | OCI    | OCI_APEX236    | Requires single install script (apex/OCI_APEX_conversion.sh)
23.6 | Autonomous DB | OnPrem | OnPrem_AD236   | container-registry.oracle.com/database/adb-free:24.11.4.2-23ai
23.4 | Free Edition  | OnPrem | OnPrem_Free234 | container-registry.oracle.com/database/free:23.4.0.0
21.3 | Autonomous DB | OCI    | OCI_Auto213    | 
21.3 | Enterprise Ed | OnPrem | OnPrem_EE213   | container-registry.oracle.com/database/enterprise:21.3.0.0
21.3 | Standard Ed   | OnPrem | OnPrem_SE213   | 
19.3 | Enterprise Ed | OnPrem | OnPrem_EE193   | container-registry.oracle.com/database/enterprise:19.3.0.0
18.4 | eXpress Ed    | OnPrem | OnPrem_XE184   | 


## Note about Current Database Versions

Oracle Database Version 23ai current includes these [licensed offerings](https://docs.oracle.com/en/database/oracle/oracle-database/23/dblic/Licensing-Information.html#GUID-AB354617-6614-487E-A022-7FC9A5A08472).

```
Database Free - On-Premises
Database Standard Edition 2 on Oracle Database Appliance - On-Premises
Database Enterprise Edition on Engineered Systems - On-Premises
Base Database Service Standard Edition - OCI
Base Database Service Enterprise Edition - OCI
Base Database Service Enterprise Edition - High Performance - OCI
Base Database Service Enterprise Edition - Extreme Performance - OCI
Exadata Database Service on Dedicated Infrastructure - OCI
Exadata Database Service on Cloud@Customer - OCI
```
