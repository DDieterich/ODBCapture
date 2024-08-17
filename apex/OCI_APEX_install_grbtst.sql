
--
--  SYS Installation Script
--
--  Must be run as SYS
--



----------------------------------------
-- ROLE Install


--
--  Create GRB_TEST_ROLE Role
--



create role GRB_TEST_ROLE;


--  Current Grant of YS Objects (but not directories)



----------------------------------------
-- USER Install


--
--  Create ODBCTEST Schema
--


create user "ODBCTEST"
   no authentication
   profile DEFAULT
   temporary tablespace TEMP
   default tablespace USERS
   quota 512M on USERS
   ;

--  Current Grant of SYS Objects (but not directories)


-- Real Application Security System Grants


begin
   execute immediate 'begin' ||
                     '  xs_admin_util.grant_system_privilege(''ADMIN_ANY_SEC_POLICY'', ''ODBCTEST''); ' ||
                     'end;';
exception when others then
   if    SQLERRM not like '%PLS-00201: identifier ''XS_ADMIN_UTIL.GRANT_SYSTEM_PRIVILEGE'' must be declared%'
     AND SQLERRM not like '%ORA-01031: insufficient privileges%'
   then
      raise;
   end if;
end;
/

begin
   execute immediate 'begin' ||
                     '  xs_admin_cloud_util.grant_system_privilege(''ADMIN_ANY_SEC_POLICY'', ''ODBCTEST''); ' ||
                     'end;';
exception when others then
   if SQLERRM not like '%PLS-00201: identifier ''XS_ADMIN_CLOUD_UTIL.GRANT_SYSTEM_PRIVILEGE'' must be declared%'
   then
      raise;
   end if;
end;
/


begin
   execute immediate 'begin' ||
                     '  xs_admin_util.grant_system_privilege(''PROVISION'', ''ODBCTEST''); ' ||
                     'end;';
exception when others then
   if    SQLERRM not like '%PLS-00201: identifier ''XS_ADMIN_UTIL.GRANT_SYSTEM_PRIVILEGE'' must be declared%'
     AND SQLERRM not like '%ORA-01031: insufficient privileges%'
   then
      raise;
   end if;
end;
/

begin
   execute immediate 'begin' ||
                     '  xs_admin_cloud_util.grant_system_privilege(''PROVISION'', ''ODBCTEST''); ' ||
                     'end;';
exception when others then
   if SQLERRM not like '%PLS-00201: identifier ''XS_ADMIN_CLOUD_UTIL.GRANT_SYSTEM_PRIVILEGE'' must be declared%'
   then
      raise;
   end if;
end;
/



----------------------------------------
-- HOST_ACL Install


--
--  Create Host ACL/ACE
--
-- Host ACLs with the following:
--    PRINCIPAL_TYPE      = 'DATABASE' (xs_acl.ptype_db)
--    GRANT_TYPE          = 'GRANT'
--    INVERTED_PRINICIPAL = 'NO'
--    PRIVILEGE          is not null
-- Start Dates and End Dates are ignored (set to NULL).
--



--
--  Create Host ACL/ACE for host1 from port 1100 to 1101 
--  NOTE: This is a "GRANTEE" Host ACL
--

begin
   DBMS_NETWORK_ACL_ADMIN.APPEND_HOST_ACE
      (host        => 'host1'
      ,lower_port  => 1100
      ,upper_port  => 1101
      ,ace         => xs$ace_type
                         (privilege_list   => xs$name_list('CONNECT')
                         ,granted          => TRUE
                         ,inverted         => FALSE
                         ,principal_name   => 'ODBCTEST'
                         ,principal_type   => xs_acl.ptype_db
                         ,start_date       => NULL
                         ,end_date         => NULL));
end;
/


--
--  Create Host ACL/ACE
--
-- Host ACLs with the following:
--    PRINCIPAL_TYPE      = 'DATABASE' (xs_acl.ptype_db)
--    GRANT_TYPE          = 'GRANT'
--    INVERTED_PRINICIPAL = 'NO'
--    PRIVILEGE          is not null
-- Start Dates and End Dates are ignored (set to NULL).
--



--
--  Create Host ACL/ACE for host2 from port NULL to NULL 
--  NOTE: This is a "GRANTEE" Host ACL
--

