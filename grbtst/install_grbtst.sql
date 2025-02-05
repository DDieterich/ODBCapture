
--
--  grbtst Installation Script
--
--  Must be run as a SYSTEM User (DBA)
--
-- Command Line Parameters:
--   1 - INSTALL_SYSTEM_CONNECT: SYSTEM/password@TNSALIAS
--       i.e. pass the username and password for the SYSTEM user
--            and the TNSALIAS for the connection to the database.
--       The Data Load installation requires this connection information.
--

spool install_grbtst.log

define INSTALL_SYSTEM_CONNECT="&1."

-- For Oracle Change Data Capture (CDC) packages
set sqlprefix "~"

-- Escape character: "^P", CHR(16), DLE
set escape OFF
set escape ""

----------------------------------------
--  Prepare for Install
@dbi.sql "./installation_prepare.sql" "" "&INSTALL_SYSTEM_CONNECT."

----------------------------------------
-- FUNCTION Install

@dbi.sql "ODBCTEST/HTML_TO_UNISTR.func" "ODBCTEST" "&INSTALL_SYSTEM_CONNECT."

----------------------------------------
-- TABLE Install

@dbi.sql "ODBCAPTURE/GRBTST__NAME.tbl" "ODBCAPTURE" "&INSTALL_SYSTEM_CONNECT."
@dbi.sql "ODBCAPTURE/GRBTST_IMAGE.tbl" "ODBCAPTURE" "&INSTALL_SYSTEM_CONNECT."
@dbi.sql "ODBCTEST/UNISTR_CLOBS.tbl" "ODBCTEST" "&INSTALL_SYSTEM_CONNECT."
@dbi.sql "ODBCTEST/UNISTR_LIST.tbl" "ODBCTEST" "&INSTALL_SYSTEM_CONNECT."

----------------------------------------
-- DATA_LOAD Install

@dbi.sql "ODBCAPTURE/GRBTST__NAME.cldr" "ODBCAPTURE" "&INSTALL_SYSTEM_CONNECT."
@dbi.sql "ODBCAPTURE/GRBTST_IMAGE.cldr" "ODBCAPTURE" "&INSTALL_SYSTEM_CONNECT."
@dbi.sql "ODBCAPTURE/TSPACE_CONF.cldr" "ODBCAPTURE" "&INSTALL_SYSTEM_CONNECT."
@dbi.sql "ODBCTEST/UNISTR_CLOBS.cldr" "ODBCTEST" "&INSTALL_SYSTEM_CONNECT."
@dbi.sql "ODBCTEST/UNISTR_LIST.cldr" "ODBCTEST" "&INSTALL_SYSTEM_CONNECT."

----------------------------------------
-- TABLE_INDEX Install

@dbi.sql "ODBCTEST/UNISTR_LIST.tidx" "ODBCTEST" "&INSTALL_SYSTEM_CONNECT."

----------------------------------------
-- Finalize Installation (Includes SPOOL OFF)
@dbi.sql "./installation_finalize.sql" "" "&INSTALL_SYSTEM_CONNECT."

spool off

