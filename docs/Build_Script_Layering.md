[Home](README.md)

# Build Script Layering

There are many software tools available to "dump" PL/SQL, SQL, and Data from a database into text files.  ODBCapture does the same, but with a unique capability to create layered, or additive, installation scripts.


## Introduction

ODBCapture includes the unique capability to create complete database build scripts with all the required database objects and data.  The build scripts captured by ODBCapture can be used to create a working, functioning database.  Build layering of these different build scripts allow different databases to be built from the same database source code and data for different purposes like development, testing, and quality assurance.  ODBCapture can also create build scripts that support different environments.

Examples of these build layers include:

1. **Mock Build Layer** - Contains mocked database objects and APIs representative of a remote database.
2. **Base Build Layer** - Basic database functionality with basic configuration data.
3. **Environment Build Layer** - Environment specific configuration data for folders, users, etc...
4. **Optional Build Layer** - Some databases installations will not include these objects or data.
5. **Unit Test Build Layer** - Specific unit testing functionality kept separate from base database functionality.
6. **Test Data Build Layer** - Set of test data for unit testing, integration, performance testing, etc...
7. **ODBCapture Data Layer** - ODBCapture configuration data to re-capture database scripts with recent changes.

### Increased flexibility increases complexity.

ODBCapture includes the ability to define non-default Build Layers for Database Objects in order to place them in their proper installation scripts.

The ability to properly capture database objects in each Build layer requires specific information:

* The default Build layer for a schema.
* Any database objects that go into any non-default Build Layers.

There are implications for this Build Layer information:

* Database objects in a non-default Build Layer must be filtered from the default Build Layer.
* The installation sequence determines precedence for which database objects get installed in a Build Layer.
* Simple cross-schema database object dependencies must be accomodated:
    * Grants
    * Synonyms
    * Foreign keys
    * Indexes
* Complex cross-schema database dependencies are more difficult to handled:
    * Procedures, Functions, Package Bodies, Type Bodies, and Java Source
    * Views, Materialized Views, and View Triggers
    * DBMS_SCHEDULER

### ODBCapture Flexibility

The ODBCapture installation scripts use Build Layering to accomodate different Database versions, editions, and options.  Different implementations of the Oracle database can be missing dependent database objects for certain ODBCapture functions.  Build Layers are configured to offer different installation options for various resources and services available in these different versions, editions, and options of Oracle database software.

* RAS - Real Application Security (XS$NULL)
* JAVAVM,CATJAVA,XML - JServer JAVA Virtual Machine, Oracle Database Java Packages (OJVMSYS), Oracle XDK
* SDO,LCTR (Placeholder) - Spatial - Oracle Locator - Graph (MDSYS, MDDATA)
* Oracle XDB Repository


## ODBCapture Configuration Data

ODBCapture Configuration Data (OCD) defines what database objects and data to capture.  Each application will have its own OCD.  Some OCD is included when ODBCapture is installed in a database.

* Fully Populated
    * ELEMENT_CONF
    * METADATA_TRANSFORM_PARAMS
* Partially Populated
    * "Sys" and "Pub" Build Layer Data
        * BUILD_CONF
        * BUILD_PATH
        * ROLE_CONF
        * SCHEMA_CONF
    * EXPORTING_RAS_DATA - Installed only with "grbras" Build Layer
    * USER_DEFINED_TYPE_CONF - Data added for "grsdo" Build Layer
* Empty (Not Populated)
    * DLOAD_CONF
    * OBJECT_CONF
    * TSPACE_CONF

It is important to note that OCD must be created to save the OCD for each application.  For example, OCD for the ODBCapture application is located in the "grbdat" Build Layer.

*Note:* When configuring/adding OCD records to DLOAD_CONF for a new application, a SCHEMA_CONF record must be added with information for the ODBCAPTURE schema.  The ODBCAPTURE record in the grbdat/ODBCAPTURE/SCHEMA_CONF.csv file offers a good starting point.  Be sure to review/update the BUILD_TYPE value in that record.

**Best Practices:**

* Don't install OCD for multiple applications in the same database. Each database should capture source code and data files for a single applcation.
* Keep basic application OCD in a single, separate Build Layer so it can be installed in a development database. but not a production database.
* Keep "database objects and data for testing" OCD in separate Build Layer(s).
* Configure Parallel Build Layer Paths between OCD and "database objects and data for testing".

### Parallel Build Layer Paths

Parallel Build Layer Paths are useful for things like environment settings where multiple databases need different parameters based on the usage.  An example would be URLs to web services that differ between development, test, and UAT.  Parallel Build Layer Paths can be created for each different URL setting that would allow some Build Layers to be installed without the others.

One caveat here is the need to connect Build Layer Paths throughout the installation sequence.  To correctly filter database objects from the default Build Layer, all Build Layers must be connected to the default Build Layer thorugh Build Layer Paths.  It can be useful to create an artificial Build Layer as an end point collector for parallel Build Layer Paths.  This artificial Build Layer has no contents, would never be installed, but allows the necessary paths to the default Build Layer.

### Build Layer Sequencing

The Build Layer Sequencing determines precedence for which database objects get installed in a Build Layer.  A unique sequence number is assigned to each Build Layer.  The sequence number dictates the installation order for each Build Layer.

