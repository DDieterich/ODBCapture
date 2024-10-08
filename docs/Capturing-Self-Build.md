[Home](README.md)

# Capturing Self-Build Scripts

Native PL/SQL Application to Capture Source Code and Configuration Data

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

Duane Dieterich

DMSTEX (of Dallas County)

26-March-2024

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
Oracle and Java are trademarks of [Oracle Corp](https://www.oracle.com/).

## Summary

The ability to recreate a database from source code is largely deemed as unnecessary by today's developers, administrators, and project managers.  Even with the adoption of CI/CD, database source code has been relegated to change tracking engines like Liquibase and Flyway.

Anyone who has tried to create source code for a database using existing tools like Toad, PLSQL Developer, and SQL Developer is quickly met with frustration.  Too many or too few database objects get swept up in the source code captured from these tools.  The additional struggle to deal with a minimum data set required to create a functioning database also becomes daunting very quickly.

ODBCapture uses the Oracle database to create complete database build scripts with all the required database objects and data.  The build scripts captured by ODBCapture can be used to create a working, functioning database.  Layering of different build scripts allow different databases to be built from the same database source code for different purposes like development, testing, and quality assurance.  ODBCapture can also create build scripts that support different environments.  Since they are self-generated, build scripts can also be audited and tested as valid and complete.



## What is the Problem?

**What is Source Code?**

> Source code (also referred to as source or code) is the version of software as it is originally written (i.e., typed into a computer) by a human in plain text (i.e., human readable alphanumeric characters).

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Ref: linfo.org](https://www.linfo.org/source_code.html)

Every Oracle database developer knows what source code looks like.  SQL, PL/SQL, and configuration data are the ongoing fee required to keep a database working well.  However, little attention is paid to accurately capturing this source code.

Instead, database source code tends to be a facade used to satisfy some need for audit, business initiative, or contractual obligation.  The appearance of source code to recreate a database is more important than the ability to actually recreate the database.  Datbase source code that can't completly recreate the database is in effect a change tracking engine.

Alternatively, complete and accurate source code can be used to build a variety of functional databases, allowing the use of modern development techniques.  For instance, a "clean" development database can be temporarily created to test/review the latest changes in a Git branch.  Drastic changes can be attempted on that database without concern for destroying the database, because the database is temporary it can be recreated.  Any number of tools can be used to create diff scripts on multiple databases built from different Git branches.  These powerful techniques can be rapidly cycled without the need to preserve any database.


**DB Source Code Priority**

A lack of perceived importance for complete and acurate database source code has impeded the development of a useful solution.

[Yalim Gerger](https://www.linkedin.com/in/yalimgerger/), Founder of Gitora, describes this situation clearly in his [Version Control for PL SQL](https://www.youtube.com/watch?v=H4yxDVnzDtc&t=141s) video (starting at 0:18).  Anecdotal evidence largely supports Yalim's experience.

> ... version control is a difficult topic to talk about in the PL/SQL community.  Most of the time, when I open this topic, people go like 'what problem, there's no problem with version control ...'


**Define the Problem**

Accurate and complete database source code can be more fully understood using these capabilities.
* Recreate a specified version of a database, along with configuration data and/or test data as required for a specified environment.
* Allow CI/CD to create (pluggable) databases (from scratch) for developement and testing as part of development and release pipelines.
* Show a complete history of changes for all aspects of database source code, configuration data, and/or test data.
* Provide an audit hook to compare production source code with source code stored in version control.


**Build Script Layering**

Use of accurate and complete database source code exposes the need for source code options, or layering, when building a database.  The options/layers include the need for:
* Basic application configuration data
* Environment and/or test specific configuration data
* PL/SQL for unit testing on a development database
* Test data for unit testing on a development database
* PL/SQL for QA testing on a QA database
* Test data for QA testing on a QA database

Each of these options/layers needs to be assembled in a fassion that allow the resulting database to function correctly.  DDL, DML, and DCL script capture must account for these options/layers and the inter-dependencies between them.


**Creating database source code.**

While some development teams have created custom utilities to produce accurate and complete database source code, there is no generic tool set available  Technical limitations of commercially available tools include the requirement to use a GUI to select tables and database objects to export.

[What is a DDL Script, and Why It Is Useful](https://blog.toadworld.com/what-is-a-ddl-script-and-why-it-is-useful) (TOAD)
* *"The DBAs and Developers must write a script to create DDL objects ..."*
* *"The script execution will fail if the user who is executing the script does not have appropriate permission ..."*
* *"... make sure that tables are created in the proper sequence."*
* *"... select Tables from the Load object type drop-down box ..."*

[PL/SQL Developer Export User Objects](https://www.allroundautomations.com/products/pl-sql-developer/features/export-user-objects/)
* *"After selecting the objects you wish to export ..."*
* *"... include the grants of the object privileges to other users and roles ..."*
* *"... the output file will contain a series of calls to these object specific files."*

[Generate DDL Script For All Tables of a Schema in SQL Developer](https://creativeme1807.wordpress.com/2019/01/17/generate-ddl-script-for-all-tables-of-a-schema-in-sql-developer/)
* *"... Generate DDL scripts for all tables in a schema in SQL developer, without much work."*
* *"Go to FILE -> DATA MODELLER -> EXPORT -> DDL FILE"*
* *"Select table you want to have DDL scripts"*

[Source Control for Oracle](https://www.red-gate.com/products/source-control-for-oracle/) (Red-Gate)
* *"Source Control for Oracle capabilities will be merging into Flyway"*

[Database source control. Simplified.](https://www.dbmaestro.com/database-source-control) (DB Maestro)
* (Unable to get documented details on functionality or pricing)

[Version Control for PL SQL](https://www.youtube.com/watch?v=H4yxDVnzDtc&t=141s) (GitOra)
* *"(at 2:02) A lot of people confuse the management of PL/SQL source code with the management of table structures."*
* *"(at 2:14) ... Jova developers ... have issues managing their table structures ..."*
* *"(at 8:03) Does GitOra manage SQL too, like the table's data changes, does GitOra create versions of them?  No ..."*

When a commercial tool is able to create them, build scripts tend to lack all the elements needed to recreate an accurate and complete database.  Also, there is no way to pre-configure these tools to capture the same set of database objects and data into the same set of build scripts without using the GUI.


## What is Needed?

As discussed in the previous section, a simple way to create accurate and complete database build scripts (source code) is needed.


### Database Self-Build Scripts

Since developers use databases (not text editors) to develop, the database needs the ability to capture its own build scripts.  These build scripts must be able to re-create the necessary database objects, configuration data, and test data in a newly created (pluggable) database (from scratch).  Without this capability, some portion of a database must already exist, effectively limiting database source code to a change tracking engine (a.k.a Liquibase or Flyway).


**Oracle Database Specific**

Due to its complex and comprehensive nature, this solution needs to be Oracle Database specific.  A generic tool will be reduced to the lowest common demoninator, making it ineffective.


**Comprehensive**

The solution needs to handle multiple integrated users/schemas.  Many large Oracle databases have an entaglement of dependencies between schemas.  Successfully extracting a single, buildable schema from this entaglement can be difficult.  This solution must be able to successfully install co-dependent schema simultaneously.

The solution needs to handle multiple Oracle object types.  Many sophisticated Oracle databases take advantage of the wide range of object types available in the database, like Advanced Queues.  This solution must handle a large list.

The solution needs to handle multiple Oracle data types.  Many sophisticated Oracle databases take advantage of the wide range of data types available in the database, like XML and BLOB.  This solution must handle a large list.


### Source Code Portability

Since the Oracle database runs on several different operating systems, the build scripts created by the database must be portable.  No batch or shell scripting should be allowed because each must be tailored to a specific operating system.  Since SQL-Plus and SQL-Loader are included with every database installation, build scripts should be limited to the use of those tools.

Character translation of build scripts and data files must be handled.  For the purposes of these build scripts, Big Endien (and Little Endien) issues are handled by the operating systems and automativ conversions during file transfer.  Character set conversions between ASCII, UTF-8, UTF-16, EBCDIC, other are handled by the operating system.  Oracle database tools also automatically convert character sets during loading and unloading of data between the database and the operating system.

Binary data, such as images and encrypted passwords, must be converted to string based files.  There are several standard formats like HEX encoding and Base64 encoding that can be used for this purpose.


### Source Code Organization

Given these build scripts are going into a source control system like Git, some simple guidelines should apply to the files.
* Each database object should have its own script.  This allows easier tracking of changes to individual database objects in the source control system.
* Schemas (database object owners) should have their own folders.  This futher simplifies the tracking of changes by grouping all database object files together that are owned by the same database user.
* For ease of deployment security, all SYS related build scripts should be grouped together and separated from SYSTEM build scripts.  This allows database administrators to tightly scrutinize and possible limit highly permissive build scripts that require SYS privileges.


## ODBCapture Implementation

The following is a description of the ODBCapture implementation and how it complies with the needs described above.


### Standardized Oracle Utilities

DBMS_METADATA has become a popular package for creating DDL (and DCL) from an Oracle database.  The ODBCapture implementation uses DBMS_METADATA.get_ddl wherever possible to provde generic functionality for build script capture.

The DBMS_SQL package provides an interface to use dynamic SQL to parse any data query statement using PL/SQL.  The ODBCapture implementation uses DBMS_SQL to create the comprehensive data loader (cldr) script, with SQL*Loader Control File and CSV Database file.  The "cldr" script includes pre-load processing, like dropping specific foreign key constraints, and post-load processing, like translating data loaded in the database.


### Tool Configuration

Configuration of ODBCapture is required to accomplish the needs previously described.
* **Element** configuration is very specific and should not be modified without a thorough understanding of ODBCapture internals.
* **Build Type** and **User/Schema** configurations are the minimum required for ODBCapture to work.  At least one Build Type and one User/Schema configuration must be created.
* **Tablespace Quota**, **Role**, **Database Object**, and **Data Load** configurations are all optional.


**Element Configuration**

The element configuration data should not be changed.  The internal operation of the build script generator relies on certain data items in this configuration.

* **ELEMENT_SEQ** - The sequence these elements appear in the installation build scripts.
* **ELEMENT_NAME** - An internal element designation used to generate build scripts.
* **FILE_EXT1, FILE_EXT2, FILE_EXT3** - Build script file name extensions.
* **OBJECT_TYPE** - Matching database object type from DBA_OBJECTS.


**Build Type Configuration**

At least one Build Type configuration is required to capture build scripts.  These Build Types are used to resolve dependencies between the various installation layers as needed.  It is possible for Build Types to have no relationship (not layered).

* **BUILD_TYPE** - Name of this Build Type.
* **BUILD_SEQ** -  Sequence for this Build Type.
* **BUILD_SEQ_PARENT** - Parent of this Build Type.  This defines the installation layers.


**User/Schema Configuration**

At least one User/Schema configuration is required to capture build scripts.  This configuration defines which database users are included in which Build Types.

* **USERNAME** - Database username (schema name).
* **BUILD_TYPE** - This is the default Build Type for this user.  By default, all user objects will be generated for this Build Type.
* **ORACLE_PROVIDED** - Identifies a schema provided by Oracle.  No scripts are generated for these schema.
* **PROFILE** - Default profile for this user.
* **TEMPORARY_TSPACE** - Temporary tablespace to be used when creating this user (Default is 'TEMP').
* **DEFAULT_TSPACE** - Default tablespace to be used when creating this user.
* **TS_QUOTA** - Default tablespace quota for this user (Default is UNLIMITED).


**Tablespace Quota Configuration**

This configuration is used when additional Tablespace Quotas are required for a user.

* **USERNAME** - Database username (schema name).
* **TSPACE_NAME** - Name of the tablespace to add quota
* **TS_QUOTA** - Size of the quota for this user and tablespace (Default is UNLIMITED).


**Role Configuration**

Role configuration is optional.  If the database doesn't have any roles of interest, this configration can remain empty.

* **ROLENAME** - Name of the database role to generated build scripts.
* **BUILD_TYPE** - This is the default Build Type for this role.
* **ORACLE_PROVIDED** - Identifies a role provided by Oracle.  No scripts are generated for these roles.


**Database Object Configuration**

Database object configuration is optional.  Because all database objects are included in the default Build Type for a schema, this configuration is only necessary to move object installation to another Build Type.

* **BUILD_TYPE** - Name of the Build Type.
* **USERNAME** - Database username (schema owner).
* **ELEMENT_NAME** - An internal element designation used to generate build scripts.
* **OBJECT_NAME_REGEXP** - Limits which database objects to include in build scripts generated for this Build Type.  Objects that match this Regular Expression will NOT be included in the default Build Type for the user.


**Data Load Configuration**

Data load configuration is optional.  If no data should be included in build scripts, this configuration can remain empty.

* **BUILD_TYPE** - Name of the Build Type.
* **USERNAME** - Database username.
* **TABLE_NAME** - Database table/view name with the data to include in the build scripts.
* **COLUMNS_REMOVED** - Any column names that match this REGEXP Filter will be removes from the Data Load
* **ORDER_BY_COLUMNS** - Required list of columns that uniquely identify the data being queried.
* **WHERE_CLAUSE** - The WHERE clause for the SQL SELECT statement querying this data.
* **BEFORE_SELECT_SQL** - The "pre" SQL text included before of the SQL SELECT statement querying this data.
* **AFTER_ORDER_BY_SQL** - The "post" SQL text included after of the SQL ORDER BY clause querying this data.


### Database Objects and Data Types

**Database Object Types Supported**

The following lists the database object types supported by ODBCapture.

```
Advanced Queue
Advanced Queue Table
Context
Database Link
Database Trigger
Directory
Foreign Key (psuedo-object)
Grant, Database Object (psuedo-object)
Grant, System Privilege (psuedo-object)
Host ACL (psuedo object)
PL/SQL Function
Java Source
Index
Materialized View
Materialized View Index
Materialized View Foreign Key
Materialized View Trigger
Package Body
Package Specification
PL/SQL Procedure
RAS ACL (psuedo-object)
Role
Scheduler Job
Scheduler Program
Scheduler Schedule
Sequence
Schema Trigger
Synonym
Table
Table Index
Table Foreign Key
Table Trigger
Type Body
Type Specification
User
View
View Foreign Key
View Trigger
Wallet ACL (psuedo-object)
XDB ACL (psuedo-object)
```


**Data Types Supported**

The following lists the data types supported by ODBCapture.

```
BLOB
CHAR
CLOB
DATE
INTERVAL_DAY_TO_SECOND
JSON
NUMBER
RAW
TIMESTAMP
TIMESTAMP_WITH_LOCAL_TZ
TIMESTAMP_WITH_TZ
VARCHAR2
XMLTYPE
```


### Build Script Specifications


**ZIP File Creation**

All build scripts are added to a ZIP File created in a BLOB in the "ZIP_FILES" table.  Retreival of that ZIP file can be done using one of the following.

* UTL_FILE write (using GRAB_SCRIPTS.write_scripts procedure)
* APEX GUI Application
* SQL-Developer
* SQL*Plus CLOB Variable (Base 64 Encoded)


**Long Line Folding**

There are a variety of line length limitations for captured scripts.  These line length limitations are observed using a variety of techniques.

* SQL-Loader Data Files
* SQL-Plus Script Files
* Windows Script Files - For Directory Creation
* Unix/Linux Script Files - For Directory Creation


**Handling of System Generated Database Objects**

There are several different database object types that are system generated by the database.  The name of these database objects are filtered and not included in the build scripts.

* Recycle Bin Object Name
* Materialized View Index Name
* PL/SQL Pipelined Type Name
* Type Specification/Body Name
* Advanced Queue View/Type Name


**Escape Special Characters**

There are limitations on special characters used for build files.  Each of these limitations is handled by ODBCapture.

* SQL-Plus Scripts: `@`
* Windows File Names: `<, >, :, ", /, \, |, ?, *`


**Multi-Version, Multi-Offering Support**

Oracle Database started with Version 2 in 1979.

> In 1979, RSI introduced Oracle V2 (Version 2) as the first commercially available SQL-based RDBMS, a landmark event in the history of relational databases.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Ref: Oracle 23ai Database Documentation](https://docs.oracle.com/en/database/oracle/oracle-database/23/cncpt/introduction-to-oracle-database.html#GUID-43F9DD5C-8D8C-4E61-A2B4-5C05907D3CEC)

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

Some care must be taken in supporting source code between these combinations of versions and offerings.
* The oldest versions do not need to be supported.  Currently, that is considered to be 12R1 and earlier.
* New database versions include new data types, like JSON.
* New database versions drop old data types, like DICOM.
* Standard Edition does not support Oracle RAS (Real Application Security).
* OCI and On-Premises differ in feature/function support.
* The APEX specific database service on OCI (not listed above) can't run SQL*loader in the load scripts.
* Exadata can require major index and other performance changes to database source code.

Some accomodations for this complexity include:
* Excluding unsupported Build Types during installation
* PL/SQL Compiler Directives ($IF DBMS_DB_VERSION.VERSION > 19)


**Dynamically Created Reporting Scripts**

After the database installation is complete, some reporting is needed to determine if evertyhing in the database was loaded successfully.  These reports created in the root folder of the ZIP file show any problems with database objects that were loaded during installation.

* Invalid Database Object
* JUnit (XML) Object Status Report


**Database Captured Installation Logs**

Log files are captured during database installation.  Almost all installation errors are captured in these log files.  As part of database installation, the installation log files are loaded into the "ODBCAPTURE_INSTALLATION_LOGS" table using the "odbcapture_installation_logs.cdl" script in the root folder of the ZIP file.  The "ODBCAPTURE_INSTALLATION_LOGS" table is dynamically created if necessary and can be pre-created if additional control is required.  The following reports, along with the "odbcapture_installation_logs.cdl" script, are generated as required in the root folder of the ZIP file.

* Install Status from Log File
* JUnit (XML) Script Load Report


### Misc. Specifications

**Filtered Caching of Data Dictionary**

There is considerable querying of the Data Dictionay tables when ODBCapture is creating build scripts.  In order to improve performance, a set of tables is used to cache filtered data, reducing the taxation on the Data Dictionary tables in the database.  These tables must be manually refreshed.


**Data Capture**

Data loading with Foreign keys, triggers, and/or binary data can create issues.  ODBCapture disables the Foreign key constraints on each table in the corresponding "cldr" scripts.  Table triggers can incorrectly modify data during loading.  ODBCapture also disables table triggers.  Binary data cannot be safely stored in character based build scripts.  HEX encoding is used for RAW data and Base64 encoding is used for BLOB encoding.  The data load build scripts are created to include the HEX and Base64 decoding as required.


**Avoid errors granting permisions on a view that has errors**

If views are part of a complex depedency network, they can be very difficult to load in the correct sequence.  If a view error occurs during installation, it may not be possible to install the associated grants.  This problem has been resolved in ODBCapture using the [ORA-01720: "WORKAROUND" at ASK TOM](https://asktom.oracle.com/pls/apex/f?p=100:11:0::::P11_QUESTION_ID:43253832697675#2653213300346351987)



## Potential Roadblocks

There are several unexpected roadblocks to implementing accurate and complete database source code and configuration data.  The ability to directly capture all database source code and data can reveal shortcomings in existing policies and procedures.  When database changes are applied directly to production, it becomes laborsome to keep the source control system updated.  There are other political issues that pose potential roadblocks as well.


### Project Management

During initial implementation, learning curves and startup struggles result in longer lead times for database releases.  This is always problematic for project manangers and is an obvious potential roadblock.  However, there are other issues that can be surprising.

Many sophisticated databases contain a large amount of data.  Separating configuration data from "production" (transactional/other) data can be a daunting task.  Project managers may be resistant to start the process of identifying and separating this configuration data.  This difficulty can be compounded by a lack of understanding of environment configurations for development, integration test, and QA.

Legacy database release processing can include "fudging" releases when errors are found during the release.  Motivations are high to make the release work, rather than revert the release and find/fix the error later.  Making the release work often results in missing updates to source control.  The project manager gets no benefit from identifying and removing these "fudges".  The ability to audit source control can expose these shortcomings in a legacy release process that had been accepted as a very successful process.

Individual, temporary development databases can give a great deal of independence to developers.  This independence leads to creativity.  With the increased creativity, more options can be explored and proven by developers.  These additional options can become frustrating for project management due to the many moving parts.  A subtle resistance can begin to push against this newly discovered developer autonomy.

Increased control over the delivery process can reduce error injection into production databases.  This reduction in release errors results in less need for superhuman effort to keep the production system running.  A troubleshooting superstar will have fewer opportunities to be a superstar.  That can result in push-back from a superstar against these processes that improve the quality of the release process.  Project managers tend to be sensitive to these impacts on their superstar.


### Developers

Some of the obvious resisitance to new processes is the difficulty in learning and adjustment.  However, there are some other potential roadblocks that developers can have.

When the "gold standard" for database source control is in the development database, there can be a great resistance to massive database changes (also known as refactoring).  A new development processes that creates temporary development databases from source code allows those databases to become disposable.  This idea of disposable development databases can me met with deep resistance from the developers.

When a shared development database is used, developers can get quite good at creating temporary test data for development of specific modules.  These test data sets can become a unique niche for the developer in the development project.  Developers can be very hesitant to share these unique test data capabilities for fear of loosing that unique niche.


### Database Administrators

Possibly the biggest surprise is the push-back from the database administrators (DBAs).  A dialog regarding accurate and complete capture of source code and configuration data in the source code systems can alarm a DBA.  DBAs are accustomed to cloning databases and masking production data to perpare for a "development system refresh".

> ..., copying production data for non-production purposes such as test and development is proliferating sensitive data, expanding the security and compliance boundary, and increasing the likelihood of data breaches.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Ref: Oracle Data Masking and Subsetting](https://docs.oracle.com/en/database/oracle/oracle-database/19/dmksb/intro.html)

Cloning and masking can create a consistent work load for DBAs.  Implementation of complete source code and data configuration capture can be viewed and a threat to that steady work load.

Another contentious issue for DBAs is the backup of development and test databases.  These concerns are strongly supported by developers that consider the development database as the "gold standard" for database source code.  The ability to re-create complete development and test databases from source code negate the need for those database backups.  This lack of need for database backups can be upsetting to DBAs.
