
--
--  SYS Installation Script
--
--  Must be run as SYS
--

spool install_sys.log

set blockterminator off
set sqlblanklines on

----------------------------------------
-- ROLE Install

@dbi.sql "SYS/GRB_TEST_ROLE.role" "" ""

----------------------------------------
-- USER Install

@dbi.sql "SYS/ODBCTEST.user" "" ""

----------------------------------------
-- HOST_ACL Install

@dbi.sql "SYS/host1.hacl" "" ""
@dbi.sql "SYS/host2.hacl" "" ""
@dbi.sql "SYS/odbctest_host.hacl" "" ""

----------------------------------------
-- WALLET_ACL Install

@dbi.sql "SYS/_opt_install_files_oracle_wallet.wacl" "" ""
@dbi.sql "SYS/_var_opt_install_files_oracle_wallet.wacl" "" ""

----------------------------------------
set sqlblanklines off
set blockterminator on

spool off