begin
   DBMS_NETWORK_ACL_ADMIN.APPEND_HOST_ACE
      (host        => 'host2'
      ,lower_port  => NULL
      ,upper_port  => NULL
      ,ace         => xs$ace_type
                         (privilege_list   => xs$name_list('CONNECT')
                         ,granted          => TRUE
                         ,inverted         => FALSE
                         ,principal_name   => 'ODBCTEST'
                         ,principal_type   => xs_acl.ptype_db
                         ,start_date       => NULL
                         ,end_date         => NULL));
end;
/


--
--  Create Host ACL/ACE for host2 from port NULL to NULL 
--  NOTE: This is a "GRANTEE" Host ACL
--

begin
   DBMS_NETWORK_ACL_ADMIN.APPEND_HOST_ACE
      (host        => 'host2'
      ,ace         => xs$ace_type
                         (privilege_list   => xs$name_list('RESOLVE')
                         ,granted          => TRUE
                         ,inverted         => FALSE
                         ,principal_name   => 'ODBCTEST'
                         ,principal_type   => xs_acl.ptype_db
                         ,start_date       => NULL
                         ,end_date         => NULL));
end;
/


--
--  Create Host ACL/ACE
--
-- Host ACLs with the following:
--    PRINCIPAL_TYPE      = 'DATABASE' (xs_acl.ptype_db)
--    GRANT_TYPE          = 'GRANT'
--    INVERTED_PRINICIPAL = 'NO'
--    PRIVILEGE          is not null
-- Start Dates and End Dates are ignored (set to NULL).
--



--
--  Create Host ACL/ACE for odbctest_host from port 1234 to 5678 
--  NOTE: This is a "OBJECT_NAME_REGEXP" Host ACL
--   (OBJECT_NAME_REGEXP: ^odbctest)
--

begin
   DBMS_NETWORK_ACL_ADMIN.APPEND_HOST_ACE
      (host        => 'odbctest_host'
      ,lower_port  => 1234
      ,upper_port  => 5678
      ,ace         => xs$ace_type
                         (privilege_list   => xs$name_list('CONNECT')
                         ,granted          => TRUE
                         ,inverted         => FALSE
                         ,principal_name   => 'PUBLIC'
                         ,principal_type   => xs_acl.ptype_db
                         ,start_date       => NULL
                         ,end_date         => NULL));
end;
/


----------------------------------------
-- WALLET_ACL Install


--
--  Create Wallet ACL/ACE
--
-- Wallet ACLs with the following:
--    PRINCIPAL_TYPE      = 'DATABASE' (xs_acl.ptype_db)
--    GRANT_TYPE          = 'GRANT'
--    INVERTED_PRINICIPAL = 'NO'
--    PRIVILEGE          is not null
-- Start Dates and End Dates are ignored (set to NULL).
--



--
--  NOTE: This is a "GRANTEE" Wallet ACL
--

begin
   DBMS_NETWORK_ACL_ADMIN.APPEND_WALLET_ACE
      (wallet_path => 'file:/opt/install_files/oracle_wallet'
      ,ace         => xs$ace_type
                         (privilege_list   => xs$name_list('USE_PASSWORDS')
                         ,granted          => TRUE
                         ,inverted         => FALSE
                         ,principal_name   => 'ODBCTEST'
                         ,principal_type   => xs_acl.ptype_db
                         ,start_date       => NULL
                         ,end_date         => NULL));
end;
/


--
--  Create Wallet ACL/ACE
--
-- Wallet ACLs with the following:
--    PRINCIPAL_TYPE      = 'DATABASE' (xs_acl.ptype_db)
--    GRANT_TYPE          = 'GRANT'
--    INVERTED_PRINICIPAL = 'NO'
--    PRIVILEGE          is not null
-- Start Dates and End Dates are ignored (set to NULL).
--



--
--  NOTE: This is a "GRANTEE" Wallet ACL
--

begin
   DBMS_NETWORK_ACL_ADMIN.APPEND_WALLET_ACE
      (wallet_path => 'file:/var\opt\install_files/oracle_wallet'
      ,ace         => xs$ace_type
                         (privilege_list   => xs$name_list('USE_PASSWORDS')
                         ,granted          => TRUE
                         ,inverted         => FALSE
                         ,principal_name   => 'ODBCTEST'
                         ,principal_type   => xs_acl.ptype_db
                         ,start_date       => NULL
                         ,end_date         => NULL));
end;
/


----------------------------------------



--
--  SYSTEM Installation Script
--
--  Must be run as SYSTEM
--



----------------------------------------
-- GRANT Install



--
--  Create ODBCTEST Grants
--




