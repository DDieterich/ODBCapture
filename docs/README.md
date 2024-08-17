
ODBCapture is a native PL/SQL application that can be used to generate self-building scripts (source code and configuration data) for a database.

This website is intended for user information and usage documentation.  Development guides and design documentation can be found in [the wiki](https://github.com/DDieterich/ODBCapture/wiki)

Click [here for a white paper overview](Generating-Self-Build.md) on **Generating Self-Build Scripts**.

## ODBCapture Installation

[Installation instructions](https://github.com/DDieterich/ODBCapture?tab=readme-ov-file#main-odbcapture-installation) are on the main page on GitHub.  This is the same location as the "View Oracle DB Capture on GitHub" link above.


## Application Configuration

Configuring ODBCapture can be as simple as adding 2 configuration records.  More complex configurations involve installation layering, object selection/filtering, role identification, and configuration data capture.

Care must be taken to preserve any ODBCapture configurations for an application.  Best practice is to create a configuration data installation layer that keeps ODBCapture configuration data separate from configuration data for a target application.


### Simple Configuration

**Add record to BUILD_CONF**

There are 2 columns that require data in the BUILD_CONF table:
* **BUILD_SEQ** is the Unique Sequence of the build type
* **BUILD_TYPE** is the Name of the build type


**Add record to SCHEMA_CONF**

There are 3 columns that require data in the SCHEMA_CONF table:
* **USERNAME** is the Name of the database schema
* **BUILD_TYPE** is the Build Type from the BUILD_CONF record above.
* **ORACLE_PROVIDED** should always be set to 'N'


### Advanced Configuration

Advanced configuration is entirely related to Build Script Layering.  Build Script Layering allows configuration of:
* Basic application configuration data
* Environment and/or test specific configuration data
* PL/SQL for unit testing on a development database
* Test data for unit testing on a development database
* PL/SQL for QA testing on a QA database
* Test data for QA testing on a QA database

See the [Build Script Layering](Build_Script_Layering.md) page for more details.


## Application Source Code Capture

After configuration is complete, application source code capture is accomplished using the following steps:
```
execute ODBCAPTURE.FH2.clear_buffers;
execute ODBCAPTURE.COMMON_UTIL.update_view_tabs;
execute ODBCAPTURE.GRAB_SCRIPTS.all_scripts('CONFIGURED_BUILD_TYPE');
execute ODBCAPTURE.FH2.write_scripts('FILE_NAME.zip');
```
Then, download and unzip FILE_NAME.zip.

The [capture_files.sql](https://github.com/DDieterich/ODBCapture/blob/main/builds/util/capture_files.sql) SQL script can be used for source code capture if the ODBCAPTURE_INSTALLATION_LOGS table has been created and includes records for all the needed BUILD TYPES.  This SQL script runs correctly in SQL*Plus.


## Application Build

After application source code has been captured by ODBCapture, the installation of the application is the same as the ODBCapture installation.  The `install.sql` script that is captured in each BUILD_TYPE folder is the core of the installation.

[Several examples](https://github.com/DDieterich/ODBCapture/tree/main/builds#build-sequence) of build scripts can be found in the "builds" folder on the main page on GitHub.  These build scripts are Linux oriented for several reasons:
* Oracle Docker images run Linux internally.
* Visual Source Code includes a BASH terminal that is Linux compatable.
* Git Tools are delivered with GitBash, which is Linux compatable.
* Windows Subsystem for Linux (WSL) is Linux compatable.
* Apple's MacOS is Linux compatable.


## Application Source Code Audit

Auditing source code is a simple process.  It is described in the [Build Sequence](https://github.com/DDieterich/ODBCapture/tree/main/builds#build-sequence) listed in the "builds" folder on the main page on GitHub.  The basic idea is to capture application source code from the production database and compare it to the application source code in the source control system (ex. Git).  In the build sequence from the "builds" folder, the Linux "diff" utility is used to compare the 2 sets of files.


## References

* [JUnit_XML_Format.md](JUnit_XML_Format.md)
* [RAS_DBA_Columns.ods](RAS_DBA_Columns.ods)


---
Website formatted with [jekyll-theme-minimal](https://github.com/pages-themes/minimal)

Oracle and Java are trademarks of [Oracle Corp](https://www.oracle.com/).