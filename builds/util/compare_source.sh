
#
# Compare Source
#
# "${BUTIL_PATH}/compare_source.sh" "${PDB_ODBCAPTURE}" "${ZIP_FILE_ROOT}"
#
# https://ogobrecht.com/posts/2020-01-01-download-blobs-with-sqlplus/
# Download BLOBs with SQL*Plus
#

BUTIL_PATH="$(dirname ${0})"
PDB_ODBCAPTURE="${1}"
ZIP_FILE_ROOT="${2:-temp_files}"
echo ""

echo "capture_files.sql"
echo 'exit' | sqlplus "${PDB_ODBCAPTURE}" "@${BUTIL_PATH}/capture_files.sql" "${ZIP_FILE_ROOT}"
retcd="${?}"
if [ "${retcd}" != "0" ]
then
   echo "SQL*Plus returned ${retcd}.  Aborting"
   exit "${retcd}"
fi

echo "Remove Carriage Returns before translating Base64"
tr -d '\r' < "${ZIP_FILE_ROOT}.zip.b64" | base64 -d - > "${ZIP_FILE_ROOT}.zip"
rm "${ZIP_FILE_ROOT}.zip.b64"
echo "Setup and Unzip"
rm -rf "${ZIP_FILE_ROOT}"
mkdir "${ZIP_FILE_ROOT}"
cd "${ZIP_FILE_ROOT}"
unzip "../${ZIP_FILE_ROOT}.zip"
cd ..

echo "Compare Source Code"
cd "${ZIP_FILE_ROOT}"
ls | while read FOLDER
     do
        diff -drywtNW 172 --suppress-common-lines "../../../${FOLDER}" "${FOLDER}"
     done > "../diff_report.txt" 2>&1
cd ..
echo ""

echo "Files that are Different"
grep -e '^diff ' "diff_report.txt" | cut '-d ' -f6
