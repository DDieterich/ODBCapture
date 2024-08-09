#!/bin/bash

for INSTALL_SELECT in grbdat grbjava grbras grbsdo grbsrc grbtctx grbtdat grbtjsn grbtjva grbtsdo grbtst
do
   ./OCI_APEX_conversion.sh "${INSTALL_SELECT}"
done
