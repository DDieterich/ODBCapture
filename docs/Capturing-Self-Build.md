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

Use of accurate and complete database source code exposes the need for database build layers.  These build layers include the need for:
* Base database objects and configuration data layer
* Dev/Test/Prod environment specific configuration data layer
* Unit testing database objects and test data layer
* Mock schema/API for loopback testing

Each of these build layers needs to be assembled in a fassion that allow the resulting database to function correctly.  DDL, DML, and DCL script capture must account for these build layers and the inter-dependencies between them.


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

The solution needs to handle multiple integrated users/schemas.  Many large Oracle databases have an entaglement of dependencies between schemas.  Successfully extracting a single, buildable schema from this entaglement can be difficult.  This solution must be able to successfull create and load co-dependent schema simultaneously.

The solution needs to handle multiple Oracle object types.  Many sophisticated Oracle databases take advantage of the wide range of object types available in the database, like Advanced Queues.  This solution must handle a large list.

The solution needs to handle multiple Oracle data types.  Many sophisticated Oracle databases take advantage of the wide range of data types available in the database, like XML and BLOB.  This solution must handle a large list.


### Source Code Portability

Since the Oracle database runs on several different systems, the build scripts created by the database must be portable.  No batch or shell scripting should be allowed because each must be tailored to a specific system.  Since SQL-Plus and SQL-Loader are included with every Oracle database software installation, build scripts should be limited to the use of those tools.

The character sets used for build scripts and data files must be handled.  For the purposes of these scripts/files, Big Endien (and Little Endien) issues are handled during file transfer between systems.  However, character set conversions may, or may not, be handled by those transfers between systems.  2 Situations must be considered:

