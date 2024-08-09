
--
--  grbtctx Installation Script
--
--  Must be run as a SYSTEM User (DBA)
--
-- Command Line Parameters:
--   1 - INSTALL_SYSTEM_CONNECT: SYSTEM/password@TNSALIAS
--       i.e. pass the username and password for the SYSTEM user
--            and the TNSALIAS for the connection to the database.
--       The Data Load installation requires this connection information.
--



-- For Oracle Change Data Capture (CDC) packages

-- Escape character: "^P", CHR(16), DLE

----------------------------------------
--  Prepare for Install

--
--  Prepare for View Install
--

create table TEMP_PUBLICLY_UPDATEABLE_TABLE (c1 number);
grant all on TEMP_PUBLICLY_UPDATEABLE_TABLE to PUBLIC with grant option;
create public synonym TEMP_PUBLICLY_UPDATEABLE_TABLE for TEMP_PUBLICLY_UPDATEABLE_TABLE;

declare
   procedure do_it (in_btype varchar2) is
      cursor c_main is
         select * from ODBCAPTURE_INSTALLATION_LOGS
          where build_type = in_btype;
      b_main   c_main%ROWTYPE;
   begin
      open c_main;
      fetch c_main into b_main;
      if c_main%NOTFOUND
      then
         dbms_output.put_line('WARNING: Prerequisite BUILD_TYPE "' || in_btype ||
                              '" not found in ODBCAPTURE_INSTALLATION_LOGS table.');
      end if;
      close c_main;
   end;
begin
   do_it('grbendp');
   do_it('grbjava');
   do_it('grbras');
   do_it('grbsdo');
   do_it('grbsrc');
   do_it('grbtst');
end;
/


----------------------------------------
-- TABLE Install


--
--  Create ODBCTEST.CUST_CTX_TEST Table
--



--DBMS_METADATA:ODBCTEST.CUST_CTX_TEST

  CREATE TABLE "ODBCTEST"."CUST_CTX_TEST" 
   (	"CUST_ID" NUMBER, 
	"CUST_NAME" VARCHAR2(80 BYTE), 
	"CREATE_DATE" DATE
   ) SEGMENT CREATION IMMEDIATE  LOGGING;

--  Comments

--DBMS_METADATA:ODBCTEST.CUST_CTX_TEST


--  Grants


--  Synonyms



----------------------------------------
-- DATA_LOAD Install


------------------------------------------------------------
NOTE: DATA LOADING for "ODBCTEST/CUST_CTX_TEST.cldr" NOT IMPLEMENTED
------------------------------------------------------------


----------------------------------------
-- INDEX Install


--
--  Create Indexes for ODBCTEST.CUST_CTX_TEST TABLE
--



--  NOTE: This is a "INDEX" Index

--DBMS_METADATA:ODBCTEST.CUST_CTX_TEST_IND

  CREATE INDEX "ODBCTEST"."CUST_CTX_TEST_IND" ON "ODBCTEST"."CUST_CTX_TEST" ("CUST_NAME") 
   INDEXTYPE IS "CTXSYS"."CONTEXT_V2" ;


----------------------------------------
-- Finalize Installation (Includes SPOOL OFF)

--
--  Finalize Installation
--
-- Command Line Parameters:
--   1 - SYSTEM/password@TNSALIAS
--       i.e. pass the username and password for the SYSTEM user
--            and the TNSALIAS for the connection to the database.
--       The Data Load installation requires this connection information.
--


drop public synonym TEMP_PUBLICLY_UPDATEABLE_TABLE;
drop table TEMP_PUBLICLY_UPDATEABLE_TABLE purge;

--@"../grb_linked_install_scripts/fix_invalid_public_synonyms.sql" "" "" ""

--@"../grb_linked_install_scripts/compile_all.sql" "'ODBCTEST'" "" ""

--@"../grb_linked_install_scripts/alter_foreign_keys.sql" "ENABLE" "'ODBCTEST'" ""

--@"../grb_linked_install_scripts/alter_triggers.sql" "ENABLE" "'ODBCTEST'" ""

--@"../grb_linked_install_scripts/update_id_sequences.sql" "'ODBCTEST'" "" ""

--prompt
--prompt alter_queues_ENABLE
--@"../grb_linked_install_scripts/alter_queues.sql" "ENABLE" "'ODBCTEST'" ""

--prompt
--prompt alter_scheduler_jobs_ENABLE
--@"../grb_linked_install_scripts/alter_scheduler_jobs.sql" "ENABLE" "'ODBCTEST'" ""





