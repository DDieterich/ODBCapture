
--
--  Initialize Database for Build
--
-- Command Line Parameters:
--   1 - PDB_NAME: Name of the Pluggable Database
--   2 - DB_LOGIN: Connect String for SYS in the Container Database
--

WHENEVER SQLERROR EXIT SQL.SQLCODE
WHENEVER OSERROR EXIT

define PDB_NAME="&1."
define DB_LOGIN="&2."

set linesize 2499
set trimspool on
set termout on
set verify off
set echo off
set timing on

@"../util/new_session.sql" "&DB_LOGIN." "" ""
@"../util/create_pdb.sql" "&PDB_NAME." "" ""

exit