1) **CHAR, VARCHAR2, and CLOB** - The character sets used for these data types is determined when an Oracle database is created.  Moving from one database to another that has a different character set may result in errors because a suitable mapping of the 2 character sets is not available.  To ensure portability, use only US7ASCII characters in these data types.  Otherwise, always unload/load data between databases with the same character set.
2) **NCHAR, NVARCHAR2, and NCLOB** - The character sets for these data types is always UNICODE.  The specific character set chosen may vary the number of bytes used to store the actual strings, but they all use the same character set.  Creating files with these characters, then transfering them between systems can cause problems.  As such, every character in the UNICODE character set that is outside the US7ASCII subset must be encoded to a US7ASCII format before adding to a file.  In this way, transfers between systems will not interfere with the original UNICODE characters.  (See [Issue Z0034](https://github.com/DDieterich/ODBCapture/wiki/Z0034))

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

The DBMS_SQL package provides an interface to use dynamic SQL to parse any data query statement using PL/SQL.  The ODBCapture implementation uses DBMS_SQL to create the comprehensive data loader (cldr) script, with SQL\*Loader Control File and CSV Database file.  The "cldr" script includes pre-load processing, like dropping specific foreign key constraints, and post-load processing, like translating data loaded in the database.


### Tool Configuration

Configuration of ODBCapture is required to accomplish the needs previously described.

**Internal Configuration:**

These configurations are very specific and should not be modified without a thorough understanding of ODBCapture internals.  These configuration are installed when ODBCapture is installed.

* **Element Data**
    * defines all database object types that can be captured.
    * defines the order database object types occur in the installation scripts.
    * defines file name extensions for each database object type.
* **Metadata Transformation Params** is used to configure the DBMS_METADATA parameters.
* **System Schema Data** defines system schemas that are installed when empty databases are created.
* **System Role Data** defines system roles that are installed when empty databases are created.
* **System Build Layer Data** defines the Build Layers for the system schemas and system roles.  These Build Layers are never implemented in the installation scripts.

**Minimal Configuration:**

These configurations are the minimum required for ODBCapture to work.  Data for at least one of each configuration must be created.

* **Build Layer Data** defines each of the Build Layers.  A sequencing of layer installations is also implicitly defined as well.
* **Application Schema Data** defines the schemas to be captured in each layer.

**Additional Configurations:**

These configurations are not required for ODBCapture to work, but may be required to correclty capture source code and configuration data for an application.

* **Build Path Data** is used to define dependencies between Build Layers.
* **Tablespace Quota Data** identifies tablespace names and quota for each user/schema.
* **Application Role Data** identifies roles that defined for the application.
* **Database Object Data** is used to discriminate different database objects from the same schema into different Build Layers.
* **Data Load** configurations determine the data from each table to be captured with each Build Layer.  Can also be used to exclude columns from captured data.

**Specialty Configurations:**

These configuration are used for specialty/optional functionality that may not be available on all databases.

* **Exporting RAS Data** is used to disable Real Application Security policies on tables before exporting data.
* **User Defined Type Data** defines package names used to export data within User Defined Types.


### Oracle Database Support

**Database Objects and Data Types**

All database objects and data types should be supported.

Click [here for supported database objects and data types](Objects-and-Types.md) information.

**Supported Database Versions**

Oracle Database started with Version 2 in 1979.

> In 1979, RSI introduced Oracle V2 (Version 2) as the first commercially available SQL-based RDBMS, a landmark event in the history of relational databases.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Ref: Oracle 23ai Database Documentation](https://docs.oracle.com/en/database/oracle/oracle-database/23/cncpt/introduction-to-oracle-database.html#GUID-43F9DD5C-8D8C-4E61-A2B4-5C05907D3CEC)

Some care must be taken in supporting source code between these combinations of versions and offerings.
* The oldest versions do not need to be supported.  Currently, that is considered to be 12R1 and earlier.
* New database versions include new data types, like JSON.
* New database versions drop old data types, like DICOM.
* Standard Edition does not support Oracle RAS (Real Application Security).
* OCI and On-Premises differ in feature/function support.
* The APEX specific database service on OCI (not listed above) can't run SQL\*loader in the load scripts.
* Exadata can require major index and other performance changes to database source code.

Some accomodations for this complexity include:
* Excluding unsupported Build Types while building the database
* PL/SQL Compiler Directives ($IF DBMS_DB_VERSION.VERSION > 19)

Click [here for supported database versions](Supported_DB_Versions.md) information.


### Build Script Specifications

**ZIP File Creation**

All build scripts are added to a ZIP File created in a BLOB in the "ZIP_FILES" table.  Retreival of that ZIP file can be done using one of the following.

* UTL_FILE write (using GRAB_SCRIPTS.write_scripts procedure)
* APEX GUI Application
* SQL-Developer
* SQL\*Plus CLOB Variable (Base 64 Encoded)


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


**Dynamically Created Reporting Scripts**

After the database build is complete, some reporting is needed to determine if evertyhing in the database was loaded successfully.  The reports that are created in the root folder of the ZIP file show any problems with database objects that were loaded during the database build.

* Invalid Database Object
* JUnit (XML) Object Status Report


**Database Captured Installation Logs**

Log files are captured during database build.  Almost all build errors are captured in these log files.  As part of the database build process, the build script log files are loaded into the "ODBCAPTURE_INSTALLATION_LOGS" table using the "odbcapture_installation_logs.cdl" script in the root folder of the ZIP file.  The "ODBCAPTURE_INSTALLATION_LOGS" table is dynamically created if necessary and can be pre-created if additional control is required.  The following reports, along with the "odbcapture_installation_logs.cdl" script, are generated as required in the root folder of the ZIP file.

* Install Status from Log File
* JUnit (XML) Script Load Report


### Misc. Specifications

**Filtered Caching of Data Dictionary**

There is considerable querying of the Data Dictionay tables when ODBCapture is creating build scripts.  In order to improve performance, a set of tables is used to cache filtered data, reducing the taxation on the Data Dictionary tables in the database.  These tables must be manually refreshed.


**Data Capture**

Data loading with Foreign keys, triggers, and/or binary data can create issues.  ODBCapture disables the Foreign key constraints on each table in the corresponding "cldr" scripts.  Table triggers can incorrectly modify data during loading.  ODBCapture also disables table triggers.  Binary data cannot be safely stored in character based build scripts.  HEX encoding is used for RAW data and Base64 encoding is used for BLOB encoding.  The data load build scripts are created to include the HEX and Base64 decoding as required.


**Avoid errors granting permisions on a view that has errors**

If views are part of a complex depedency network, they can be very difficult to load in the correct sequence.  If a view error occurs during a database build, it may not be possible to create the associated grants.  This problem has been resolved in ODBCapture using the [ORA-01720: "WORKAROUND" at ASK TOM](https://asktom.oracle.com/pls/apex/f?p=100:11:0::::P11_QUESTION_ID:43253832697675#2653213300346351987)



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
