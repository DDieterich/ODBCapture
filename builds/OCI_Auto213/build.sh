#!/bin/bash

#
# Build Script for Oracle Cloud Autonomous DB 21.3
#
# Command Line Parameters
#  -) 1 - SYS Password
#  -) 2 - User Password
#  -) 3 - Version
#

SYS_PASS="${1}"
USR_PASS="${2}"
VERSION="${3}"

# Copy stderr and stdout to log file
exec &> >(tee build.log)

########################################
# Confirm starting location
if ! ls "$(basename $0)"
then
   echo "This script must be run from its source location"
   exit -1
fi
HOME_DIR="${PWD}"
echo "Running from ${HOME_DIR}"

########################################
echo ""
echo "Setup Variables"
###
BUTIL_PATH="${HOME_DIR}/../util"
PDB_NAME='DB01'
###
PDB_SYS="ADMIN/${SYS_PASS}@OCI_Auto213_${PDB_NAME}"
SYS_LOGIN="${PDB_SYS}"
PDB_SYSTEM="${PDB_SYS}"
PDB_ODBCTEST="ODBCTEST/13${USR_PASS}@OCI_Auto213_${PDB_NAME}"
PDB_ODBCAPTURE="ODBCAPTURE/67${USR_PASS}@OCI_Auto213_${PDB_NAME}"
ZIP_FILE_ROOT="capture_files"

########################################
# Source the Build Functions
. ${BUTIL_PATH}/build_functions.sh

########################################

capture_version
build_init
for BTYPE in 'grbsrc' 'grbras' 'grbsdo' 'grbdat' 'grbtst' 'grbtjsn' 'grbtsdo' 'grbtctx' 'grbtdat'
do
   clear_log_files "${BTYPE}"
   run_build  "${BTYPE}"
   case "${BTYPE}" in
      "grbtst" )
         run_script "${BTYPE}" "RAS_Admin_ODBCTEST.racl" "${PDB_ODBCTEST}";;
      "grbtsdo" )
         run_script "${BTYPE}" "COLA_SPATIAL_IDX.tidx" "${PDB_ODBCTEST}";;
   esac
   run_report      "${BTYPE}" "${PDB_SYSTEM}"
   move_log_files  "${BTYPE}"
done
"${BUTIL_PATH}/compare_source.sh" "${PDB_ODBCAPTURE}" "${ZIP_FILE_ROOT}"
