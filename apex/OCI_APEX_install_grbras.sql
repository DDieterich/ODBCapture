
--
--  SYS Installation Script
--
--  Must be run as SYS
--



----------------------------------------
-- SYS_GRANT Install



--
--  Future Grant SYS Objects (but not directories)
--




--  "SYS" Object Grants

grant SELECT on "SYS"."DBA_XS_ACES" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_XS_ACLS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_XS_ACL_PARAMETERS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_XS_APPLIED_POLICIES" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_XS_PRINCIPALS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_XS_ROLE_GRANTS" to "ODBCAPTURE";




----------------------------------------



--
--  SYSTEM Installation Script
--
--  Must be run as SYSTEM
--



----------------------------------------



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
   do_it('grbsrc');
end;
/


----------------------------------------
-- PACKAGE Install


--
--  Create ODBCAPTURE.GRAB_RAS Package
--



--DBMS_METADATA:ODBCAPTURE.GRAB_RAS

  CREATE OR REPLACE EDITIONABLE PACKAGE "ODBCAPTURE"."GRAB_RAS" 
   authid current_user
as

   procedure grb_usr
      (fh          in out NOCOPY  fh2.sf_ptr_type
      ,in_grantee  in             varchar2);

   procedure disable_policy
      (in_schema  in  varchar2
      ,in_object  in  varchar2);

   procedure enable_policy
      (in_schema  in  varchar2
      ,in_object  in  varchar2);

   procedure grb_racl;

end grab_ras;
/


--  Grants


--  Synonyms



----------------------------------------
-- TABLE Install


--
--  Create ODBCAPTURE.EXPORTING_RAS_DATA Table
--



