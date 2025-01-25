
# SQL\*cl Comparison

**DRAFT**

```
######  ######     #    ####### #######
#     # #     #   # #   #          #
#     # #     #  #   #  #          #
#     # ######  #     # #####      #
#     # #   #   ####### #          #
#     # #    #  #     # #          #
######  #     # #     # #          #
```

**DRAFT**

**As Of: January 24, 2025**

This is a comparison between Open Source ODBCapture and [Oracle's SQL\*cl](https://www.oracle.com/database/sqldeveloper/technologies/sqlcl).


## Overview

 ODBCapture | SQL\*cl    | Description
------------|------------|-------------
 Yes        | Yes        | Source File (Installation Script) Generation
 Yes        | Yes        | Separate Scripts for Each Schema/Object
 Yes        | Yes        | System Generated Database Object Filtering
 Yes        | Yes        | Install Multiple Integrated Users/Schemas
 Yes        | Yes        | Multiple Oracle DB Versions/Editions/Options
 Yes        | Yes        | Track Installed Versions of Application
 Yes        | .          | Master Installation Wrapper Script
 Yes        | .          | Separate Scripts for SYS actions
 Yes        | .          | Separate Scripts for SYSTEM/DBA actions
 Yes        | .          | Build Layer Installation with Dependencies
 Yes        | .          | Configurable Database Object Type Sequencing
 Yes        | .          | Configurable Script File Name Extensions
 Yes        | .          | SQL*Plus/Windows Special Character Handling
 Yes        | .          | US7ASCII Conversion of all Data and Scripts
 Yes        | .          | CSV Formated Data Files
 Yes        | .          | Foreign Key DISABLE for Data Loading
 Yes        | .          | Table Trigger DISABLE for Data Loading
 Yes        | .          | Table Loading of Installation Log Files
 Yes        | .          | Tailored Install Status Reporting Scripts
 Yes        | .          | JUnit (XML) Install Status Reporting
 Yes        | .          | ORA-01720: "WORKAROUND" at ASK TOM
 Yes        | .          | Complete ZIP File Created in Database
 Yes        | .          | Internal to the Database (Nothing External)
 .          | Yes        | Generate Diff Scripts, Liquibase Integration
 .          | Yes        | Generate Artifact with Project Status
 .          | Yes        | Deploy/Verify Diff Scripts to Taget Database

## Details

### Common Features

**Source File (Installation Script) Generation**

While both ODBCapture and SQL\*cl create source files from the database, the format and layout of those files are very different.

### Features Exclusive to ODBCapture

**Security**

The following features are required because ODBCapture must be deloyable in a production database with limited tooling connected.

* Internal to the Database (Nothing External)

### Features Exclusive to SQL*cl

The following features are not yet implemented in ODBCapture

*  Generate Database Association Objects


### Supported Database Data Types

No documentation found regarding Database Data Types supported by the SQL\*cl `Project` command.

 ODBCapture | SQL\*cl    | Database Data Type
------------|------------|----------------------
 .          | ?          | BINARY_DOUBLE
 .          | ?          | BINARY_FLOAT
 Yes        | ?          | BLOB
 Yes        | ?          | BFILE
 Yes        | ?          | CHAR
 Yes        | ?          | CLOB
 Yes        | ?          | DATE
 Yes        | ?          | INTERVAL_DAY_TO_SECOND
 Yes        | ?          | INTERVAL_YEAR_TO_MONTH
 Yes        | ?          | JSON
 .          | ?          | LONG
 .          | ?          | LONG RAW
 .          | ?          | MLSLABEL
 Yes        | ?          | NCHAR
 Yes        | ?          | NCLOB
 Yes        | ?          | NUMBER
 Yes        | ?          | NVARCHAR
 Yes        | ?          | RAW
 .          | ?          | ROWID
 Yes        | ?          | TIMESTAMP
 Yes        | ?          | TIMESTAMP_WITH_LOCAL_TZ
 Yes        | ?          | TIMESTAMP_WITH_TZ
 .          | ?          | UROWID
 Yes        | ?          | User Defined Object Types (Limited)
 Yes        | ?          | VARCHAR2
 Yes        | ?          | XMLTYPE


### Supported Database Object Types

Based on [Liquibase Supported Types](https://docs.oracle.com/en/database/oracle/sql-developer-command-line/24.3/sqcug/supported-types.html) in the SQL\*cl 24.3 Users Guide.  *NOTE:* No documentation found regarding the `Project` command.

 ODBCapture | SQL\*cl    | Database Object Type
------------|------------|----------------------
 Yes        | Yes        | AQ_QUEUE
 Yes        | Yes        | AQ_QUEUE_TABLE
 .          | Yes        | AQ_TRANSFORM
 .          | Yes        | ASSOCIATION
 .          | Yes        | AUDIT
 .          | Yes        | AUDIT_OBJ
 .          | Yes        | CLUSTER
 Yes        | .          | COMMENT
 Yes        | Yes        | CONTEXT
 Yes        | Yes        | DB_LINK
 .          | Yes        | DBMS_JOBS
 .          | Yes        | DEFAULT_ROLE
 Yes        | .          | DATABASE_TRIGGER
 .          | Yes        | DIMENSION
 Yes        | Yes        | DIRECTORY
 .          | Yes        | FGA_POLICY
 Yes        | Yes        | FUNCTION
 Yes        | .          | HOST_ACL
 .          | .          | INDEX_STATISTICS
 .          | .          | INDEXTYPE
 Yes        | .          | JAVA_SOURCE
 .          | Yes        | LIBRARY
 Yes        | Yes        | MATERIALIZED_VIEW
 Yes        | Yes        | MATERIALIZED_VIEW_CONSTRAINTS
 Yes        | Yes        | MATERIALIZED_VIEW_INDEX
 Yes        | Yes        | MATERIALIZED_VIEW_LOG
 Yes        | Yes        | OBJECT_GRANT
 .          | .          | ON_USER_GRANT
 .          | Yes        | OPERATOR
 Yes        | Yes        | PACKAGE_SPEC
 Yes        | Yes        | PACKAGE_BODY
 Yes        | Yes        | PROCEDURE
 .          | Yes        | PROFILE
 .          | Yes        | PROXY
 Yes        | Yes        | PUBLIC_SYNONYM
 .          | Yes        | REFRESH_GROUP
 .          | Yes        | RESOURCE_COST
 .          | Yes        | RLS_CONTEXT
 .          | Yes        | RLS_GROUP
 .          | Yes        | RLS_POLICY
 .          | Yes        | RMGR_CONSUMER_GROUP
 .          | Yes        | RMGR_INTITIAL_CONSUMER_GROUP
 .          | Yes        | RMGR_PLAN
 .          | Yes        | RMGR_PLAN_DIRECTIVE
 Yes        | Yes        | ROLE
 Yes        | Yes        | ROLE_GRANT
 .          | Yes        | ROLLBACK_SEGMENT
 Yes        | .          | SCHEDULER_JOB
 Yes        | .          | SCHEDULER_PROGRAM
 Yes        | .          | SCHEDULER_SCHEDULE
 Yes        | .          | SCHEMA TRIGGER
 Yes        | Yes        | SEQUENCE
 Yes        | Yes        | SYNONYM
 Yes        | Yes        | SYS_OBJ_GRANT
 Yes        | Yes        | SYSTEM_PRIV_GRANT
 Yes        | Yes        | TABLE
 Yes        | Yes        | TABLE_CONSTRAINTS
 Yes        | Yes        | TABLE_DATA
 Yes        | Yes        | TABLE_INDEX
 Yes        | Yes        | TABLE_TRIGGER
 .          | .          | TABLE_STATISTICS
 .          | Yes        | TABLESPACE
 .          | .          | TABLESPACE_QUOTA
 .          | .          | TRANSPORTABLE_EXPORT
 .          | .          | TRUSTED_DB_LINK
 .          | Yes        | TRIGGER_XS_ACL
 .          | Yes        | TRUSTED_DB_LINK
 Yes        | Yes        | TYPE_SPEC
 Yes        | Yes        | TYPE_BODY
 Yes        | Yes        | USER
 Yes        | Yes        | VIEW
 Yes        | Yes        | VIEW_CONSTRAINTS
 Yes        | .          | VIEW_TRIGGER
 Yes        | .          | WALLET_ACL
 Yes        | Yes        | XMLSCHEMA
 Yes        | .          | XDB_ACL
 Yes        | .          | XS_ACL (RAS_ACL)
 Yes        | .          | XS_ACL_PARAM
 .          | Yes        | XS_ACL_PARAM INDEX
 Yes        | Yes        | XS_DATA_SECURITY
 .          | .          | XS_NAMESPACE
 Yes        | Yes        | XS_ROLE
 .          | Yes        | XS_ROLESET
 Yes        | .          | XS_ROLE_GRANT
 .          | Yes        | XS_SECURITY_CLASS
 Yes        | Yes        | XS_USER
