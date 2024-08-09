
--
--  grbtjva Installation Script
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
-- PACKAGE Install


--
--  Create ODBCTEST.DIR_UTIL Package
--



--DBMS_METADATA:ODBCTEST.DIR_UTIL

  CREATE OR REPLACE EDITIONABLE PACKAGE "ODBCTEST"."DIR_UTIL" authid definer as

   procedure cr_dir (p_directory in varchar2);

   procedure clear_dir (p_directory in varchar2);

   function list (p_path  in  varchar2) return varchar2;

end dir_util;
/


--  Grants


--  Synonyms



----------------------------------------
-- JAVA SOURCE Install


--
--  Create ODBCTEST.DirUtil Java
--
-- DBMS_METADATA does not include "create or replace"



CREATE JAVA SOURCE NAMED "ODBCTEST"."DirUtil" AS
//
//  Directory Utility
//
//  DDieterich  01-Aug-2017
//
import java.lang.*;
import java.util.*;
import java.io.*;
public class DirUtil
{
   //
   // Create a Directory, if it does not exist
   //
   public static void crDir (String directory)
   {
      System.out.println("The crDir directory is `" + directory + "`");
      File path = new File( directory );
      System.out.println("path instantiated");
      if (! path.exists()) {
         System.out.println("path does not exist");
         path.mkdirs();
      }
   }
   //
   // Clear non-directory files from a directory
   //
   public static void clearDir(String directory)
   {
      File      path2;
      int       i;
      System.out.println("The clearDir directory is `" + directory + "`");
      File path1 = new File( directory );
      System.out.println("path1 instantiated");
      String[] filenameArray = path1.list();
      for(i = 0; i < filenameArray.length; i++)
      {
         path2 = new File( directory + "/" + filenameArray[i] );
         if (! path2.isDirectory()) {
            path2.delete();
         }
      }
   }
   //
   // List files from a directory
   //   (select dir_util.list('/opt/install_files/') from dual;)
   //
   public static String list (String path) {
      String list = "";
      File myFile = new File (path);
      String[] arrayList = myFile.list();
      Arrays.sort(arrayList, String.CASE_INSENSITIVE_ORDER);
      for (int i=0; i < arrayList.length; i++) {
         // Prevent directory listing expanding if we will blow VARCHAR2 limit.
         if ((list.length() + arrayList[i].length() + 1) > 32767)
            break;
         if (!list.equals(""))
            list += "," + arrayList[i];
         else
            list += arrayList[i];
      }
      return list;
   }
}

/


--  Grants


--  Synonyms


----------------------------------------
-- Class: DirUtil

--  "JAVA_CLASS" Fine-Grained Java Permissions
--  Note: "GRANTEE" Fine-Grained Java Permissions are given during User creation
--
--  "dbms_java.grant_permission" Parameter Descriptions:
--    grantee            is the name of a schema or role
--    permission_type    is the fully qualified name of a class that extends
--                       java.lang.security.Permission
--    permission_name    is the name of the Permission
--    permission_action  is the action of the Permission
--

--  Grants


--  Synonyms



----------------------------------------
-- PACKAGE BODY Install


--
--  Create ODBCTEST.DIR_UTIL Package Body
--



--DBMS_METADATA:ODBCTEST.DIR_UTIL

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "ODBCTEST"."DIR_UTIL" as

procedure cr_dir (p_directory in varchar2)
as
   language java
   name 'DirUtil.crDir( java.lang.String )';

procedure clear_dir (p_directory in varchar2)
as
   language java
   name 'DirUtil.clearDir( java.lang.String )';

function list (p_path  in  varchar2) return varchar2
as
   language java
   name 'DirUtil.list (java.lang.String) return java.lang.String';

end dir_util;
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





