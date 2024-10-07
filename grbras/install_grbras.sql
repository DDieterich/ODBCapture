
--
--  grbras Installation Script
--
--  Must be run as a SYSTEM User (DBA)
--
-- Command Line Parameters:
--   1 - INSTALL_SYSTEM_CONNECT: SYSTEM/password@TNSALIAS
--       i.e. pass the username and password for the SYSTEM user
--            and the TNSALIAS for the connection to the database.
--       The Data Load installation requires this connection information.
--

spool install_grbras.log

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
-- PACKAGE_SPEC Install

@dbi.sql "ODBCAPTURE/GRAB_RAS.pkssql" "ODBCAPTURE" "&INSTALL_SYSTEM_CONNECT."

----------------------------------------
-- TABLE Install

@dbi.sql "ODBCAPTURE/EXPORTING_RAS_DATA.tbl" "ODBCAPTURE" "&INSTALL_SYSTEM_CONNECT."

----------------------------------------
prompt Compile All started
begin
   DBMS_UTILITY.compile_schema(schema      => 'ODBCAPTURE'
                              ,compile_all => FALSE);
end;
/
prompt Compile All is done.
----------------------------------------
-- VIEW Install

@dbi.sql "ODBCAPTURE/PRIV_OBJ_RACL_VIEW.vw" "ODBCAPTURE" "&INSTALL_SYSTEM_CONNECT."

----------------------------------------
-- DATA_LOAD Install

@dbi.sql "ODBCAPTURE/ROLE_CONF.cldr" "ODBCAPTURE" "&INSTALL_SYSTEM_CONNECT."
@dbi.sql "ODBCAPTURE/SCHEMA_CONF.cldr" "ODBCAPTURE" "&INSTALL_SYSTEM_CONNECT."

----------------------------------------
-- PACKAGE_BODY Install

@dbi.sql "ODBCAPTURE/GRAB_RAS.pkbsql" "ODBCAPTURE" "&INSTALL_SYSTEM_CONNECT."

----------------------------------------
-- Finalize Installation (Includes SPOOL OFF)
@dbi.sql "./installation_finalize.sql" "" "&INSTALL_SYSTEM_CONNECT."

spool off