--  Database System Privileges

grant CREATE PROCEDURE to "ODBCTEST";
grant CREATE SEQUENCE to "ODBCTEST";
grant CREATE SESSION to "ODBCTEST";
grant CREATE TABLE to "ODBCTEST";


--  "sys" BUILD_TYPE Role Grants
--  "GRANTEE" (delayed) Role Grants
--  Note: "OBJECT" Schema Object Grants are given during Role creation

grant "GRB_TEST_ROLE" to "ODBCTEST" with admin option;




----------------------------------------



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
end;
/


----------------------------------------
-- TABLE Install


--
--  Create ODBCAPTURE.GRBTST_$NAME Table
--



--DBMS_METADATA:ODBCAPTURE.GRBTST_$NAME

  CREATE TABLE "ODBCAPTURE"."GRBTST_$NAME" 
   (	"C1" VARCHAR2(20 BYTE), 
	"ID" NUMBER
   ) SEGMENT CREATION IMMEDIATE  LOGGING;

--  Comments

--DBMS_METADATA:ODBCAPTURE.GRBTST_$NAME


--  Grants
grant DELETE on "ODBCAPTURE"."GRBTST_$NAME" to "GRB_TEST_ROLE";
grant INSERT on "ODBCAPTURE"."GRBTST_$NAME" to "GRB_TEST_ROLE";
grant SELECT on "ODBCAPTURE"."GRBTST_$NAME" to "GRB_TEST_ROLE";
grant UPDATE on "ODBCAPTURE"."GRBTST_$NAME" to "GRB_TEST_ROLE";


--  Synonyms



--
--  Create ODBCAPTURE.GRBTST_IMAGE Table
--



--DBMS_METADATA:ODBCAPTURE.GRBTST_IMAGE

  CREATE TABLE "ODBCAPTURE"."GRBTST_IMAGE" 
   (	"ID" NUMBER(5,0), 
	"IMAGE" BLOB
   ) SEGMENT CREATION IMMEDIATE  LOGGING;

--  Comments

--DBMS_METADATA:ODBCAPTURE.GRBTST_IMAGE


--  Grants


--  Synonyms



----------------------------------------
-- DATA_LOAD Install


------------------------------------------------------------
NOTE: DATA LOADING for "ODBCAPTURE/BUILD_CONF.cldr" NOT IMPLEMENTED
------------------------------------------------------------


------------------------------------------------------------
NOTE: DATA LOADING for "ODBCAPTURE/BUILD_PATH.cldr" NOT IMPLEMENTED
------------------------------------------------------------


------------------------------------------------------------
NOTE: DATA LOADING for "ODBCAPTURE/GRBTST__NAME.cldr" NOT IMPLEMENTED
------------------------------------------------------------


------------------------------------------------------------
NOTE: DATA LOADING for "ODBCAPTURE/GRBTST_IMAGE.cldr" NOT IMPLEMENTED
------------------------------------------------------------


------------------------------------------------------------
NOTE: DATA LOADING for "ODBCAPTURE/ROLE_CONF.cldr" NOT IMPLEMENTED
------------------------------------------------------------


------------------------------------------------------------
NOTE: DATA LOADING for "ODBCAPTURE/SCHEMA_CONF.cldr" NOT IMPLEMENTED
------------------------------------------------------------


------------------------------------------------------------
NOTE: DATA LOADING for "ODBCAPTURE/TSPACE_CONF.cldr" NOT IMPLEMENTED
------------------------------------------------------------


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

--@"../grb_linked_install_scripts/compile_all.sql" "'ODBCAPTURE','ODBCTEST'" "" ""

--@"../grb_linked_install_scripts/alter_foreign_keys.sql" "ENABLE" "'ODBCAPTURE','ODBCTEST'" ""

--@"../grb_linked_install_scripts/alter_triggers.sql" "ENABLE" "'ODBCAPTURE','ODBCTEST'" ""

--@"../grb_linked_install_scripts/update_id_sequences.sql" "'ODBCAPTURE','ODBCTEST'" "" ""

--prompt
--prompt alter_queues_ENABLE
--@"../grb_linked_install_scripts/alter_queues.sql" "ENABLE" "'ODBCAPTURE','ODBCTEST'" ""

--prompt
--prompt alter_scheduler_jobs_ENABLE
--@"../grb_linked_install_scripts/alter_scheduler_jobs.sql" "ENABLE" "'ODBCAPTURE','ODBCTEST'" ""





