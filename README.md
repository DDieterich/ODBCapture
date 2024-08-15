# Oracle DB Capture Development

Native PL/SQL Application to Generate Source Code and Configuration Data

This site is intended for development guides and design documentation.

User information and usage documentation can be found at http://ODBCapture.org.

*NOTE:* Issues are tracked in the Wiki.  See: [Issues Summary](https://github.com/DDieterich/ODBCapture/wiki/Z-Issues-Summary)

## File/Folder List

File Name                  | Description
---------------------------|------------
apex                       | Application Express Scripts Folder
builds                     | Build/Test Scripts Folder
diffs                      | Upgrade/Downgrade Scripts Folder
docs                       | User Documentation Folder
grb_linked_install_scripts | Common Scripts Linked to Install Scripts
grbdat                     | Configuration Data Script Capture
grbjava                    | Java Specific Option
grbras                     | Real Application Security Option
grbsdo                     | Spatial Data Option
grbsrc                     | Main Source Scripts Folder
grbtctx                    | Optional Testing of Context Objects
grbtdat                    | Configuration Data for Testing
grbtjsn                    | JavaScript Object Notation Testing Option
grbtjva                    | Java Testing Option
grbtsdo                    | Spatial Data Option Testing
grbtst                     | Unit Testing Folder

## Installation

1. cd grbsrc
2. sqlplus / as sysdba @install.sql
3. select * from odbcapture_installation_logs;
4. If problems found: more *.log
