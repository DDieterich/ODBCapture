#!/bin/bash

#
# Build Script for Oracle Enterprise Edition 21.3
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
PDB_NAME='DEVPDB'
###
#HOST_NAME_PORT='localhost:1521'
#SYS_LOGIN="SYS/${SYS_PASS}@//${HOST_NAME_PORT}/SE213CDB as sysdba"
SYS_LOGIN="SYS/${SYS_PASS}@OnPrem_SE213CDB as sysdba"
PDB_SYS="SYS/${SYS_PASS}@OnPrem_SE213_${PDB_NAME} as sysdba"
PDB_SYSTEM="SYSTEM/${SYS_PASS}@OnPrem_SE213_${PDB_NAME}"
PDB_ODBCTEST="ODBCTEST/13${USR_PASS}@OnPrem_SE213_${PDB_NAME}"
PDB_ODBCAPTURE="ODBCAPTURE/67${USR_PASS}@OnPrem_SE213_${PDB_NAME}"
ZIP_FILE_ROOT="capture_files"

########################################
# Source the Build Functions
. ${BUTIL_PATH}/build_functions.sh

########################################

capture_version
build_init
for BTYPE in 'grbsrc' 'grbjava' 'grbsdo' 'grbdat' 'grbtst' 'grbtjva' 'grbtjsn' 'grbtsdo' 'grbtctx' 'grbtdat'
do
   clear_log_files "${BTYPE}"
   run_build  "${BTYPE}"
   case "${BTYPE}" in
      "grbtst" )
         echo "Skipping 'RAS_Admin_ODBCTEST.racl' for Standard Edition 21.3" \
            > "${HOME_DIR}/../../${BUILD_TYPE}/RAS_Admin_ODBCTEST.racl.log";;
      "grbtsdo" )
         run_script "${BTYPE}" "COLA_SPATIAL_IDX.tidx" "${PDB_ODBCTEST}";;
   esac
   run_report      "${BTYPE}" "${PDB_SYSTEM}"
   move_log_files  "${BTYPE}"
done
"${BUTIL_PATH}/compare_source.sh" "${PDB_ODBCAPTURE}" "${ZIP_FILE_ROOT}"
