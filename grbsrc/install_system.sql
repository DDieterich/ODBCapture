
--
--  SYSTEM Installation Script
--
--  Must be run as SYSTEM
--

spool install_system.log

prompt Version V2.1 https://ODBCapture.org

set blockterminator off
set sqlblanklines on

----------------------------------------
-- GRANT Install

@dbi.sql "SYSTEM/ODBCAPTURE_usr.grnt" "" ""

----------------------------------------
set sqlblanklines off
set blockterminator on

spool off

