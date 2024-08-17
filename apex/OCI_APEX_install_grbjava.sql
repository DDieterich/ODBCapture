
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

grant SELECT on "SYS"."DBA_JAVA_CLASSES" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_JAVA_POLICY" to "ODBCAPTURE";




----------------------------------------



--
--  SYSTEM Installation Script
--
--  Must be run as SYSTEM
--



----------------------------------------
-- GRANT Install



--
--  Create ODBCAPTURE Grants
--




--  "sys" BUILD_TYPE Role Grants
--  "GRANTEE" (delayed) Role Grants
--  Note: "OBJECT" Schema Object Grants are given during Role creation

grant "JAVASYSPRIV" to "ODBCAPTURE";




----------------------------------------



--
--  grbjava Installation Script
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
--  Create ODBCAPTURE.GRAB_JAVA Package
--



--DBMS_METADATA:ODBCAPTURE.GRAB_JAVA

  CREATE OR REPLACE EDITIONABLE PACKAGE "ODBCAPTURE"."GRAB_JAVA" 
   authid current_user
as

   procedure grb_sysgrnt
      (fh                 in out nocopy  fh2.sf_ptr_type
      ,in_grantee         in             varchar2
      ,in_file_name       in             varchar2
      ,in_elmnt           in             varchar2
      ,in_build_timing    in             varchar2);

   procedure grb_grnt
      (fh            in out nocopy  fh2.sf_ptr_type
      ,in_grantee    in             varchar2
      ,in_file_name  in             varchar2
      ,in_elmnt      in             varchar2);

   procedure grb_pjava;

end grab_java;
/


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
--  Create ODBCAPTURE.PRIV_OBJ_JAVA_FG_VIEW view
--



--
--  Cannot grant permisions on a view with an error
--  https://asktom.oracle.com/pls/apex/f?p=100:11:0::::P11_QUESTION_ID:43253832697675#2653213300346351987
create view "ODBCAPTURE"."PRIV_OBJ_JAVA_FG_VIEW"
  as   select * from TEMP_PUBLICLY_UPDATEABLE_TABLE;

--  Grants



--DBMS_METADATA:ODBCAPTURE.PRIV_OBJ_JAVA_FG_VIEW

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ODBCAPTURE"."PRIV_OBJ_JAVA_FG_VIEW" ("BUILD_TYPE", "BUILD_TIMING", "BUILD_TYPE_SELECTOR", "JAVA_CLASS_BUILD_TYPE", "JAVA_CLASS_OWNER", "JAVA_CLASS_NAME", "JAVA_CLASS_TYPE", "GRANTEE_BUILD_TYPE", "GRANTEE", "GRANTEE_UOR_TYPE", "JAVA_CLASS_GRANT", "JAVA_CLASS_PERMISSION", "KIND", "SEQ", "ENABLED", "ELEMENT_NAME", "FILE_EXT1", "FILE_EXT2", "FILE_EXT3") AS 
  select case t.build_timing
            when 'CURRENT'
            then obj.build_type
            else uor.build_type
       end                               BUILD_TYPE
      ,t.build_timing
      ,case t.build_timing
            when 'CURRENT'
            then 'JAVA_CLASS'
            else 'GRANTEE'
       end                               BUILD_TYPE_SELECTOR
      ,obj.build_type                    JAVA_CLASS_BUILD_TYPE
      ,djp.type_schema                   JAVA_CLASS_OWNER
      ,djp.name                          JAVA_CLASS_NAME
      ,'JAVA SOURCE'                     JAVA_CLASS_TYPE
      ,uor.build_type                    GRANTEE_BUILD_TYPE
      ,uor.user_or_role                  GRANTEE
      ,uor.uor_type                      GRANTEE_UOR_TYPE
      ,djp.type_name                     JAVA_CLASS_GRANT
      ,djp.action                        JAVA_CLASS_PERMISSION
      ,djp.kind
      ,djp.seq
      ,djp.enabled
      ,ec.element_name
      ,ec.file_ext1
      ,ec.file_ext2
      ,ec.file_ext3
 from  dba_java_policy  djp
       join uor_install_view  uor
            on  uor.user_or_role = djp.grantee
       join obj_install_object_tab  obj
            on  obj.object_owner  = djp.type_schema
            and obj.object_name   = djp.name
            and obj.object_type   = 'JAVA SOURCE'
       join uor_install_view  own
            on  own.user_or_role = djp.type_schema
       join element_conf  ec
            on  ec.element_name = 'GRANT'
       join build_type_timing  t
            -- Ensure the Grantee is available when the Java Owner is installed
            on  t.from_build_type = obj.object_build_type
            and t.to_build_type   = uor.build_type
 where djp.type_schema != 'SYS'               -- Exclude classes owned by SYS
  and  (   uor.oracle_provided = 'N'          -- Not Oracle Provided Grantee
        OR (    uor.build_type     = 'pub'   -- Include 'pub' Grantees
            AND own.oracle_provided = 'N' )   -- Only if owner not Oracle Provided
       );

