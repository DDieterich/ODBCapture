# APEX Service/Instance

[Oracle.com Website](https://www.oracle.com/application-development/apex/)

This folder includes ODBCapture installation scripts for Oracle's APEX Service/Instance on OCI.


## File/Folder List

File Name                    | Description
-----------------------------|-------------
OCI_APEX_convall.sh          | Bash Script to Convert all Source Code Folders
OCI_APEX_conversion.sh*      | Bash Script to Convert one Source Code Folder
OCI_APEX_install_grbdat.sql  | Converted Source Code Script for APEX OCI
OCI_APEX_install_grbjava.sql | Converted Source Code Script for APEX OCI
OCI_APEX_install_grbras.sql  | Converted Source Code Script for APEX OCI
OCI_APEX_install_grbsdo.sql  | Converted Source Code Script for APEX OCI
OCI_APEX_install_grbsrc.sql  | Converted Source Code Script for APEX OCI
OCI_APEX_install_grbtctx.sql | Converted Source Code Script for APEX OCI
OCI_APEX_install_grbtdat.sql | Converted Source Code Script for APEX OCI
OCI_APEX_install_grbtjsn.sql | Converted Source Code Script for APEX OCI
OCI_APEX_install_grbtjva.sql | Converted Source Code Script for APEX OCI
OCI_APEX_install_grbtsdo.sql | Converted Source Code Script for APEX OCI
OCI_APEX_install_grbtst.sql  | Converted Source Code Script for APEX OCI

## Installation

### Update OCI APEX Scripts

Run OCI_APEX_conversion.sh

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
4. Save to file `../builds/OCI_APEX235/build_initialize.sql`

![Icons used to Open, Run, and Download the build script.](build_initialize.PNG)

### Installation

Repeat the above steps for OCI_APEX_install_grbsrc.sql
