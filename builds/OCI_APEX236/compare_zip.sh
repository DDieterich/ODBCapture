
#
# Compare Source from Zip File
#
# ./compare_zip.sh" "${ZIP_FILE_ROOT}"
#   1) ${ZIP_FILE_ROOT} - Root name of Zip file (ex. "capture_files")
#

ZIP_FILE_ROOT="${1:-temp_files}"
echo ""

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
