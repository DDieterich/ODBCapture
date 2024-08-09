
--
--  Master Installation Script
--    All scripts created by "https://ODBCapture.org", Version V2.1
--
--  Must be run as SYS
--
-- Command Line Parameters:
--   1 - TO_PDB_SYSTEM: SYSTEM/password@TNSALIAS
--       i.e. pass the username and password for the SYSTEM user
--            and the TNSALIAS for the connection to the pluggable database.
--       The Data Load installation requires this connection information.
--

--  NOTE: If running in a Linux based Docker Container from a Windows FileSystem Mount, run this first:
--    dos2unix -f -o ../install/*/*.csv ../install/*/*/*.csv

define TOP_PDB_SYSTEM="&1."
set serveroutput on size unlimited format wrapped

----------------------------------------
prompt Identify this Module in V$SESSION
set appinfo "grbtjsn Installation"

----------------------------------------
prompt Setup Abort on Error
WHENEVER SQLERROR EXIT SQL.SQLCODE
WHENEVER OSERROR EXIT

----------------------------------------
prompt
prompt **************************
prompt *  Run SYS Installation  *
prompt **************************
prompt
@install_sys.sql "" "" ""

----------------------------------------
prompt Setup Continue on Error
WHENEVER SQLERROR CONTINUE
WHENEVER OSERROR CONTINUE

----------------------------------------
prompt
prompt *****************************
prompt *  Run SYSTEM Installation  *
prompt *****************************
prompt
connect &TOP_PDB_SYSTEM.
set serveroutput on size unlimited format wrapped
@install_system.sql "" "" ""

----------------------------------------
prompt
prompt *************************
prompt *  Install Application  *
prompt *************************
prompt
@install_grbtjsn.sql "&TOP_PDB_SYSTEM." "" ""

----------------------------------------
set appinfo "Null"
set appinfo off
prompt
prompt "grbtjsn" Installation is Done.

