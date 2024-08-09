
--
--  grbtjva Installation Script
--
--  Must be run as a SYSTEM User (DBA)
--
-- Command Line Parameters:
--   1 - INSTALL_SYSTEM_CONNECT: SYSTEM/password@TNSALIAS
--       i.e. pass the username and password for the SYSTEM user
--            and the TNSALIAS for the connection to the database.
--       The Data Load installation requires this connection information.
--

spool install_grbtjva.log

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
-- PACKAGE Install

@dbi.sql "ODBCTEST/DIR_UTIL.pkssql" "ODBCTEST" "&INSTALL_SYSTEM_CONNECT."

----------------------------------------
-- JAVA SOURCE Install

@dbi.sql "ODBCTEST/DirUtil.pjv" "ODBCTEST" "&INSTALL_SYSTEM_CONNECT."

----------------------------------------
-- PACKAGE BODY Install

@dbi.sql "ODBCTEST/DIR_UTIL.pkbsql" "ODBCTEST" "&INSTALL_SYSTEM_CONNECT."

----------------------------------------
-- Finalize Installation (Includes SPOOL OFF)
@dbi.sql "./installation_finalize.sql" "" "&INSTALL_SYSTEM_CONNECT."

spool off