--  Comments

--DBMS_METADATA:ODBCAPTURE.PRIV_OBJ_JAVA_FG_VIEW


--  Grants


--  Synonyms



--
--  Create ODBCAPTURE.PRIV_SYSOBJ_JAVA_FG_VIEW view
--



--
--  Cannot grant permisions on a view with an error
--  https://asktom.oracle.com/pls/apex/f?p=100:11:0::::P11_QUESTION_ID:43253832697675#2653213300346351987
create view "ODBCAPTURE"."PRIV_SYSOBJ_JAVA_FG_VIEW"
  as   select * from TEMP_PUBLICLY_UPDATEABLE_TABLE;

--  Grants



--DBMS_METADATA:ODBCAPTURE.PRIV_SYSOBJ_JAVA_FG_VIEW

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ODBCAPTURE"."PRIV_SYSOBJ_JAVA_FG_VIEW" ("BUILD_TYPE", "BUILD_TIMING", "BUILD_TYPE_SELECTOR", "OBJECT_NAME_REGEXP", "ONAME_FILTER_BUILD_TYPE", "JAVA_CLASS_OWNER_BUILD_TYPE", "JAVA_CLASS_OWNER", "JAVA_CLASS_NAME", "JAVA_CLASS_TYPE", "GRANTEE_BUILD_TYPE", "GRANTEE", "GRANTEE_UOR_TYPE", "JAVA_CLASS_GRANT", "JAVA_CLASS_PERMISSION", "KIND", "SEQ", "ENABLED") AS 
  select case t.build_timing
          when 'FUTURE' then oc.build_type
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
      ,oc.object_name_regexp
      ,oc.build_type                    ONAME_FILTER_BUILD_TYPE
      ,own.build_type                   JAVA_CLASS_OWNER_BUILD_TYPE
      ,djp.type_schema                  JAVA_CLASS_OWNER
      ,djp.name                         JAVA_CLASS_NAME
      ,'JAVA SOURCE'                    JAVA_CLASS_TYPE
      ,uor.build_type                   GRANTEE_BUILD_TYPE
      ,uor.user_or_role                 GRANTEE
      ,uor.uor_type                     GRANTEE_UOR_TYPE
      ,djp.type_name                    JAVA_CLASS_GRANT
      ,djp.action                       JAVA_CLASS_PERMISSION
      ,djp.kind
      ,djp.seq
      ,djp.enabled
 from  dba_java_policy  djp
       join uor_install_view  uor
            on  uor.user_or_role = djp.grantee
            and uor.oracle_provided = 'N'   -- Exclude Oracle Provided Grantees
       join schema_conf  own
            on  own.username = djp.type_schema
  left join object_conf  oc
            on  oc.element_name = 'SYS_GRANT'
            and oc.username     = djp.grantee
            and regexp_like(djp.type_name || ', ' || djp.name, oc.object_name_regexp)
  left join build_type_timing  t
            on  t.from_build_type = uor.build_type
            and t.to_build_type   = oc.build_type
       -- Include only 'sys' Objects
 where djp.type_schema  = 'SYS';

--  Comments

--DBMS_METADATA:ODBCAPTURE.PRIV_SYSOBJ_JAVA_FG_VIEW


--  Grants


--  Synonyms



----------------------------------------
-- PACKAGE BODY Install


--
--  Create ODBCAPTURE.GRAB_JAVA Package Body
--



--DBMS_METADATA:ODBCAPTURE.GRAB_JAVA

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "ODBCAPTURE"."GRAB_JAVA" 
as


