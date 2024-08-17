#!/bin/bash

if [ "$#" != "1" -o "${1}" = "" ]
then
   echo "1st Parameter (INSTALL_SELECT) is missing"
   exit -1
fi
INSTALL_FILE_NAME="${1}"

cat "../${INSTALL_FILE_NAME}/install_sys.sql" \
    "../${INSTALL_FILE_NAME}/install_SYSTEM.sql" \
    "../${INSTALL_FILE_NAME}/install_${INSTALL_FILE_NAME}.sql" |
   while read buff
do
   if [ "${buff:0:9}" = '@dbi.sql ' ]
   then
      set ${buff}    # Parses "buff" into command line parameters like $1
      if [ "${2: -6}" = '.cldr"' -o "${2: -5}" = '.cldr' ]
      then
         echo ""
         echo "------------------------------------------------------------"
         echo "NOTE: DATA LOADING for ${2} NOT IMPLEMENTED"
         echo "------------------------------------------------------------"
         echo ""
      else
         cat "../${INSTALL_FILE_NAME}/${2//\"/}"
      fi
   else
      echo "${buff}" 
   fi
done |
   grep -Ev -e '^(set |define |spool |prompt)' |
   sed -e '1,$s/^[@]/--@/1' \
   > "OCI_APEX_install_${INSTALL_FILE_NAME}.sql"
