
# V2.0 Release Notes


## Overview:

Resolved Issues:
* Z0013: DISTINCT is required instead of GROUP BY
* Z0018: grpdat incorrectly set in DLOAD_CONF.csv
* Z0019: Add FileName RegExp Filter to FH2.show_file
* Z0020: Object View OID Types Errors
* Z0021: Add Year to Month Data Type
* Z0022: Add BFILE Data Type
* Z0023: Character Set Form Errors
* Z0026: Can't Capture User Defined Type Data
* Z0027: Invalid Types and Views from Sample Schema
* Z0028: Semi-Colon Not Working for Object Type Column Data
* Z0030: XDB Schema Capture Not Implemented
* Z0031: XDB Repository Deprecated
* Z0032: Need Source Code Version Updates

Added User/Custom Objects/Types:
* Add User Defined Type Conf Table
* Add Filler Column After User Types
* Change User Type Terminator
* Add PostLoad UNISTR
* Add PreCompile Flag

Data Loading Support:
* SQL*Loader Updates for NLS
* Add Variable Loading Method to SQL*Loader Control File
* Split Out GRAB_DATA Package
* Add XML Schema Capture
* Add cnt to Binary/UNISTR Decode

New Optional Build Types:
* grbsdo - Spatial Data Option
* grbxrep - XML DB Repository

Maintenance:
* Update Invalid Filename Characters Check/Fix


## Upgrade Procedure

All scripts/files are referenced from the Upgrade Folder

1. Transmutable Database Objects (Update/Alter only)
    * grbsrc_add_columns.sql
    * grbsrc_data_mods.sql
2. Commutable Database Objects (Create or Replace)
    * grbsrc_grant_sys.sql
    * grbsrc_grant_nonsys.sql
    * grbsrc/ODBCAPTURE/ODBCAPTURE_VERSION.func
    * grbsrc/ODBCAPTURE/DBA_OBJECTS_VIEW.vw
    * grbsrc/ODBCAPTURE/OBJ_INSTALL_DATA_LOAD_VIEW.vw
    * grbsrc/ODBCAPTURE/COMMON_UTIL.pkssql
    * grbsrc/ODBCAPTURE/GRAB_DATA.pkssql
    * grbsrc/ODBCAPTURE/GRAB_SCRIPTS.pkssql
    * grbsdo/ODBCAPTURE/GRAB_SDO.pkssql
    * grbsrc/ODBCAPTURE/FH2.pkssql
    * grbsrc/ODBCAPTURE/COMMON_UTIL.pkbsql
    * grbsrc/ODBCAPTURE/GRAB_DATA.pkbsql
    * grbsrc/ODBCAPTURE/GRAB_SCRIPTS.pkbsql
    * grbsdo/ODBCAPTURE/GRAB_SDO.pkbsql
    * grbsrc/ODBCAPTURE/FH2.pkbsql
    * grbsrc/ODBCAPTURE/ROOT_SCRIPTS.pkbsql
    * grbsrc/ODBCAPTURE/USER_DEFINED_TYPE_CONF.tbl  -- New Database Object
    * grbsdo/ODBCAPTURE/USER_DEFINED_TYPE_CONF.cldr -- New Database Object
    * grbxrep/SYS/ODBCAPTURE_usr.sgrnt  -- New Database Object
    * grbxrep/ODBCAPTURE/OBJ_INSTALL_XDB_REPO_VIEW.vw  -- New Database Object
    * grbxrep/ODBCAPTURE/GRAB_XDB_REPO.pkbsql  -- New Database Object
    * grbxrep/ODBCAPTURE/GRAB_XDB_REPO.pkssql  -- New Database Object
    * grbxrep/ODBCAPTURE/ROLE_CONF.cldr  -- New Database Object
    * grbxrep/ODBCAPTURE/SCHEMA_CONF.cldr  -- New Database Object

## Downgrade Procedure

All scripts/files are referenced from the Downgrade Folder

1. Remove new column to ODBCAPTURE_INSTALLATION_LOGS table.
    * Run drop_grbsrc_columns.sql
    * drop table "ODBCAPTURE"."USER_DEFINED_TYPE_CONF";
2. Unfinished ...