------------------------------------------------------------
-- Create SYS Grants
procedure grb_sysgrnt
      (fh                 in out nocopy  fh2.sf_ptr_type
      ,in_grantee         in             varchar2
      ,in_file_name       in             varchar2
      ,in_elmnt           in             varchar2
      ,in_build_timing    in             varchar2)
is
   header_printed   boolean;
begin
   header_printed := FALSE;
   FOR jpol in
      (select seq
             ,java_class_owner
             ,java_class_grant
             ,java_class_name
             ,java_class_permission
             ,enabled
        from  priv_sysobj_java_fg_view
        where build_type     = grab_scripts.g_build_type
         and  grantee        = in_grantee
         and  build_timing   = in_build_timing
         and  kind           = 'GRANT'
        order by java_class_owner
             ,java_class_grant
             ,java_class_name
             ,java_class_permission)
   LOOP
      if NOT fh2.script_is_open(fh)
      then
         fh := fh2.script_open(in_filename     => in_file_name
                              ,in_elmnt        => in_elmnt
                              ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
         common_util.add_sysgrants_file_header(fh);
      end if;
      if NOT header_printed
      then
         header_printed := TRUE;
         --  Oracle Database 12c Release 1 (12.1)
         --  Database Java Developer''s Guide
         --  10 Security for Oracle Database Java Applications
         --  Setting Permissions
         --  http://docs.oracle.com/database/121/JJDEV/chten.htm#JJDEV13326
         fh2.script_put_line(fh, '');
         fh2.script_put_line(fh, '');
         fh2.script_put_line(fh, '--');
         fh2.script_put_line(fh, '--  "GRANTEE" (Delayed) Fine-Grained Java Permissions');
         fh2.script_put_line(fh, '--  Note: "JAVA_CLASS" Fine-Grained Java Permissions are given during object creation');
         fh2.script_put_line(fh, '--');
         fh2.script_put_line(fh, '--  "dbms_java.grant_permission" Parameter Descriptions:');
         fh2.script_put_line(fh, '--    grantee            is the name of a schema or role');
         fh2.script_put_line(fh, '--    permission_type    is the fully qualified name of a class that extends');
         fh2.script_put_line(fh, '--                       java.lang.security.Permission');
         fh2.script_put_line(fh, '--    permission_name    is the name of the Permission');
         fh2.script_put_line(fh, '--    permission_action  is the action of the Permission');
         fh2.script_put_line(fh, '--');
      end if;
      fh2.script_put_line(fh, 'BEGIN');
      fh2.script_put_line(fh, '  dbms_java.grant_permission');
      fh2.script_put_line(fh, '      (grantee           => ''' || in_grantee                 || ''''   );
      fh2.script_put_line(fh, '      ,permission_type   => ''' || jpol.java_class_owner      || ':'    ||
                                                                  jpol.java_class_grant      || ''''   );
      fh2.script_put_line(fh, '      ,permission_name   => ''' || jpol.java_class_name       || ''''   );
      fh2.script_put_line(fh, '      ,permission_action => ''' || jpol.java_class_permission || ''');' );
      fh2.script_put_line(fh, 'END;' );
      fh2.script_put_line(fh, '/' );
   END LOOP;
end grb_sysgrnt;


------------------------------------------------------------
-- Create FUTURE Grants
procedure grb_grnt
      (fh            in out nocopy  fh2.sf_ptr_type
      ,in_grantee    in             varchar2
      ,in_file_name  in             varchar2
      ,in_elmnt      in             varchar2)
is
   header_printed   boolean;
begin
   header_printed := FALSE;
   FOR jpol in
      (select seq
             ,grantee
             ,java_class_owner
             ,java_class_grant
             ,java_class_name
             ,java_class_permission
             ,enabled
        from  priv_obj_java_fg_view
        where build_type   = grab_scripts.g_build_type
         and  build_timing = 'FUTURE'     -- Grant delayed for this Grantee
         and  kind           = 'GRANT'
        order by grantee
             ,java_class_owner
             ,java_class_grant
             ,java_class_name
             ,java_class_permission)
   LOOP
      if NOT fh2.script_is_open(fh)
      then
         fh := fh2.script_open(in_filename     => in_file_name
                              ,in_elmnt        => in_elmnt
                              ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
         common_util.add_grants_file_header(fh         => fh
                                           ,in_grantee => in_grantee);
      end if;
      if NOT header_printed
      then
         header_printed := TRUE;
         fh2.script_put_line(fh, '');
         --  Oracle Database 12c Release 1 (12.1)
         --  Database Java Developer''s Guide
         --  10 Security for Oracle Database Java Applications
         --  Setting Permissions
         --  http://docs.oracle.com/database/121/JJDEV/chten.htm#JJDEV13326
         fh2.script_put_line(fh, '--');
         fh2.script_put_line(fh, '--  "GRANTEE" (Delayed) Fine-Grained Java Permissions');
         fh2.script_put_line(fh, '--  Note: "JAVA_CLASS" Fine-Grained Java Permissions are given during object creation');
         fh2.script_put_line(fh, '--');
         fh2.script_put_line(fh, '--  "dbms_java.grant_permission" Parameter Descriptions:');
         fh2.script_put_line(fh, '--    grantee            is the name of a schema or role');
         fh2.script_put_line(fh, '--    permission_type    is the fully qualified name of a class that extends');
         fh2.script_put_line(fh, '--                       java.lang.security.Permission');
         fh2.script_put_line(fh, '--    permission_name    is the name of the Permission');
         fh2.script_put_line(fh, '--    permission_action  is the action of the Permission');
         fh2.script_put_line(fh, '--');
      end if;
      fh2.script_put_line(fh, 'BEGIN');
      fh2.script_put_line(fh, '  dbms_java.grant_permission');
      fh2.script_put_line(fh, '      (grantee           => ''' || jpol.grantee               || ''''   );
      fh2.script_put_line(fh, '      ,permission_type   => ''' || jpol.java_class_owner      || ':'    ||
                                                                  jpol.java_class_grant      || ''''   );
      fh2.script_put_line(fh, '      ,permission_name   => ''' || jpol.java_class_name       || ''''   );
      fh2.script_put_line(fh, '      ,permission_action => ''' || jpol.java_class_permission || ''');' );
      fh2.script_put_line(fh, 'END;' );
      fh2.script_put_line(fh, '/' );
   END LOOP;
end grb_grnt;


------------------------------------------------------------
-- Create Java Source
procedure grb_pjava
is
   ELMNT   CONSTANT varchar2(100) := 'JAVA_SOURCE';
   fh      fh2.sf_ptr_type;  -- object script file handle
begin
   for buf1 in (select object_name                      SOURCE_NAME
                      ,object_name || '.' || file_ext1  FILE_NAME
                      ,build_timing
                 from  obj_install_object_tab  pjava
                 where build_type    = grab_scripts.g_build_type
                  and  object_owner  = grab_scripts.g_schema_name
                  and  object_type   = 'JAVA SOURCE'
                  and  element_name  = ELMNT
                 order by object_name
                      ,object_type)
   loop
      fh := fh2.script_open(in_filename     => buf1.file_name
                       ,in_elmnt        => ELMNT
                       ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--');
      fh2.script_put_line(fh, '--  Create ' || grab_scripts.g_schema_name || '.' || buf1.source_name ||' Java');
      fh2.script_put_line(fh, '--');
      fh2.script_put_line(fh, '-- DBMS_METADATA does not include "create or replace"');
      if buf1.build_timing != 'CURRENT'
      then
         fh2.script_put_line(fh, '');
         fh2.script_put_line(fh, '-- NOTE: This is a " || buf1.build_timing || " Java Source');
      end if;
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, 'set define off');
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '');
      --fh2.script_put_line(fh, '--DBMS_METADATA:' || grab_scripts.g_schema_name || '.' || buf1.source_name);
      -- DBMS_METADATA smashes the entire Java Source into 1 line.
      --fh2.put_big_line(fh, grab_scripts.g_schema_name || '.' || buf1.source_name || ' Java Source'
      --               ,COMMON_UTIL.escape_at_sign
      --                  (dbms_metadata.get_ddl
      --                     (object_type => 'JAVA_SOURCE'
      --                     ,name        => buf1.source_name
      --                     ,schema      => grab_scripts.g_schema_name) )
      --               ,common_util.MAXIMUM_SQL_LENGTH);
      fh2.script_put_line(fh, 'CREATE JAVA SOURCE NAMED "' || grab_scripts.g_schema_name ||
                                                     '"."' || buf1.source_name || '" AS');
      for buf2 in (select text
                    from  dba_source
                    where owner = grab_scripts.g_schema_name
                     and  name  = buf1.source_name
                     and  type  = 'JAVA SOURCE'
                    order by line)
      loop
         fh2.script_put_line(fh, COMMON_UTIL.escape_at_sign(buf2.text));
      end loop;
      fh2.script_put_line(fh, '/');
      fh2.script_put_line(fh, '');
      grab_scripts.grb_object_grants(fh, buf1.source_name, 'JAVA SOURCE');
      grab_scripts.grb_object_synonyms(fh, buf1.source_name, 'JAVA SOURCE', common_util.MAXIMUM_SQL_LENGTH);
      fh2.script_put_line(fh, '');
      for buf2 in (
         select name                    CLASS_NAME
          from  dba_java_classes
          where owner  = grab_scripts.g_schema_name
           and  source = buf1.source_name
          order by name)
      loop
         fh2.script_put_line(fh, '----------------------------------------');
         fh2.script_put_line(fh, '-- Class: ' || buf2.class_name);
         fh2.script_put_line(fh, '');
         --  Oracle Database 12c Release 1 (12.1)
         --  Database Java Developer''s Guide
         --  10 Security for Oracle Database Java Applications
         --  Setting Permissions
         --  http://docs.oracle.com/database/121/JJDEV/chten.htm#JJDEV13326
         fh2.script_put_line(fh, '--  "JAVA_CLASS" Fine-Grained Java Permissions');
         fh2.script_put_line(fh, '--  Note: "GRANTEE" Fine-Grained Java Permissions are given during User creation');
         fh2.script_put_line(fh, '--');
         fh2.script_put_line(fh, '--  "dbms_java.grant_permission" Parameter Descriptions:');
         fh2.script_put_line(fh, '--    grantee            is the name of a schema or role');
         fh2.script_put_line(fh, '--    permission_type    is the fully qualified name of a class that extends');
         fh2.script_put_line(fh, '--                       java.lang.security.Permission');
         fh2.script_put_line(fh, '--    permission_name    is the name of the Permission');
         fh2.script_put_line(fh, '--    permission_action  is the action of the Permission');
         fh2.script_put_line(fh, '--');
         FOR jpol in
            (select seq
                   ,grantee
                   ,java_class_owner
                   ,java_class_grant
                   ,java_class_name
                   ,java_class_permission
                   ,enabled
              from  priv_obj_java_fg_view
              where build_type   = grab_scripts.g_build_type
               and  build_timing = 'CURRENT'   -- Grantee has already been created
               and  kind           = 'GRANT'
               and  regexp_like(buf2.class_name, java_class_name)
              order by grantee
                   ,java_class_owner
                   ,java_class_grant
                   ,java_class_name
                   ,java_class_permission)
         LOOP
            fh2.script_put_line(fh, 'BEGIN');
            fh2.script_put_line(fh, '  dbms_java.grant_permission');
            fh2.script_put_line(fh, '      (grantee           => ''' || jpol.grantee               || ''''   );
            fh2.script_put_line(fh, '      ,permission_type   => ''' || jpol.java_class_owner      || ':'    ||
                                                                        jpol.java_class_grant      || ''''   );
            fh2.script_put_line(fh, '      ,permission_name   => ''' || jpol.java_class_name       || ''''   );
            fh2.script_put_line(fh, '      ,permission_action => ''' || jpol.java_class_permission || ''');' );
            fh2.script_put_line(fh, 'END;' );
            fh2.script_put_line(fh, '/' );
         END LOOP;
         grab_scripts.grb_object_grants(fh, buf2.class_name, 'JAVA CLASS');
         grab_scripts.grb_object_synonyms(fh, buf2.class_name, 'JAVA CLASS', common_util.MAXIMUM_SQL_LENGTH);
         fh2.script_put_line(fh, '');
      end loop;
      fh2.script_put_line(fh, 'set define on');
      fh2.script_close(fh);
   end loop;
end grb_pjava;


end grab_java;
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





