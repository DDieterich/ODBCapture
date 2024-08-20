# APEX Service/Instance

[Oracle.com Website](https://www.oracle.com/application-development/apex/)

This folder includes ODBCapture installation scripts for Oracle's APEX Service/Instance on OCI.


## File/Folder List

File Name               | Description
------------------------|-------------
build_initialize.PNG    | Screen shot for documentation
OCI_APEX_conversion.sh  | Bash Script to Convert one Source Code Folder
OCI_APEX_install.sql    | Converted Source Code Script


## Installation

### Run OCI_APEX_conversion.sh
1. Run BASH
2. "cd" to this folder
3. ./OCI_APEX_conversion.sh
4. Review OCI_APEX_install.sql

### Login to APX01 Database Actions on Oracle Cloud
1. Go to [Oracle MyCloud](https://myservices-ddieterich.console.oraclecloud.com/mycloud/cloudportal/gettingStarted)
2. Set Tenancy to `DDieterich`
3. Set Identity Domain to `OracleIdentityCloudService`
4. Enter `User Name` and `Password`
5. Enter `Passcode` from Google Authentication
6. Go to `APEX Instances`
7. Click on `APX01`
8. Click on `Launch Database Actions`
9. Under the `Development` tab, click on `SQL`

### Initialize APX01
1. Open `../builds/OCI_APEX235/build_initialize.sql`
2. Click on `Run script`
3. Click on `Download Script Output`
4. Save to file `../builds/OCI_APEX235/build_initialize.txt`
5. Review `../builds/OCI_APEX235/build_initialize.txt`

![Icons used to Open, Run, and Download the build script.](build_initialize.PNG)

### Installation
1. Open `OCI_APEX_install.sql`
2. Click on `Run script`
3. Click on `Download Script Output`
4. Save to file `../builds/OCI_APEX235/OCI_APEX_install.txt`
5. Review `../builds/OCI_APEX235/OCI_APEX_install.txt`

### Notes

```
The only configuration commands that persist during a session in Database Actions are:

SET DEF[INE] <ON|OFF|prefix_character>
SET ESC[APE] <ON|OFF|escape_character>
SET TIMI[NG] <ON|OFF>
```

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Ref: Using Guide for Oracle Cloud](https://docs.oracle.com/en/database/oracle/sql-developer-web/sdwad/sql-page.html#GUID-3B651F54-DE41-42BD-B643-19741A25213A)