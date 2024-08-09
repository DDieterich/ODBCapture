
--
--  Finalize Installation
--
-- Command Line Parameters:
--   1 - SYSTEM/password@TNSALIAS
--       i.e. pass the username and password for the SYSTEM user
--            and the TNSALIAS for the connection to the database.
--       The Data Load installation requires this connection information.
--

define FINAL_SYSTEM_CONNECT="&1."

prompt
prompt Drop Temp Publicly Updateable Table
drop public synonym TEMP_PUBLICLY_UPDATEABLE_TABLE;
drop table TEMP_PUBLICLY_UPDATEABLE_TABLE purge;

prompt
prompt fix_invalid_public_synonyms
@"../grb_linked_install_scripts/fix_invalid_public_synonyms.sql" "" "" ""

prompt
prompt compile_all
@"../grb_linked_install_scripts/compile_all.sql" "'ODBCTEST'" "" ""

prompt
prompt alter_foreign_keys_ENABLE
@"../grb_linked_install_scripts/alter_foreign_keys.sql" "ENABLE" "'ODBCTEST'" ""

prompt
prompt alter_triggers_ENABLE
@"../grb_linked_install_scripts/alter_triggers.sql" "ENABLE" "'ODBCTEST'" ""

prompt
prompt update_id_sequences
@"../grb_linked_install_scripts/update_id_sequences.sql" "'ODBCTEST'" "" ""

--prompt
--prompt alter_queues_ENABLE
--@"../grb_linked_install_scripts/alter_queues.sql" "ENABLE" "'ODBCTEST'" ""

--prompt
--prompt alter_scheduler_jobs_ENABLE
--@"../grb_linked_install_scripts/alter_scheduler_jobs.sql" "ENABLE" "'ODBCTEST'" ""

prompt
prompt Switch Spooling Off
spool off