2 tables are used to define Build Layer Sequencing:

* BUILD_CONF - Defines Build Layers
* BUILD_PATH - Relates Build Layers to Parent Build Layers

**Aspects of Implementation:**

* 2 digit integers forces a small set of layers.  Too many layers get too complicated very quickly.
* Installing the main application before installing any other Build Layer like ODBCapture or "testing" ensures a "clean" installation of the main application.
* Mock Build Layer(s) may need to be installed before the main application.
* The built-in "sys" and "pub" Build Layers are database objects already installed in a new database.
* The built-in "sys" and "pub" Build Layers are the most negative numbered sequences in BUILD_CONF.


## Appendix A

This appendix is provided to give some indication of the complexity of various configurations of empty Oracle database based on:

* Oracle Database Edition
* Oracle Database Option
* Oracle Database Version
* OnPrem/Cloud Deployment

### Oracle Database Options (Components)

[Mike Dietrich](https://mikedietrichde.com/) (Oracle Vice President of Product Management and Development for Database Upgrade, Cloud Migrations and Patching) has a blog entry ["Remove and Clean Up Components from Oracle Database 11.2 – 19c"](https://mikedietrichde.com/2017/07/26/remove-clean-components-oracle-11-2-12-2) that goes into these database options.  At the bottom of the blog, Mike includes graphic that shows the order of removal of these components from a database.

1. OWM - Workspace Manager
2. CONTEXT - Oracle Text
3. (Security)
    * OLD - Label Security
    * DV - Data Vault
4. (Analytics)
    * XOQ - Oracle OLAP API
    * APS - Analytical Workspace
5. SDO - Spatial Data Option (Includes Locator?)
6. ORDIM - Oracle Multimedia
7. (Base)
    * XDK - Oracle XML Toolkit
    * JAVAVM - JServer Java Virtual Machine

Since this blog was written, Oracle has deprecated the XDB Repository.  This is especially complicated because 12c required the XDB Repository. "XDB became a mandatory component since Oracle Database 12.1.0.1. [You can’t have an Oracle 12c database without XDB](https://mikedietrichde.com/2017/08/08/xdb-clean-oracle-database-11-2-12-2/)"

### Listing the Components

In the blog referenced above, Mike includes a [link to a query](https://github.com/MikeDietrichDE/scripts/blob/main/check_components.sql) that shows the components installed in an Oracle database.

```
select CON_ID, COMP_ID, comp_name, schema, status, version from CDB_REGISTRY order by 1,2;
```

The following are component lists from different database installations.

**Oracle Enterprise Edition 21.3:**

COMP_ID | COMP_NAME
--------|-----------
APS     | OLAP Analytic Workspace
CATALOG | Oracle Database Catalog Views
CATJAVA | Oracle Database Java Packages
CATPROC | Oracle Database Packages and Types
CONTEXT | Oracle Text
DV      | Oracle Database Vault
JAVAVM  | JServer JAVA Virtual Machine
LCTR    | Oracle Locator
OLS     | Oracle Label Security
ORDIM   | Oracle Multimedia
OWM     | Oracle Workspace Manager
RAC     | Oracle Real Application Clusters
SDO     | Spatial
XDB     | Oracle XML Database
XML     | Oracle XDK
XOQ     | Oracle OLAP API

**Oracle Autonomous Database 21.3:**

COMP_ID | COMP_NAME
--------|-----------
APEX    | Oracle APEX
CATALOG | Oracle Database Catalog Views
CATPROC | Oracle Database Packages and Types
CONTEXT | Oracle Text
LCTR    | Oracle Locator
DV      | Oracle Database Vault
OLS     | Oracle Label Security
RAC     | Oracle Real Application Clusters
SDO     | Spatial

### Oracle Website List of Components

A review of the Oracle Database Technologies website reveals several different groupings for these components.  *NOTE: This part of Oracle's website appears to be marketing driven and can be quite dynamic regarding content and details.*

*  [Analytics and Data Warehousing](https://www.oracle.com/database/technologies/#analytics-and-data-warehousing)
    * Oracle Spatial
    * Oracle Graph
    * Oracle Big Data Connectors
    * Oracle Multitenant
* [Application Development](https://www.oracle.com/database/technologies/#application-development)
    * Machine Learning
    * Oracle APEX
    * Oracle JSON Document Database
    * Oracle Transactional Event Queues (TxEventQ)
* [High Availability](https://www.oracle.com/database/technologies/#high-availability)
    * Oracle Real Application Clusters (RAC)
    * Active Data Guard
    * Oracle GoldenGate
    * Oracle Sharding
* [Performance and Scanlability](https://www.oracle.com/database/technologies/#performance-and-scalability)
    * Database In Memory
    * Advanced Compression
    * Partitioning
    * Exadata
* [Database Security](https://www.oracle.com/database/technologies/#database-security)
    * Oracle Advanced Security
    * Oracle Audit Vault and Database Firewall
    * Oracle Data Masking and Subsetting
    * Oracle Data Safe
    * Oracle Database Security Assessment Tool
    * Oracle Database Vault
    * Oracle Key Vault
    * Oracle Label Security
