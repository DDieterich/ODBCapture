[Home](README.md)

# Build Script Layering

There are many software tools available to "dump" PL/SQL, SQL, and Data from a database into text files.  ODBCapture does the same, but with a unique capability.  ODBCapture can be configured to capture build scripts that successfully add new build layers to a database.  Examples of these build layers include:
1. **Mock Build Layer** - Contains mocked database objects and APIs representative of a remote database.
2. **Base Build Layer** - Basic database functionality with basic configuration data.
3. **Environment Build Layer** - Environment specific configuration data for folders, users, etc...
4. **Test Utility Build Layer** - Standard testing utility/application like utPLSQL.
5. **Unit Test Build Layer** - Specific unit testing functionality kept separate from base database functionality.
6. **Test Data Build Layer** - Set of test data for unit testing, integration, performance testing, etc...
7. **ODBCapture Build Layer** - ODBCapture installation to re-capture database scripts with recent changes.

ODBCapture includes the unique capability to create complete database build scripts with all the required database objects and data.  The build scripts captured by ODBCapture can be used to create a working, functioning database.  Build layering of these different build scripts allow different databases to be built from the same database source code for different purposes like development, testing, and quality assurance.  ODBCapture can also create build scripts that support different environments.

ODBCapture takes advantage of this layering to offer different installation options for various resources and services available in different versions and editions of Oracle database software.


There are 2 different requirements for build layering in ODBCapture.
* User application build layering
* ODBCapture build layering

## List of Oracle Database Options (Components)

[Mike Dietrich](https://mikedietrichde.com/) (Oracle Vice President of Product Management and Development for Database Upgrade, Cloud Migrations and Patching) has a blog entry ["Remove and Clean Up Components from Oracle Database 11.2 – 19c"](https://mikedietrichde.com/2017/07/26/remove-clean-components-oracle-11-2-12-2) that goes into these database options.

Mike explains the following are dependent on XDB Repository (XDB,ANONYMOUS,XS$NULL):
* JServer JAVA Virtual Machine (JAVAVM)
* Oracle Database Java Packages (CATJAVA, OJVMSYS)
* Oracle XDK (XML)

Further, the following is dependent on ???
* Oracle Multimedia (ORDIM, ORDSYS, ORDDATA, ORDPLUGINS, SI_INFORMTN_SCHEMA)
* DICOM???

Now, we know the XDB Repository has been deprecated, so these dependencies are no longer required at some point.

This is confusing because 12c required the XDB Repository. "XDB became a mandatory component since Oracle Database 12.1.0.1. [You can’t have an Oracle 12c database without XDB](https://mikedietrichde.com/2017/08/08/xdb-clean-oracle-database-11-2-12-2/)"

```
select CON_ID, COMP_ID, comp_name, schema, status, version from CDB_REGISTRY order by 1,2;
```

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


* grbjnk:  ODBCapture Objects to Never Generate
* grbrac:  RAC - Real Application Clusters (GV$_ Views)
* grbxrep:  XDB - XML Database (XDB,ANONYMOUS,XS$NULL)
    * grbjava: JAVAVM,CATJAVA,XML - JServer JAVA Virtual Machine, Oracle Database Java Packages (OJVMSYS), Oracle XDK
        * grbord:  ORDIM - Oracle Multimedia (ORDSYS, ORDDATA, ORDPLUGINS, SI_INFORMTN_SCHEMA)
* grbsdo:  SDO,LCTR - Spatial - Oracle Locator (MDSYS, MDDATA)
* grbolap: XOQ,APS,AMD - OLAP API, OLAP Analytic Workspace (OLAPSYS), OLAP Catalog
* grbsec:  OLS,DV - Oracle Label Security (LBACSYS), Oracle Database Vault (DVSYS, DVF)
* grbctx:  CONTEXT - Oracle Text (CTXSYS)
* grbowm:  OWM - Oracle Workspace Manager (WMSYS)
* grbapex: APEX - Oracle Application Express (APEX_MMNN00)
* grbsrc:
    * grbendp: Common Endpoint for ODBCapture Hierarchy
        * grbdat: ODBCapture Self-Capture Configuration Data
        * grbtst: ODBCapture Testing
            * grbtend: Common Endpoint for ODBCapture Testing
        * wtpgrb: Example Application


## Base Build Layer with Configuration Data

(Coming Soon)


## Multiple Interdependent Schema

(Coming Soon)


## Deployment Specific Roles

* QA
* TRAINING

(Coming Soon)


## Build Layering Examples

(Coming Soon)


### Environment/Test Specific Configuration Data

(Coming Soon)

### Unit Testing

(Coming Soon)


### Test Data

(Coming Soon)


### Mock Build Layer

(Coming Soon)


## Example Build Sequences

(Coming Soon)


## Example Build Pathways

(Coming Soon)
