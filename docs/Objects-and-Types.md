[Home](README.md)

# Supported Database Objects and Data Types


## Database Object Types

The following lists the database object types **SUPPORTED** by ODBCapture.

```
Advanced Queue
Advanced Queue Table
Application Context
Database Link
Database Trigger
Directory
Foreign Key (psuedo-object)
Grant, Database Object (psuedo-object)
Grant, System Privilege (psuedo-object)
Grant, SYS Objects (psuedo-object)
Host ACL (psuedo object)
PL/SQL Function
Java Source
Materialized View
Materialized View Index
Materialized View Foreign Key
Materialized View Trigger
Package Body
Package Specification
PL/SQL Procedure
Real Application Security ACL (psuedo-object)
Role
Scheduler Job
Scheduler Program
Scheduler Schedule
Sequence
Schema Trigger
Synonym
Table
Table Index (including CTXSYS.CONTEXT_V2 for Oracle Text)
Table Foreign Key
Table Trigger
Type Body
Type Specification
User (Schema Owner)
View
View Foreign Key
View Trigger
Wallet ACL (psuedo-object)
XML DB Repository ACL (psuedo-object, Deprecated)
XML Schema (Deprecated)
```

## Data Types:

The following lists the data types **SUPPORTED** by ODBCapture.

```
BLOB
BFILE
CHAR
CLOB
DATE
INTERVAL_DAY_TO_SECOND
INTERVAL_YEAR_TO_MONTH
JSON
NCHAR
NCLOB
NUMBER
NVARCHAR
RAW
TIMESTAMP
TIMESTAMP_WITH_LOCAL_TZ
TIMESTAMP_WITH_TZ
User Defined Object Types (Limited)
VARCHAR2
XMLTYPE
```

The following lists the data types **NOT** supported by ODBCapture.

```
BINARY_DOUBLE
BINARY_FLOAT
LONG
LONG RAW
MLSLABEL
ROWID
UROWID
```


## DBMS_METADATA Assessment

Which DBMS_METADATA Object Types have been implemented?

https://docs.oracle.com/en/database/oracle/oracle-database/23/arpls/DBMS_METADATA.html

**DBMS_METADATA Attributes:**

* N - named object
* D - dependent object
* G - granted object
* H - heterogeneous object

ODBCapture  | DBMS_METADATA Object Type    | Attributes | DBMS_METADATA Notes
------------|------------------------------|------------|---------------------
Implemented | AQ_QUEUE                     | SND        | 
Implemented | AQ_QUEUE_TABLE               | ND         | 
.           | AQ_TRANSFORM                 | SN         | 
.           | ASSOCIATION                  | D          | 
.           | AUDIT                        | DG         | 
.           | AUDIT_OBJ                    | D          | 
.           | CLUSTER                      | SN         | 
Implemented | COMMENT                      | D          | 
Implemented | CONSTRAINT                   | SND        | 
Implemented | CONTEXT                      | N          | 
.           | DATABASE_EXPORT              | H          | 
Implemented | DB_LINK                      | SN         | 
.           | DEFAULT_ROLE                 | G          | 
.           | DIMENSION                    | SN         | 
Implemented | DIRECTORY                    | N          | 
.           | FGA_POLICY                   | D          | 
Implemented | FUNCTION                     | SN         | 
.           | INDEX_STATISTICS             | D          | 
Implemented | INDEX                        | SND        | 
.           | INDEXTYPE                    | SN         | 
Implemented | JAVA_SOURCE                  | SN         | 
.           | JOB                          | S          | 
.           | LIBRARY                      | SN         | 
Implemented | MATERIALIZED_VIEW            | SN         | 
Implemented | MATERIALIZED_VIEW_LOG        | D          | 
Implemented | OBJECT_GRANT                 | DG         | 
.           | ON_USER_GRANT                | G          | 
.           | OPERATOR                     | SN         | 
Implemented | PACKAGE                      | SN         | 
Implemented | PACKAGE_SPEC                 | SN         | 
Implemented | PACKAGE_BODY                 | SN         | 
Implemented | PROCEDURE                    | SN         | 
.           | PROFILE                      | N          | 
.           | PROXY                        | G          | 
Implemented | REF_CONSTRAINT               | SND        | 
.           | REFRESH_GROUP                | SN         | 
.           | RESOURCE_COST                | H          | 
.           | RLS_CONTEXT                  | D          | 
.           | RLS_GROUP                    | D          | 
.           | RLS_POLICY                   | D          | 
.           | RMGR_CONSUMER_GROUP          | SN         | 
.           | RMGR_INTITIAL_CONSUMER_GROUP | G          | 
.           | RMGR_PLAN                    | SN         | 
.           | RMGR_PLAN_DIRECTIVE          | D          | 
Implemented | ROLE                         | N          | 
Implemented | ROLE_GRANT                   | G          | 
.           | ROLLBACK_SEGMENT             | N          | 
.           | SCHEMA_EXPORT                | H          | 
Implemented | SEQUENCE                     | SN         | 
Implemented | SYNONYM                      | SN         | Private synonyms are schema objects. Public synonyms are not, but for the purposes of this API, their schema name is PUBLIC. The name of a synonym is considered to be the synonym itself. For example, in CREATE PUBLIC SYNONYM FOO FOR BAR, the resultant object is considered to have name FOO and schema PUBLIC.
Implemented | SYSTEM_GRANT                 | G          | 
Implemented | TABLE                        | SN         | 
.           | TABLE_DATA                   | SND        | For partitions, the object name is the partition name. For nested tables, the object name is the storage table name. The base object is the top-level table to which the table data belongs. For nested tables and partitioning, this is the top-level table (not the parent table or partition). For nonpartitioned tables and non-nested tables this is the table itself.
.           | TABLE_EXPORT                 | H          | 
.           | TABLE_STATISTICS             | D          | 
.           | TABLESPACE                   | N          | 
.           | TABLESPACE_QUOTA             | G          | 
.           | TRANSPORTABLE_EXPORT         | H          | 
Implemented | TRIGGER                      | SND        | 
.           | TRUSTED_DB_LINK              | N          | 
Implemented | TYPE                         | SN         | 
Implemented | TYPE_SPEC                    | SN         | 
Implemented | TYPE_BODY                    | SN         | 
Implemented | USER                         | N          | 
Implemented | VIEW                         | SN         | 
Implemented | XMLSCHEMA                    | SN         | 
Implemented | XS_USER                      | N          | 
Implemented | XS_ROLE                      | N          | 
.           | XS_ROLESET                   | N          | 
Implemented | XS_ROLE_GRANT                | N          | 
.           | XS_SECURITY_CLASS            | SN         | 
Implemented | XS_DATA_SECURITY             | SN         | 
Implemented | XS_ACL                       | SN         | 
Implemented | XS_ACL_PARAM                 | N          | 
.           | XS_NAMESPACE                 | N          | 