--DBMS_METADATA:ODBCAPTURE.EXPORTING_RAS_DATA

  CREATE TABLE "ODBCAPTURE"."EXPORTING_RAS_DATA" 
   (	"SCHEMA" VARCHAR2(128 BYTE) NOT NULL ENABLE, 
	"OBJECT" VARCHAR2(128 BYTE) NOT NULL ENABLE, 
	"POLICY_OWNER" VARCHAR2(128 BYTE) NOT NULL ENABLE, 
	"POLICY" VARCHAR2(128 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "EXPORTING_RAS_DATA_PK" PRIMARY KEY ("SCHEMA", "OBJECT", "POLICY_OWNER", "POLICY") ENABLE
   ) ORGANIZATION INDEX NOCOMPRESS ;

--  Comments

--DBMS_METADATA:ODBCAPTURE.EXPORTING_RAS_DATA

   COMMENT ON COLUMN "ODBCAPTURE"."EXPORTING_RAS_DATA"."SCHEMA" IS 'Owner of object containing data being exported';
   COMMENT ON COLUMN "ODBCAPTURE"."EXPORTING_RAS_DATA"."OBJECT" IS 'Object containing data being exported';
   COMMENT ON COLUMN "ODBCAPTURE"."EXPORTING_RAS_DATA"."POLICY_OWNER" IS 'Owner of temporarily disabled RAS Policy';
   COMMENT ON COLUMN "ODBCAPTURE"."EXPORTING_RAS_DATA"."POLICY" IS 'Temporarily disabled RAS Policy';
   COMMENT ON TABLE "ODBCAPTURE"."EXPORTING_RAS_DATA"  IS 'RAS Policies temporarily disabled during data exports';


--  Grants


--  Synonyms



----------------------------------------
-- DATA_LOAD Install


------------------------------------------------------------
NOTE: DATA LOADING for "ODBCAPTURE/ROLE_CONF.cldr" NOT IMPLEMENTED
------------------------------------------------------------


------------------------------------------------------------
NOTE: DATA LOADING for "ODBCAPTURE/SCHEMA_CONF.cldr" NOT IMPLEMENTED
------------------------------------------------------------


----------------------------------------
-- VIEW Install


--
--  Create ODBCAPTURE.PRIV_OBJ_RACL_VIEW view
--



--
--  Cannot grant permisions on a view with an error
--  https://asktom.oracle.com/pls/apex/f?p=100:11:0::::P11_QUESTION_ID:43253832697675#2653213300346351987
create view "ODBCAPTURE"."PRIV_OBJ_RACL_VIEW"
  as   select * from TEMP_PUBLICLY_UPDATEABLE_TABLE;

--  Grants



--DBMS_METADATA:ODBCAPTURE.PRIV_OBJ_RACL_VIEW

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ODBCAPTURE"."PRIV_OBJ_RACL_VIEW" ("BUILD_TYPE", "BUILD_TIMING", "BUILD_TYPE_SELECTOR", "OBJECT_NAME_REGEXP", "RACL_BUILD_TYPE", "OWNER_BUILD_TYPE", "OWNER", "OWNER_UOR_TYPE", "ELEMENT_NAME", "FILE_EXT1", "FILE_EXT2", "FILE_EXT3") AS 
  select case t.build_timing
          when 'FUTURE' then ol.build_type
                        else uor.build_type
       end                              BUILD_TYPE
      ,case t.build_timing
          when 'FUTURE' then 'FUTURE'
                        else 'CURRENT'
       end                              BUILD_TIMING
      ,case t.build_timing
          when 'FUTURE' then 'OBJECT_NAME_REGEXP'
                        else 'GRANTEE'
       end                              BUILD_TYPE_SELECTOR
      ,ol.object_name_regexp
      ,ol.build_type                    RACL_BUILD_TYPE
      ,uor.build_type                   OWNER_BUILD_TYPE
      ,uor.user_or_role                 OWNER
      ,uor.uor_type                     OWNER_UOR_TYPE
      ,ec.element_name
      ,ec.file_ext1
      ,ec.file_ext2
      ,ec.file_ext3
 from  uor_install_view  uor
       join element_conf  ec
            on  ec.element_name = 'RAS_ACL'
  left join object_conf  ol
            on  ol.username     = uor.user_or_role
            and ol.build_type  != uor.build_type
            and ol.element_name = ec.element_name
          --  and ol.object_name_regexp is not null  Don't Care About the Filter Contents
  left join build_type_timing  t
            -- Ensure the Grantee is available when the RACL is installed
            on  t.from_build_type = ol.build_type
            and t.to_build_type   = uor.build_type
 where uor.user_or_role in (select distinct a.owner from dba_xs_acls a)
  and  uor.oracle_provided = 'N'    -- Exclude Oracle Provided Grantees
 group by case t.build_timing
          when 'FUTURE' then ol.build_type
                        else uor.build_type
       end
      ,case t.build_timing
          when 'FUTURE' then 'FUTURE'
                        else 'CURRENT'
       end
      ,case t.build_timing
          when 'FUTURE' then 'OBJECT_NAME_REGEXP'
                        else 'GRANTEE'
       end
      ,ol.object_name_regexp
      ,ol.build_type
      ,uor.build_type
      ,uor.user_or_role
      ,uor.uor_type
      ,ec.element_name
      ,ec.file_ext1
      ,ec.file_ext2
      ,ec.file_ext3;

--  Comments

--DBMS_METADATA:ODBCAPTURE.PRIV_OBJ_RACL_VIEW


--  Grants


--  Synonyms



----------------------------------------
-- PACKAGE BODY Install


--
--  Create ODBCAPTURE.GRAB_RAS Package Body
--



--DBMS_METADATA:ODBCAPTURE.GRAB_RAS

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "ODBCAPTURE"."GRAB_RAS" 
as


------------------------------------------------------------
-- Grant Real Application Security (RAS) Administrative Permissions
--
--  Note1: This created source code may or may not be running in the Oracle Cloud
--  Note2: RAS may or may not be installed in the database running this source code.
--
procedure grb_usr
      (fh          in out NOCOPY  fh2.sf_ptr_type
      ,in_grantee  in             varchar2)
as
   first_pass  boolean := TRUE;
begin
   for buff in (select privilege
                 from  dba_xs_aces
                 where acl       = 'SYSTEMACL'
                  and  principal = in_grantee
                 order by privilege)
   loop
      if first_pass
      then
         first_pass := FALSE;
         fh2.script_put_line(fh, q'{}');
         fh2.script_put_line(fh, q'{-- Real Application Security System Grants}');
         fh2.script_put_line(fh, q'{}');
      end if;
      fh2.script_put_line(fh, q'{}');
      fh2.script_put_line(fh, q'{prompt XS Admin Grant "}' || buff.privilege || q'{" to "}' || in_grantee || q'{"}');
      fh2.script_put_line(fh, q'{begin}');
      fh2.script_put_line(fh, q'{   execute immediate 'begin' ||}');
      fh2.script_put_line(fh, q'{                     '  xs_admin_util.grant_system_privilege(''}' ||
                                                            buff.privilege || q'{'', ''}' || in_grantee || q'{''); ' ||}');
      fh2.script_put_line(fh, q'{                     'end;';}');
      fh2.script_put_line(fh, q'{exception when others then}');
      fh2.script_put_line(fh, q'{   if    SQLERRM not like '%PLS-00201: identifier ''XS_ADMIN_UTIL.GRANT_SYSTEM_PRIVILEGE'' must be declared%'}');
      fh2.script_put_line(fh, q'{     AND SQLERRM not like '%ORA-01031: insufficient privileges%'}');
      fh2.script_put_line(fh, q'{   then}');
      fh2.script_put_line(fh, q'{      raise;}');
      fh2.script_put_line(fh, q'{   end if;}');
      fh2.script_put_line(fh, q'{end;}');
      fh2.script_put_line(fh, q'{/}');
      fh2.script_put_line(fh, q'{}');
      fh2.script_put_line(fh, q'{prompt XS Admin Cloud Grant "}' || buff.privilege || q'{" to "}' || in_grantee || q'{"}');
      fh2.script_put_line(fh, q'{begin}');
      fh2.script_put_line(fh, q'{   execute immediate 'begin' ||}');
      fh2.script_put_line(fh, q'{                     '  xs_admin_cloud_util.grant_system_privilege(''}' ||
                                                            buff.privilege || q'{'', ''}' || in_grantee || q'{''); ' ||}');
      fh2.script_put_line(fh, q'{                     'end;';}');
      fh2.script_put_line(fh, q'{exception when others then}');
      fh2.script_put_line(fh, q'{   if SQLERRM not like '%PLS-00201: identifier ''XS_ADMIN_CLOUD_UTIL.GRANT_SYSTEM_PRIVILEGE'' must be declared%'}');
      fh2.script_put_line(fh, q'{   then}');
      fh2.script_put_line(fh, q'{      raise;}');
      fh2.script_put_line(fh, q'{   end if;}');
      fh2.script_put_line(fh, q'{end;}');
      fh2.script_put_line(fh, q'{/}');
      fh2.script_put_line(fh, q'{}');
   end loop;
end grb_usr;


------------------------------------------------------------
-- Disable Real Application Security (RAS) Enforcement
procedure disable_policy
      (in_schema  in  varchar2
      ,in_object  in  varchar2)
is
begin
   for buff in (select t.policy_owner, t.policy
                 from  dba_xs_applied_policies t
                 where t.schema = in_schema
                  and  t.object = in_object
                  and  t.status = 'ENABLED'
                 order by t.policy_owner, t.policy)
   loop
      begin
         insert into exporting_ras_data
               (   schema,    object,      policy_owner,      policy)
            values
               (in_schema, in_object, buff.policy_owner, buff.policy);
         commit;
      exception when DUP_VAL_ON_INDEX then
         null;  -- Ignore this exception
      end;
      xs_data_security.disable_object_policy
         (schema => in_schema
         ,object => in_object
         ,policy => '"' || buff.policy_owner || '"."' ||
                           buff.policy       || '"'   );
   end loop;
end disable_policy;


------------------------------------------------------------
-- Enable Real Application Security (RAS) Enforcement
procedure enable_policy
      (in_schema  in  varchar2
      ,in_object  in  varchar2)
is
begin
   for buff in (select t.policy_owner, t.policy
                 from  exporting_ras_data t
                 where t.schema = in_schema
                  and  t.object = in_object
                 order by t.policy_owner, t.policy)
   loop
      xs_data_security.enable_object_policy
         (schema => in_schema
         ,object => in_object
         ,policy => '"' || buff.policy_owner || '"."' ||
                           buff.policy       || '"'   );
      delete from exporting_ras_data t
       where t.schema       = in_schema
        and  t.object       = in_object
        and  t.policy_owner = buff.policy_owner
        and  t.policy       = buff.policy;
      commit;
   end loop;
end enable_policy;


------------------------------------------------------------
-- Create Real Application Security (RAS) Access Control Lists
procedure grb_racl
as
   ELMNT           CONSTANT varchar2(100) := 'RAS_ACL';
   fh              fh2.sf_ptr_type;  -- object script file handle
   l_DDL_handle    NUMBER;
   l_XForm_handle  NUMBER;
   old_file        varchar2(1000) := 'This is not a real file name !@#$%^';
   ----------------------------------------
   procedure l_close_file as
      l_file_name  varchar2(1000) :=
                   fh2.sf_aa(fh.bld_type)(fh.bld_ord)(fh.file_id).filename;
   begin
      --
      fh2.script_put_line(fh, 'set define on');
      fh2.script_close(fh);
      --
      fh := fh2.script_open(in_filename     => 'odbcapture_installation_logs.csv'
                           ,in_elmnt        => 'INSTALL_SCRIPT'
                           ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
      fh2.script_put_line(fh, '"' || grab_scripts.g_build_type ||
                            '","' || l_file_name || '.log"' );
      fh2.script_close(fh);
      --
   end l_close_file;
   ----------------------------------------
begin
   --ELMNT: RAS_ACL, g_build_type: grbtst, g_schema_name: SYS, RAS_ACL
   --dbms_output.put_line('ELMNT: ' || ELMNT || ', g_build_type: ' || grab_scripts.g_build_type ||
   --                     ', g_schema_name: ' || grab_scripts.g_schema_name || ', ' || ELMNT);
   for buf1 in (select 'RAS_Admin_' ||owner || '.' || file_ext1    FILE_NAME
                      ,owner
                      ,build_type_selector
                 from  priv_obj_racl_view
                 where build_type = grab_scripts.g_build_type
                 -- and  owner        = grab_scripts.g_schema_name  (All Schema)
                 order by owner
                      ,build_type_selector)
   loop
      if old_file != buf1.file_name
      then
         old_file := buf1.file_name;
         if fh2.script_is_open(fh)
         then
            l_close_file;
         end if;
         fh := fh2.script_open(in_filename     => buf1.file_name
                              ,in_elmnt        => ELMNT
                              ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
         fh2.script_put_line(fh, '');
         fh2.script_put_line(fh, '--');
         fh2.script_put_line(fh, '-- Create RAS ACLs for RAS Administrator ' || buf1.owner);
         fh2.script_put_line(fh, '--  NOTE: This is a "' || buf1.build_type_selector || '" RAS ACL');
         fh2.script_put_line(fh, '--');
         fh2.script_put_line(fh, '-- To disable RAS ACLs for data loading/unloading, use:');
         for buf2 in (select t.schema, t.policy, t.object
                       from  dba_xs_applied_policies t
                       where t.policy_owner = buf1.owner
                       order by t.policy_owner, t.policy, t.object)
         loop
            fh2.script_put_line(fh, '--begin');
            fh2.script_put_line(fh, '--   xs_data_security.disable_object_policy'          );
            fh2.script_put_line(fh, '--      (policy  => ''"' || buf1.owner  ||
                                                        '"."' || buf2.policy || '"''');
            fh2.script_put_line(fh, '--      ,schema  => '''  || buf2.schema ||  '''');
            fh2.script_put_line(fh, '--      ,object  => '''  || buf2.object ||  '''');
            fh2.script_put_line(fh, '--      );' );
            fh2.script_put_line(fh, '--end;');
            fh2.script_put_line(fh, '--/');
         end loop;
         fh2.script_put_line(fh, '--');
         fh2.script_put_line(fh, '');
         fh2.script_put_line(fh, 'set define off');
         fh2.script_put_line(fh, '');
         fh2.script_put_line(fh, '');
      end if;
      fh2.script_put_line(fh, '-- RAS Defined Roles');
      fh2.script_put_line(fh, '');
      for buf2 in (select t.name from dba_xs_principals t
                    where t.type = 'ROLE'
                     and  t.name not like 'XS%'
                    order by t.name)
      loop
         fh2.script_put_line(fh, 'prompt ' || buf2.name || '.XS_ROLE');
         fh2.script_put_line(fh, '--DBMS_METADATA:' || buf2.name || '.XS_ROLE');
         fh2.put_big_line(fh, buf1.owner || '.' || buf2.name || ' XS_ROLE'
                             ,DBMS_METADATA.get_ddl(object_type => 'XS_ROLE'
                                                   ,name        => buf2.name)
                             ,common_util.MAXIMUM_SQL_LENGTH);
         fh2.script_put_line(fh, '');
      end loop;
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '-- RAS Defined Users');
      fh2.script_put_line(fh, '');
      for buf2 in (select t.name from dba_xs_principals t
                    where t.type = 'USER'
                     and  t.name not like 'XS%'
                    order by t.name)
      loop
         fh2.script_put_line(fh, 'prompt ' || buf2.name || '.XS_USER');
         fh2.script_put_line(fh, '--DBMS_METADATA:' || buf2.name || '.XS_USER');
         -- Need to catch this failure:
         -- ORA-31603: object "GRB_TEST_USER_01" of type XS_USER not found in schema "ODBCAPTURE"
         begin
            fh2.put_big_line(fh, buf1.owner || '.' || buf2.name || ' XS_USER'
                                ,DBMS_METADATA.get_ddl(object_type => 'XS_USER'
                                                      ,name        => buf2.name)
                                ,common_util.MAXIMUM_SQL_LENGTH);
         exception when others then
            if SQLCODE = -31603
            then
               dbms_output.put_line(SQLERRM || CHR(10) ||
                                    dbms_utility.format_error_backtrace ||
                                    dbms_utility.format_call_stack);
            else
               raise;
            end if;
         end;
         fh2.script_put_line(fh, '');
      end loop;
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '-- Database Role Grants to RAS Principals');
      fh2.script_put_line(fh, '-- DBMS_METADATA: "XS_ROLE_GRANT" doesn''t do this');
      fh2.script_put_line(fh, '');
      for buf2 in (select t.granted_role, t.grantee from dba_xs_role_grants t
                    where t.granted_role_type = 'DATABASE'
                     and  t.granted_role not like 'XS%'
                    order by t.granted_role, t.grantee)
      loop
         fh2.script_put_line(fh, 'prompt grant "' || buf2.granted_role ||
                                         '" to "' || buf2.grantee || '";');
         fh2.script_put_line(fh, 'grant "' || buf2.granted_role ||
                                           '" to "' || buf2.grantee || '";');
         fh2.script_put_line(fh, '');
      end loop;
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '-- RAS Role Grants to RAS Principals');
      fh2.script_put_line(fh, '-- Note: DBMS_METADATA XS_ROLE_GRANT won''t work with multiple users per role');
      fh2.script_put_line(fh, '');
      for buf2 in (select t.grantee, t.granted_role from dba_xs_role_grants t
                    where t.grantee in (select distinct t2.principal from dba_xs_aces t2
                                         where t2.owner = buf1.owner)
                    order by t.grantee, t.granted_role)
      loop
         --fh2.script_put_line(fh, '-- DBMS_METADATA: ' || buf2.granted_role || '.XS_ROLE_GRANT');
         --fh2.put_big_line(fh, buf1.owner || '.' || buf2.granted_role || ' XS_ROLE_GRANT'
         --                         ,dbms_metadata.get_ddl(object_type => 'XS_ROLE_GRANT'
         --                                               ,name        => buf2.granted_role)
         --                         ,common_util.MAXIMUM_SQL_LENGTH);
         fh2.script_put_line(fh, 'prompt principal grant "' || buf2.granted_role ||
                                                   '" to "' || buf2.grantee || '";');
         fh2.script_put_line(fh, 'BEGIN');
         fh2.script_put_line(fh, '  xs_principal.grant_roles(grantee => ''"' || buf2.grantee || '"'', ');
         fh2.script_put_line(fh, '     role => ''"' || buf2.granted_role || '"'');');
         fh2.script_put_line(fh, 'END;');
         fh2.script_put_line(fh, '/');
         fh2.script_put_line(fh, '');
      end loop;
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--------------------------------------');
      fh2.script_put_line(fh, '-- RAS ACLs Owned by RAS Administrator');
      fh2.script_put_line(fh, '--------------------------------------');
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '');
      for buf2 in (select t.name from dba_xs_acls t
                    where t.owner = buf1.owner
                    order by t.name)
      loop
         fh2.script_put_line(fh, 'prompt ' || buf2.name || '.XS_ACL');
         fh2.script_put_line(fh, '--DBMS_METADATA:' || buf2.name || '.XS_ACL');
         fh2.put_big_line(fh, buf1.owner || '.' || buf2.name || ' XS_ACL'
                             ,DBMS_METADATA.get_ddl(object_type => 'XS_ACL'
                                                   ,name        => buf2.name
                                                   ,schema      => buf1.owner)
                             ,common_util.MAXIMUM_SQL_LENGTH);
         for buf3 in (select distinct t.acl from dba_xs_acl_parameters t
                       where t.acl       = buf2.name
                        and  t.acl_owner = buf1.owner
                       order by t.acl)
         loop
            fh2.script_put_line(fh, 'prompt ' || buf3.acl || '.XS_ACL_PARAM');
            fh2.script_put_line(fh, '--DBMS_METADATA:' || buf3.acl || '.XS_ACL_PARAM');
            fh2.put_big_line(fh, buf1.owner || '.' || buf3.acl || ' XS_ACL_PARAM'
                                ,DBMS_METADATA.get_ddl(object_type => 'XS_ACL_PARAM'
                                                      ,name        => buf3.ACL
                                                      ,schema      => buf1.owner)
                                ,common_util.MAXIMUM_SQL_LENGTH);
         end loop;
         fh2.script_put_line(fh, '');
      end loop;
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '----------------------------------------------------');
      fh2.script_put_line(fh, '-- Policies for RAS Admininistrator (includes REALM)');
      fh2.script_put_line(fh, '----------------------------------------------------');
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '');
      for buf2 in (select t.policy from dba_xs_applied_policies t
                    where t.POLICY_OWNER = buf1.owner
                    order by t.policy)
      loop
         fh2.script_put_line(fh, 'prompt ' || buf2.policy || '.XS_DATA_SECURITY');
         fh2.script_put_line(fh, '--DBMS_METADATA:' || buf2.policy || '.XS_DATA_SECURITY');
         fh2.script_put_line(fh, '--  For UNKNOWN reasons: Need to change from this:');
         fh2.script_put_line(fh, '--    dbms_xds.enable_xds(');
         fh2.script_put_line(fh, '--       object_schema => ''ODBCAPTURE'',');
         fh2.script_put_line(fh, '--       object_name => ''GRBTST_$NAME'',');
         fh2.script_put_line(fh, '--       policy_name => ''"ODBCTEST"."GRB_TEST_POLICY_01"'');');
         fh2.script_put_line(fh, '--  To this for use with Autonomous Database Service in Oracle Cloud:');
         fh2.script_put_line(fh, '--    xs_data_security.apply_object_policy(');
         fh2.script_put_line(fh, '--       schema => ''ODBCAPTURE'',');
         fh2.script_put_line(fh, '--       object => ''GRBTST_$NAME'',');
         fh2.script_put_line(fh, '--       policy => ''"ODBCTEST"."GRB_TEST_POLICY_01"'');');
         fh2.put_big_line(fh, buf1.owner || '.' || buf2.policy || ' XS_DATA_SECURITY'
                                  ,replace
                                      (replace
                                         (replace
                                            (replace
                                               (DBMS_METADATA.get_ddl(object_type => 'XS_DATA_SECURITY'
                                                                     ,name        => buf2.policy
                                                                     ,schema      => buf1.owner )
                                               ,' dbms_xds.enable_xds('
                                               ,' xs_data_security.apply_object_policy(' )
                                            ,' object_schema => '
                                            ,' schema => ' )
                                         ,' object_name => '
                                         ,' object => ' )
                                      ,' policy_name => '
                                      ,' policy => ' )
                                  ,common_util.MAXIMUM_SQL_LENGTH);
         fh2.script_put_line(fh, '');
      end loop;
      fh2.script_put_line(fh, '');
   end loop;
   if fh2.script_is_open(fh)
   then
      l_close_file;
   end if;
end grb_racl;


end grab_ras;
/


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

--@"../grb_linked_install_scripts/compile_all.sql" "'ODBCAPTURE'" "" ""

--@"../grb_linked_install_scripts/alter_foreign_keys.sql" "ENABLE" "'ODBCAPTURE'" ""

--@"../grb_linked_install_scripts/alter_triggers.sql" "ENABLE" "'ODBCAPTURE'" ""

--@"../grb_linked_install_scripts/update_id_sequences.sql" "'ODBCAPTURE'" "" ""

--prompt
--prompt alter_queues_ENABLE
--@"../grb_linked_install_scripts/alter_queues.sql" "ENABLE" "'ODBCAPTURE'" ""

--prompt
--prompt alter_scheduler_jobs_ENABLE
--@"../grb_linked_install_scripts/alter_scheduler_jobs.sql" "ENABLE" "'ODBCAPTURE'" ""





