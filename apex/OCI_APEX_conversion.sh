#!/bin/bash

SQL_SCRIPT="OCI_APEX_install.sql"

echo "set define off" > "${SQL_SCRIPT}"

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
         if [ "${2: -6}" = '.cldr"' -o "${2: -5}" = '.cldr' ]
         then
            echo ""
            echo "prompt ------------------------------------------------------------"
            echo "prompt NOTE: DATA LOADING for ${2} NOT IMPLEMENTED"
            echo "prompt ------------------------------------------------------------"
            echo ""
         else
            echo "prompt ${INSTALL_SELECT} ${2//\"/}"
            cat "../${INSTALL_SELECT}/${2//\"/}"
         fi
      else
         echo "${buff}" 
      fi
   done grep -Ev -e '^(set |define |spool |prompt)' |
        sed -e '1,$s/^[@]/--@/1' >> "${SQL_SCRIPT}"
done
