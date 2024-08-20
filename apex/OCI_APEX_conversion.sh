#!/bin/bash

SQL_SCRIPT="OCI_APEX_install.sql"

echo "
prompt Converted/Consolidated SQL Script for APEX Instance on OCI
" > "${SQL_SCRIPT}"

for INSTALL_SELECT in 'grbsrc' 'grbras' 'grbsdo' 'grbdat' 'grbtst' 'grbtjsn' 'grbtsdo' 'grbtctx' 'grbtdat'
do
   cat "../${INSTALL_SELECT}/install_sys.sql" \
       "../${INSTALL_SELECT}/install_SYSTEM.sql" \
       "../${INSTALL_SELECT}/install_${INSTALL_SELECT}.sql" |
      while read buff
   do
      if [ "${buff:0:9}" = '@dbi.sql ' ]
      then
         set ${buff}    # Parses "buff" into command line parameters like $1
         DBI_FILENAME="${2//\"/}"
         echo ""
         echo "prompt ============================================================"
         echo "prompt Running: ${INSTALL_SELECT} ${DBI_FILENAME}"
         echo "prompt ============================================================"
         if [ "${DBI_FILENAME: -5}" = '.cldr' ]
         then
            SCHEMA_NAME="$(dirname "${DBI_FILENAME}")"
            TABLE_NAME="$(basename "${DBI_FILENAME/[.]cldr/}")"
            CSV_FILENAME="../${INSTALL_SELECT}/${DBI_FILENAME/[.]cldr/.csv}"
            echo "prompt Translating ${CSV_FILENAME} to 'INSERT INTO'"
            echo ""
            sed -e '1d' \
                -e '1,$s/\r$//1' \
                -e "1,\$s/'/''/g" \
                -e '1,$s/""/||/g' \
                -e "1,\$s/\"/'/g" \
                -e '1,$s/[|][|]/"/g' \
                -e '1,$s/^,/NULL,/1' \
                -e '1,$s/[,][,]/,NULL,/g' \
                -e '1,$s/[,][,]/,NULL,/g' \
                -e '1,$s/,$/,NULL/1' \
                 < "${CSV_FILENAME}" |
                while read CSV_LINE
            do
               echo "insert into \"${SCHEMA_NAME}\".\"${TABLE_NAME}\" ($(head -1 "${CSV_FILENAME}"))"
               echo "  values (${CSV_LINE});"
               echo ""
            done
         else
            cat "../${INSTALL_SELECT}/${DBI_FILENAME}"
         fi
      else
         echo "${buff}" 
      fi
   done |
      grep -Ev -e '^(spool |set linesize |set trimspool |set termout |set sqlprefix |define INSTALL_SYSTEM_CONNECT[ =])' |
      sed -e '1,$s/^[@]/--@/1' >> "${SQL_SCRIPT}"
done
