# Oracle DB Capture Development

Native PL/SQL Application to Capture Source Code and Configuration Data

This site is intended for development guides and design documentation.  User information and usage documentation can be found at http://ODBCapture.org.

*NOTE1:* Issues are tracked in the Wiki.  See: [Issues Summary](https://github.com/DDieterich/ODBCapture/wiki/Z-Issues-Summary)

*NOTE2:* I uploaded an image to customize this repository’s social media preview, but I don't see it anywhere.

## File/Folder List

File Name                  | Description
---------------------------|------------
apex                       | Consolidated Install Scripts for APEX DB on OCI
builds                     | Build/Test Scripts/Log
diffs                      | Upgrade/Downgrade Scripts
docs                       | User Documentation
grb_linked_install_scripts | Common Scripts Linked by Installation Scripts
grbdat                     | Configuration Data to capture ODBCapture Scripts
grbjava                    | Optional Java (Internal JVM) Option
grbras                     | Optional Real Application Security Option
grbsdo                     | Optional Spatial Data Option
grbsrc                     | Main ODBCapture Installation Scripts
grbtctx                    | Unit Testing of Context Objects
grbtdat                    | Unit Testing Configuration Data
grbtjsn                    | Unit Testing of JavaScript Object Notation (JSON)
grbtjva                    | Unit Testing for Java Option
grbtsdo                    | Unit Testing for Spatial Data
grbtst                     | Unit Testing Main Scripts
grbxrep                    | XML DB Repository Objects/Data (Deprecated)

## Installation

### Main ODBCapture Installation:

1. Download the Instllation ZIP (or Tarball) and extract the files.
2. Create an Installation Folder
3. Copy Common Script Folder `grb_linked_install_scripts` to the new Installation Folder
4. Copy Main Script Folder `grbsrc` to the new Installation Folder
5. Move to Main Scripts Folder in the new Installation Folder: `cd grbsrc`
6. Connect to the Database as SYS: `sqlplus SYS/PASSWORD@TNS_ALIAS as sysdba`
7. Run and Main Installation Script: `@install.sql "SYSTEM/PASSWORD@TNS_ALIAS"`
8. Set the ODBCAPTURE user password: `alter user "ODBCAPTURE" identified by "PASSWORD";`
9. Run the installation reports: `@report_status.sql "SYSTEM/PASSWORD"`
10. Exit from SQL*Plus: `exit`
11. Review results from installation reports

### Optional Installations:

* Copy and Repeat Install from the `grbjava` folder to capture Java Source Code from the Database
* Copy and Repeat Install from the `grbras` folder to capture Real Application Security Source Code
* Copy and Repeat Install from the `grbsdo` folder to capture Spatial Data Source Code

### Removal

To remove, `drop user ODBCAPTURE cascade;`

## Critical Issues

* [grbtst "xs_principal" Users Missing from RAS_Admin_ODBCTEST.racl](https://github.com/DDieterich/ODBCapture/wiki/Z0015)
* [grbtst Wallet (WACL) is Missing from GRAB_SCRIPTS.all_scripts](https://github.com/DDieterich/ODBCapture/wiki/Z0014)
* [DBMS_METADATA get_ddl ORGANIZATION INDEX NOCOMPRESS](https://github.com/DDieterich/ODBCapture/wiki/Z0012)
* [DBMS_METADATA get_ddl for object_type XS_USER](https://github.com/DDieterich/ODBCapture/wiki/Z0011)
* [Implement Label Security](https://github.com/DDieterich/ODBCapture/wiki/Z0010)
* [Implement Data Vault](https://github.com/DDieterich/ODBCapture/wiki/Z0009)
* [Implement Library Element](https://github.com/DDieterich/ODBCapture/wiki/Z0008)
* [Implement Addition Real Application Security Components](https://github.com/DDieterich/ODBCapture/wiki/Z0007)
* [Confirm Oracle Spatial/Locator/Graph/Multimedia Datatype](https://github.com/DDieterich/ODBCapture/wiki/Z0005)
* [Add Oracle Text Exports](https://github.com/DDieterich/ODBCapture/wiki/Z0004)


---
Oracle and Java are trademarks of [Oracle Corp](https://www.oracle.com/).