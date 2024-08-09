
--
--  SYS Installation Script
--
--  Must be run as SYS
--

spool install_sys.log

set blockterminator off
set sqlblanklines on

----------------------------------------
-- SYS_GRANT Install

@dbi.sql "SYS/ODBCTEST_usr.sgrnt" "" ""

----------------------------------------
set sqlblanklines off
set blockterminator on

spool off

