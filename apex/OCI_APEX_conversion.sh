#!/bin/bash

SQL_SCRIPT="OCI_APEX_install.sql"

echo "
prompt Converted/Consolidated SQL Script for APEX Instance on OCI
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YYYY HH24:MI:SS';
" > "${SQL_SCRIPT}"

for INSTALL_SELECT in 'grbsrc' 'grbras' 'grbsdo' 'grbdat' 'grbtst' 'grbtjsn' 'grbtsdo' 'grbtctx' 'grbtdat'
do
   cat "../${INSTALL_SELECT}/install_sys.sql" \
       "../${INSTALL_SELECT}/install_SYSTEM.sql" \
       "../${INSTALL_SELECT}/install_${INSTALL_SELECT}.sql" |
      while IFS="" read -r MAIN_LINE
   do
      if [ "${MAIN_LINE:0:9}" = '@dbi.sql ' ]
      then
         set ${MAIN_LINE}    # Parses "MAIN_LINE" into command line parameters like $1
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
            cat "../${INSTALL_SELECT}/${DBI_FILENAME}" |
               while IFS="" read -r CLDR_LINE
            do
               if [ "${CLDR_LINE:0:12}" = 'host sqlldr ' ]
               then
                  echo ""
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
                      while IFS="" read -r CSV_LINE
                  do
                     echo "insert into \"${SCHEMA_NAME}\".\"${TABLE_NAME}\" ($(head -1 "${CSV_FILENAME}"))"
                     echo "  values (${CSV_LINE});"
                     echo ""
                  done
               else
                  echo "${CLDR_LINE/'&_RC.'/'0'}"
               fi
            done
            echo "commit;"
         elif [ "${DBI_FILENAME: -4}" = '.sql' ]
         then
            grep -Ev -e '^spool ' \
                     -e '^set linesize ' \
                     -e '^set trimspool ' \
                     -e '^set termout ' \
                     -e '^set sqlprefix ' \
               < "../${INSTALL_SELECT}/${DBI_FILENAME}"
         else
            cat < "../${INSTALL_SELECT}/${DBI_FILENAME}"
         fi
      else
         echo "${MAIN_LINE}" |
            grep -Ev -e '^spool ' \
                     -e '^set linesize ' \
                     -e '^set trimspool ' \
                     -e '^set termout ' \
                     -e '^set sqlprefix ' \
                     -e '^define INSTALL_SYSTEM_CONNECT[ =]' \
                     -e '^define TOP_PDB_SYSTEM[ =]'
      fi
   done | sed -e '1,$s/^[@]/--@/1' >> "${SQL_SCRIPT}"
done

#
# Add All Finalize Scripts
#
(
   cat < "../grb_linked_install_scripts/fix_invalid_public_synonyms.sql"
   sed -e "1,\$s/&1[.]/'ODBCAPTURE','ODBCTEST'/g" \
       < "../grb_linked_install_scripts/compile_all.sql"
   sed -e "1,\$s/&1[.]/ENABLE/g" \
       -e "1,\$s/&2[.]/'ODBCAPTURE','ODBCTEST'/g" \
       < "../grb_linked_install_scripts/alter_foreign_keys.sql"
   sed -e "1,\$s/&1[.]/ENABLE/g" \
       -e "1,\$s/&2[.]/'ODBCAPTURE','ODBCTEST'/g" \
       < "../grb_linked_install_scripts/alter_triggers.sql"
   sed -e "1,\$s/&1[.]/'ODBCAPTURE','ODBCTEST'/g" \
       < "../grb_linked_install_scripts/update_id_sequences.sql"
#   sed -e "1,\$s/&1[.]/ENABLE/g" \
#       -e "1,\$s/&2[.]/'ODBCAPTURE','ODBCTEST'/g" \
#       < "../grb_linked_install_scripts/alter_queues.sql"
#   sed -e "1,\$s/&1[.]/ENABLE/g" \
#       -e "1,\$s/&2[.]/'ODBCAPTURE','ODBCTEST'/g" \
#       < "../grb_linked_install_scripts/alter_scheduler_jobs.sql"
) | grep -Ev -e '^spool ' \
             -e '^set linesize ' \
             -e '^set trimspool ' \
             -e '^set termout ' \
             -e '^set sqlprefix ' |
    sed '1,$s/^[@]/--@/1' >> "${SQL_SCRIPT}"
