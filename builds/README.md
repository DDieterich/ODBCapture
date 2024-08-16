
### Folder Descriptions

File Name       | Description
----------------|------------
OCI_Auto234     | (Future) Oracle Cloud 23.4 Autonomous Database
OCI_BaseEE234   | (Future) Oracle Cloud Base 23.4 Enterprise Edition
OCI_BaseSE234   | (Future) Oracle Cloud Base 23.4 Standard Edition
OnPrem_Free234  |          Oracle On-Premise 23.4 Free Database
OCI_Auto213     |          Oracle Cloud 21.3 Autonomous Database
OCI_BaseEE213   | (Future) Oracle Cloud Base 21.3 Enterprise Edition
OCI_BaseSE213   | (Future) Oracle Cloud Base 21.3 Standard Edition
OnPrem_EE213    |          Oracle On-Premise 21.3 Enterprise Edition
OnPrem_SE213    |          Oracle On-Premise 21.3 Standard Edition
OnPrem_XE213    | (Future) Oracle On-Premise 21.3 Express Edition
OCI_Auto193     | (Future) Oracle Cloud 19.3 Autonomous Database
OCI_BaseEE193   | (Future) Oracle Cloud Base 19.3 Enterprise Edition
OCI_BaseSE193   | (Future) Oracle Cloud Base 19.3 Standard Edition
OnPrem_EE193    |          Oracle On-Premise 19.3 Enterprise Edition
OnPrem_SE193    | (Future) Oracle On-Premise 19.3 Standard Edition
OnPrem_XE184    |          Oracle On-Premise 18.4 Express Edition
OnPrem_EE122    | (Future) Oracle On-Premise 12.2 Enterprise Edition
OnPrem_SE122    | (Future) Oracle On-Premise 12.2 Standard Edition


## Build Results

Build results are captured in each of the build folders listed above.  The "build.log" file and the "diff_report.txt" file at the root level show the overall results from the build.  Individual "xml", "log", "bad", and "dsc" files can be found in each of the sub-folders.

### build.log

The "build.log" file includes all output from the build script.  Several searches will show the status of the build.
* `Reporting Summary of Build Type Log Errors` - Header for a section of searches from loaded log files.
* `(ORA-|SQL-|SP2-|PLS-|PL2-|TNS-|(object|mmap) failed|WARNING: Prerequisite BUILD_TYPE)` - Individual errors.
* `Files that are Different` - List of filenames from the diff_report.txt file.

### diff_report.txt

This report shows the differences between the original source code from the main folder and the source code captured after the build.  An empty report shows a perfect build and capture.


## Build Sequence

### build.sh
1. Setup Variables
2. util/build_functions.sh
3. capture_version
3. build_init
4. For Each Build Type
   1. clear_log_files
   2. run_build
   3. If "grbtst" then RAS_Admin_ODBCTEST.racl
   4. If "grbtsdo" then COLA_SPATIAL_IDX.tidx
   5. run_report
   6. move_log_files
5. update_nonid_sequences
6. compare_source

### capture_version (from build_functions.sh)

Create "version.txt" file based on Git queries

### build_init (from build_functions.sh)

Runs the "build_initialize.sql" script.  This either:
* Drops and Recreates the PDB.
* Drops ODBCAPTURE Schema and other cleanup.

### clear_logs (from build_functions.sh)

Remove "xml", "log", "bad", and "dsc" files

### run_build (from build_functions.sh)

Moves to the BUILD_TYPE folder and run the "run_build.sql" script.

### RAS_Admin_ODBCTEST.racl

Creates Real Application Security configurations while logged in as a specific user.

### COLA_SPATIAL_IDX.tidx

Creates Spatial Data Indexes while logged in as a specific user.

### run_report (from build_functions.sh)

Runs the "report_status.sql" script.

### move_log_files (from build_functions.sh)

Moves "xml", "log", "bad", and "dsc" files from root level source folders to the correct "builds" folder.

### compare_source.sh

This script, in coordination with the "capture_files.sql" script, performs the following:
1. Setup Variables
2. Run the "capture_files.sql" script.
3. Decode the ".zip.b64" file.
4. Unzip the ".zip" file.
5. Use "diff" to compare source folders with unzipped folders.
6. Use "grep" to show filenames from "diff_report.txt"
