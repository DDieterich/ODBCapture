
### Folder Descriptions

File Name       | Status | Location     | Ver  | Description
----------------|--------|--------------|------|-------------
OCI_APEX236     |        | Oracle Cloud | 23.6 | APEX Service/Instance
OCI_Auto234     | Future | Oracle Cloud | 23.4 | Autonomous Database
OCI_BaseEE234   | Future | Oracle Cloud | 23.4 | Base Enterprise Edition
OCI_BaseSE234   | Future | Oracle Cloud | 23.4 | Base Standard Edition
OnPrem_Free234  |        | On-Premise   | 23.4 | Free Database
OCI_Auto213     |        | Oracle Cloud | 21.3 | Autonomous Database
OCI_BaseEE213   | Future | Oracle Cloud | 21.3 | Base Enterprise Edition
OCI_BaseSE213   | Future | Oracle Cloud | 21.3 | Base Standard Edition
OnPrem_EE213    |        | On-Premise   | 21.3 | Enterprise Edition
OnPrem_SE213    |        | On-Premise   | 21.3 | Standard Edition
OnPrem_XE213    | Future | On-Premise   | 21.3 | Express Edition
OCI_Auto193     | Future | Oracle Cloud | 19.3 | Autonomous Database
OCI_BaseEE193   | Future | Oracle Cloud | 19.3 | Base Enterprise Edition
OCI_BaseSE193   | Future | Oracle Cloud | 19.3 | Base Standard Edition
OnPrem_EE193    |        | On-Premise   | 19.3 | Enterprise Edition
OnPrem_SE193    | Future | On-Premise   | 19.3 | Standard Edition
OnPrem_XE184    |        | On-Premise   | 18.4 | Express Edition
OnPrem_EE122    | Future | On-Premise   | 12.2 | Enterprise Edition
OnPrem_SE122    | Future | On-Premise   | 12.2 | Standard Edition
util            |        |              |      | Common utility scripts for builds


## Build Results

Build results are captured in each of the build folders listed above.  The "build.log" file and the "diff_report.txt" file at the root level show the overall results from the build.  Individual "xml", "log", "bad", and "dsc" files can be found in each of the sub-folders.

### build.log

The "build.log" file includes all output from the build script.  Several searches will show the status of the build.
* `Reporting Summary of Build Type Log Errors` - Header for a section of searches from loaded log files.
* `(ORA-|SQL-|SP2-|PLS-|PL2-|TNS-|(object|mmap) failed|WARNING: Prerequisite BUILD_TYPE)` - Individual errors.
* `Files that are Different` - List of filenames from the diff_report.txt file.

### diff_report.txt

This report shows the differences between the original source code from the main folder and the source code captured after the build.  An empty report shows a perfect build and capture.


## Build Sequence[^1]

Each folder in the "builds" folder contains a "build.sh" script.  This script executes the following sequence.
1. Setup Variables
2. capture_version (from build_functions.sh) - Create "version.txt" file based on Git queries
3. build_init (from build_functions.sh) - Runs the "build_initialize.sql" script.  This will either:
    * Drop and Recreate the PDB.
    * Drop the ODBCAPTURE Schema and perform other cleanup.
4. For Each Build Type
    1. clear_log_files (from build_functions.sh) - Remove "xml", "log", "bad", and "dsc" files
    2. run_build (from build_functions.sh) - Moves to the BUILD_TYPE folder and run the "run_build.sql" script.
    3. If "grbtst" then RAS_Admin_ODBCTEST.racl - Creates Real Application Security configurations while logged in as a specific user.
    4. If "grbtsdo" then COLA_SPATIAL_IDX.tidx - Creates Spatial Data Indexes while logged in as a specific user.
    5. run_report (from build_functions.sh) - Runs the "report_status.sql" script.
    6. move_log_files (from build_functions.sh) - Moves "xml", "log", "bad", and "dsc" files from root level source folders to the correct "builds" folder.
6. compare_source.sh - This script, in coordination with the "capture_files.sql" script, performs the following:
    1. Setup Variables
    2. Run the "capture_files.sql" script.
    3. Decode the ".zip.b64" file.
    4. Unzip the ".zip" file.
    5. Use "diff" to compare source folders with unzipped folders.
    6. Use "grep" to show filenames from "diff_report.txt"

[^1]: APEX Service/Instance does not allow Oracle client connections. All build scripts are adapted for use in APEX web pages.
