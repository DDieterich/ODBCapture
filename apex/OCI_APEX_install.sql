
prompt Converted/Consolidated SQL Script for APEX Instance on OCI


--
--  SYS Installation Script
--
--  Must be run as SYS
--


set blockterminator off
set sqlblanklines on

----------------------------------------
-- USER Install

prompt ------------------------------------------------------------
prompt Running: grbsrc SYS/ODBCAPTURE.user
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE Schema
--

set define off

create user "ODBCAPTURE"
   no authentication
   profile DEFAULT
   temporary tablespace TEMP
   default tablespace USERS
   quota 512M on USERS
   ;

--  Current Grant of SYS Objects (but not directories)

grant SELECT on "SYS"."DBA_ALL_TABLES" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_ASSOCIATIONS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_AUDIT_POLICIES" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_AUDIT_TRAIL" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_CLUSTERS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_COL_COMMENTS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_CONSTRAINTS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_CONS_COLUMNS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_CONTEXT" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_CUBES" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_CUBE_BUILD_PROCESSES" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_CUBE_DIMENSIONS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_DB_LINKS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_DEPENDENCIES" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_DIMENSIONS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_DIRECTORIES" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_EDITIONS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_EDITION_COMMENTS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_EVALUATION_CONTEXTS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_HOST_ACES" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_INDEXES" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_INDEXTYPES" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_INDEXTYPE_COMMENTS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_IND_COLUMNS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_IND_PARTITIONS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_IND_SUBPARTITIONS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_LIBRARIES" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_LOBS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_LOB_PARTITIONS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_LOB_SUBPARTITIONS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_MEASURE_FOLDERS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_MINING_MODELS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_MVIEWS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_MVIEW_COMMENTS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_MVIEW_LOGS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_NESTED_TABLES" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_OBJECTS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_OPERATORS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_OPERATOR_COMMENTS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_PDBS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_PDB_HISTORY" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_PROCEDURES" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_PROFILES" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_QUEUES" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_QUEUE_SCHEDULES" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_QUEUE_SUBSCRIBERS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_QUEUE_TABLES" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_REWRITE_EQUIVALENCES" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_ROLES" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_ROLE_PRIVS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_RSRC_CONSUMER_GROUPS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_RSRC_PLANS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_RULES" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_RULE_SETS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_SCHEDULER_CHAINS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_SCHEDULER_CREDENTIALS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_SCHEDULER_DESTS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_SCHEDULER_FILE_WATCHERS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_SCHEDULER_GROUPS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_SCHEDULER_JOBS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_SCHEDULER_JOB_CLASSES" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_SCHEDULER_PROGRAMS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_SCHEDULER_PROGRAM_ARGS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_SCHEDULER_SCHEDULES" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_SCHEDULER_WINDOWS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_SEQUENCES" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_SOURCE" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_SUBSCR_REGISTRATIONS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_SYNONYMS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_SYS_PRIVS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_TABLES" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_TAB_COLS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_TAB_COLUMNS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_TAB_COMMENTS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_TAB_IDENTITY_COLS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_TAB_PARTITIONS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_TAB_PRIVS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_TAB_SUBPARTITIONS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_TRIGGERS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_TS_QUOTAS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_TYPES" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_USERS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_VIEWS" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_WALLET_ACES" to "ODBCAPTURE";
grant SELECT on "SYS"."DBA_XML_TABLES" to "ODBCAPTURE";

-- Real Application Security System Grants


prompt XS Admin Grant "ADMIN_ANY_SEC_POLICY" to "ODBCAPTURE"
begin
   execute immediate 'begin' ||
                     '  xs_admin_util.grant_system_privilege(''ADMIN_ANY_SEC_POLICY'', ''ODBCAPTURE''); ' ||
                     'end;';
exception when others then
   if    SQLERRM not like '%PLS-00201: identifier ''XS_ADMIN_UTIL.GRANT_SYSTEM_PRIVILEGE'' must be declared%'
     AND SQLERRM not like '%ORA-01031: insufficient privileges%'
   then
      raise;
   end if;
end;
/

prompt XS Admin Cloud Grant "ADMIN_ANY_SEC_POLICY" to "ODBCAPTURE"
begin
   execute immediate 'begin' ||
                     '  xs_admin_cloud_util.grant_system_privilege(''ADMIN_ANY_SEC_POLICY'', ''ODBCAPTURE''); ' ||
                     'end;';
exception when others then
   if SQLERRM not like '%PLS-00201: identifier ''XS_ADMIN_CLOUD_UTIL.GRANT_SYSTEM_PRIVILEGE'' must be declared%'
   then
      raise;
   end if;
end;
/


set define on

----------------------------------------
set sqlblanklines off
set blockterminator on



--
--  SYSTEM Installation Script
--
--  Must be run as SYSTEM
--


set blockterminator off
set sqlblanklines on

----------------------------------------
-- GRANT Install

prompt ------------------------------------------------------------
prompt Running: grbsrc SYSTEM/ODBCAPTURE_usr.grnt
prompt ------------------------------------------------------------


--
--  Create ODBCAPTURE Grants
--

set define off



--  Database System Privileges

grant CREATE ANY DIRECTORY to "ODBCAPTURE";
grant CREATE PUBLIC SYNONYM to "ODBCAPTURE";
grant PURGE DBA_RECYCLEBIN to "ODBCAPTURE";
grant SELECT ANY TABLE to "ODBCAPTURE";
grant UNLIMITED TABLESPACE to "ODBCAPTURE";


--  "sys" BUILD_TYPE Role Grants
--  "GRANTEE" (delayed) Role Grants
--  Note: "OBJECT" Schema Object Grants are given during Role creation

grant "CONNECT" to "ODBCAPTURE";
grant "RESOURCE" to "ODBCAPTURE";
grant "SELECT_CATALOG_ROLE" to "ODBCAPTURE";


set define on


----------------------------------------
set sqlblanklines off
set blockterminator on



--
--  grbsrc Installation Script
--
--  Must be run as a SYSTEM User (DBA)
--
-- Command Line Parameters:
--   1 - INSTALL_SYSTEM_CONNECT: SYSTEM/password@TNSALIAS
--       i.e. pass the username and password for the SYSTEM user
--            and the TNSALIAS for the connection to the database.
--       The Data Load installation requires this connection information.
--


define INSTALL_SYSTEM_CONNECT="&1."

-- For Oracle Change Data Capture (CDC) packages
set sqlprefix "~"

-- Escape character: "^P", CHR(16), DLE
set escape OFF
set escape ""

----------------------------------------
--  Prepare for Install
prompt ------------------------------------------------------------
prompt Running: grbsrc ./installation_prepare.sql
prompt ------------------------------------------------------------

--
--  Prepare for View Install
--

prompt
prompt Create Temp Publicly Updateable Table
create table TEMP_PUBLICLY_UPDATEABLE_TABLE (c1 number);
grant all on TEMP_PUBLICLY_UPDATEABLE_TABLE to PUBLIC with grant option;
create public synonym TEMP_PUBLICLY_UPDATEABLE_TABLE for TEMP_PUBLICLY_UPDATEABLE_TABLE;


----------------------------------------
-- PACKAGE Install

prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/COMMON_UTIL.pkssql
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.COMMON_UTIL Package
--

set define off


--DBMS_METADATA:ODBCAPTURE.COMMON_UTIL

  CREATE OR REPLACE EDITIONABLE PACKAGE "ODBCAPTURE"."COMMON_UTIL" AUTHID DEFINER
as

   BASE64_ENCODE_HEADER     CONSTANT varchar2(30) := '(Base64 with Linefeeds)';
   MAXIMUM_SQL_LENGTH       CONSTANT integer := 2499-2; -- SQL*Plus (Allow 2 EOL characters)
   MAXIMUM_LOADER_LENGTH    CONSTANT integer := 32767-2; -- SQL*Loader Data File (Allow 2 EOL characters)
   MAXIMUM_BASH_LENGTH      CONSTANT integer := 32000-2; -- UNIX/Linux scripts (Allow 2 EOL characters)
   MAXIMUM_CMD_LENGTH       CONSTANT integer := 8191-2; -- Windows scripts (Allow 2 EOL characters)
   SYS_TYPE_REGEXP          CONSTANT varchar2(10) := 'SYSTP%=='; -- Type Specification and Type Body
   RECYCLE_BIN_PATTERN      CONSTANT varchar2(10) := 'BIN$%';
   ORACLE_TEXT_TABLE_REGEXP CONSTANT varchar2(25) := '^DR[$].*[$][A-Z]{1,2}$'; -- Oracle Text Table/Index
   SDO_TABLE_REGEXP         CONSTANT varchar2(25) := '^MDR[ST]_'; -- Spatial Data Table/Sequence
   MVIEW_AUTO_INDEX_PREFIX  CONSTANT varchar2(10) := 'I_SNAP$_';
   SYS_PIPELINE_PATTERN     CONSTANT varchar2(20) := 'SYS\_PLSQL\_%'; -- pipeline package/function
   -- https://blogs.oracle.com/db/entry/oracle_support_master_note_for_troubleshooting_advanced_queuing_and_oracle_streams_propagation_issue
   ADV_QUEUE_VIEW_PATTERN   CONSTANT varchar2(20) := 'QT%\_BUFFER';
   ADV_QUEUE_PREFIX_REGEXP  CONSTANT varchar2(20) := '^AQ[$][_]{0,1}';
   --                                                 ^              - anchor to the start of the line
   --                                                  AQ[$][_]{0,1} - Matches 'AQ$' or 'AQ$_'
   ADV_QUEUE_SUFFIX_REGEXP  CONSTANT varchar2(20) := '([_][A-Z]){0,1}$';
   --                                                 ([_][A-Z]){0,1}  - Matches '', '_A', '_B', '_C', ..., '_Z'
   --                                                                $ - anchor to the end of the line
   STORAGE_CLAUSE_PATTERN   CONSTANT varchar2(30) := '     storage_clause     => %'; -- removal of storage clause from SQL

   LF    constant varchar2(1) := CHR(10);
   CRTN  constant varchar2(1) := CHR(13);

   procedure add_sysgrants_file_header
      (fh  in out nocopy  fh2.sf_ptr_type);

   procedure add_grants_file_header
      (fh          in out nocopy  fh2.sf_ptr_type
      ,in_grantee  in             varchar2);

   procedure dbms_metadata_settings;

   function old_rpad
      (in_expr1  in varchar2
      ,in_n      in number
      ,in_expr2  in varchar2 default null)
   return varchar2;

   function get_RECYCLE_BIN_PATTERN
   return varchar2;

   function split_sql_length
      (in_str  IN CLOB)
   return CLOB;

   function escape_at_sign
      (in_str      IN   CLOB)
   return CLOB;

   procedure check_windows_filenames
      (in_build_type  in varchar2);

   procedure update_vieW_tabs;

   function b64_encode
      (in_blob     in BLOB
      ,in_add_hdr  in boolean default FALSE)
   return CLOB;

end common_util;
/


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/FH2.pkssql
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.FH2 Package
--

set define off


--DBMS_METADATA:ODBCAPTURE.FH2

  CREATE OR REPLACE EDITIONABLE PACKAGE "ODBCAPTURE"."FH2" 
   authid current_user
as

   LF    constant varchar2(1) := CHR(10);
   CRTN  constant varchar2(1) := CHR(13);

   -- Script File Pointer (similar to a file handle)
   TYPE sf_ptr_type is record
      (bld_type    varchar2(10)
      ,bld_ord    pls_integer
      ,file_id     pls_integer
      ,num_lines   pls_integer);

   -- Buffer Records: One Line of Text in a Script/File
   TYPE buffer_rec_type is record
      (len       number(5)
      ,buffer    varchar2(32767));
   -- Associative Array of Script/File Lines
   TYPE buffer_aa_type is table
      of buffer_rec_type
      index by pls_integer;                      -- Line Number
   -- File Header Record
   TYPE file_rec_type is record
      (max_linesize  number(5)
      ,total_bytes   number(14)
      ,num_buffers   number(9)
      ,is_open       varchar2(1)
      ,schema_name   varchar2(128)
      ,filename      varchar2(500)
      ,buffer_aa     buffer_aa_type);
   -- Associative Array of Files
   TYPE file_aa_type is table
      of file_rec_type
      index by pls_integer;                      -- File ID
   -- Associative Array of ELEMENT SEQ
   TYPE seq_aa_type is table
      of file_aa_type
      index by pls_integer;                      -- ELEMENT SEQ
   -- Associative Array of Build Type
   TYPE it_aa_type is table
      of seq_aa_type
      index by varchar2(10);                     -- Build Type
   -- Associative Array of Script Files by Build Type, ELEMENT SEQ, File ID, and Buffers
   sf_aa     it_aa_type;

   function script_is_open
      (file   in fh2.sf_ptr_type)
   return boolean;

   PROCEDURE script_close_all;

   function script_open
      (in_filename      in varchar2
      ,in_elmnt         in varchar2
      ,in_max_linesize  in binary_integer default 1024)
   return fh2.sf_ptr_type;

   procedure script_put
      (file       IN OUT NOCOPY fh2.sf_ptr_type
      ,buffer     IN            VARCHAR2);

   procedure script_put_line
      (file       IN OUT NOCOPY fh2.sf_ptr_type
      ,buffer     IN            VARCHAR2);

   PROCEDURE script_new_line
      (file  IN OUT NOCOPY fh2.sf_ptr_type
      ,lines IN     NATURAL default 1);

   PROCEDURE script_close
      (file   IN OUT NOCOPY fh2.sf_ptr_type);

   procedure put_big_line
      (in_fh      in out NOCOPY fh2.sf_ptr_type
      ,in_loc     in            varchar2
      ,in_txt     in            CLOB
      ,in_max_len in            number);

   procedure remove_storage_clause
      (in_fh       in out NOCOPY fh2.sf_ptr_type
      ,in_loc      in            varchar2
      ,in_txt      in            CLOB
      ,in_max_len  in            number);

   ----------------------------------------------------

   procedure write_scripts
      (in_zip_file_name  in varchar2
      ,in_folder_name    in varchar2 default '');

   procedure show_file
      (in_bld_type  in  varchar2
      ,in_element   in  varchar2);

   procedure clear_buffers
      (in_build_type   in varchar2 default null);

end fh2;
/


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/GRAB_SCRIPTS.pkssql
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.GRAB_SCRIPTS Package
--

set define off


--DBMS_METADATA:ODBCAPTURE.GRAB_SCRIPTS

  CREATE OR REPLACE EDITIONABLE PACKAGE "ODBCAPTURE"."GRAB_SCRIPTS" 
   authid current_user
as

   --
   -- DBA OBJECT TYPES
   --   (https://renenyffenegger.ch/notes/development/databases/Oracle/installed/data-dictionary/objects/index)
   --
   -- CHAIN
   -- CLUSTER
   -- CONSUMER GROUP
   -- CONTEXT
   -- DATABASE LINK
   -- DESTINATION
   -- DIRECTORY
   -- EDITION
   -- EVALUATION CONTEXT
   -- FUNCTION
   -- INDEX
   -- INDEX PARTITION
   -- INDEX SUBPARTITION
   -- INDEXTYPE
   -- JOB
   -- JOB CLASS
   -- LIBRARY
   -- LOB
   -- LOB PARTITION
   -- MATERIALIZED VIEW
   -- OPERATOR
   -- PACKAGE
   -- PACKAGE BODY
   -- PROCEDURE
   -- PROGRAM
   -- QUEUE
   -- RESOURCE PLAN
   -- RULE
   -- RULE SET
   -- SCHEDULE
   -- SCHEDULER GROUP
   -- SEQUENCE
   -- SYNONYM
   -- TABLE
   -- TABLE PARTITION
   -- TABLE SUBPARTITION
   -- TRIGGER
   -- TYPE
   -- TYPE BODY
   -- UNDEFINED
   -- VIEW
   -- WINDOW
   -- XML SCHEMA

   LF    constant varchar2(1) := CHR(10);
   CRTN  constant varchar2(1) := CHR(13);

   -- Installed Types
   TYPE installed_types_aa_type is table of varchar2(1)
      index by build_conf.build_type%TYPE;
   installed_types_aa   installed_types_aa_type;

   -- INTERNALs Made Public for Modularization

   TYPE grb_cldr_delim_nt_type is table of varchar2(1);
   grb_cldr_delim_nt   grb_cldr_delim_nt_type :=
                       grb_cldr_delim_nt_type (CHR(11), CHR(12), CHR(28),
                                               CHR(29), CHR(30), CHR(31));
   grb_cldr_array_lvl  pls_integer;

   g_build_type      varchar2(10);
   g_schema_name     varchar2(128);

   procedure grb_object_grants
      (in_fh           in out NOCOPY fh2.sf_ptr_type
      ,in_object_name  in            varchar2
      ,in_object_type  in            varchar2);
   procedure grb_object_synonyms
      (in_fh             in out NOCOPY fh2.sf_ptr_type
      ,in_object_name    in            varchar2
      ,in_object_type    in            varchar2
      ,in_max_len        in            number);

   ----------------------------------------------------

   procedure set_installed_types;

   procedure all_scripts
      (in_build_type   in varchar2);

   function get_version
   return varchar2;

end grab_scripts;
/


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/ROOT_SCRIPTS.pkssql
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.ROOT_SCRIPTS Package
--

set define off


--DBMS_METADATA:ODBCAPTURE.ROOT_SCRIPTS

  CREATE OR REPLACE EDITIONABLE PACKAGE "ODBCAPTURE"."ROOT_SCRIPTS" 
   authid current_user
as

   function dbi_sql
      (in_build_type  in varchar2)
   return varchar2;

   function installation_finalize_sql
      (in_build_type  in varchar2)
   return varchar2;

   function installation_prepare_sql
      (in_build_type  in varchar2)
   return varchar2;

   function odbcapture_installation_logs_cldr
      (in_build_type  in varchar2)
   return varchar2;

   function odbcapture_installation_logs_csv
      (in_build_type  in varchar2)
   return varchar2;

   function odbcapture_installation_logs_ctl
      (in_build_type  in varchar2)
   return varchar2;

   function report_status_sql
      (in_build_type  in varchar2)
   return varchar2;

   function list_invalids_csv
      (in_build_type  in varchar2)
   return varchar2;

   function set_user_authentication_sql
      (in_build_type  in varchar2)
   return varchar2;

end root_scripts;
/


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/ZIP_UTIL_PKG.pkssql
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.ZIP_UTIL_PKG Package
--

set define off


--DBMS_METADATA:ODBCAPTURE.ZIP_UTIL_PKG

  CREATE OR REPLACE EDITIONABLE PACKAGE "ODBCAPTURE"."ZIP_UTIL_PKG" authid definer
is

  /*

  Purpose:      Package handles zipping and unzipping of files

  Remarks:      by Anton Scheffer, see http://forums.oracle.com/forums/thread.jspa?messageID=9289744#9289744

                for unzipping, see http://technology.amis.nl/blog/8090/parsing-a-microsoft-word-docx-and-unzip-zipfiles-with-plsql
                for zipping, see http://forums.oracle.com/forums/thread.jspa?threadID=1115748&tstart=0

  Who     Date        Description
  ------  ----------  --------------------------------
  MBR     09.01.2011  Created

  */

  type t_file_list is table of clob;
--
  function get_file_list(
    p_dir in varchar2
  , p_zip_file in varchar2
  , p_encoding in varchar2 := null
  )
    return t_file_list;
--
  function get_file_list(
    p_zipped_blob in blob
  , p_encoding in varchar2 := null /* Use CP850 for zip files created with a German Winzip to see umlauts, etc */
  )
    return t_file_list;
--
  function get_file(
    p_dir in varchar2
  , p_zip_file in varchar2
  , p_file_name in varchar2
  , p_encoding in varchar2 := null
  )
    return blob;
--
  function get_file(
    p_zipped_blob in blob
  , p_file_name in varchar2
  , p_encoding in varchar2 := null
  )
    return blob;
--
  procedure add_file(
    p_zipped_blob in out nocopy blob
  , p_name in varchar2
  , p_content in blob
  );
--
  procedure finish_zip(
    p_zipped_blob in out nocopy blob
  );
--
  procedure save_zip(
    p_zipped_blob in blob
  , p_dir in varchar2
  , p_filename in varchar2
  );

end zip_util_pkg;
/


--  Grants


--  Synonyms


set define on

----------------------------------------
-- TABLE Install

prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/BUILD_CONF.tbl
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.BUILD_CONF Table
--

set define off


--DBMS_METADATA:ODBCAPTURE.BUILD_CONF

  CREATE TABLE "ODBCAPTURE"."BUILD_CONF" 
   (	"BUILD_SEQ" NUMBER(2,0) NOT NULL ENABLE, 
	"BUILD_TYPE" VARCHAR2(10 BYTE) NOT NULL ENABLE, 
	"NOTES" VARCHAR2(1024 BYTE)
   ) SEGMENT CREATION IMMEDIATE  LOGGING;
ALTER TABLE "ODBCAPTURE"."BUILD_CONF" ADD CONSTRAINT "BUILD_CONF_PK" PRIMARY KEY ("BUILD_SEQ")
  USING INDEX  ENABLE;
ALTER TABLE "ODBCAPTURE"."BUILD_CONF" ADD CONSTRAINT "BUILD_CONF_NK1" UNIQUE ("BUILD_TYPE")
  USING INDEX  ENABLE;

--  Comments

--DBMS_METADATA:ODBCAPTURE.BUILD_CONF

   COMMENT ON COLUMN "ODBCAPTURE"."BUILD_CONF"."BUILD_SEQ" IS 'Unique Sequence of the build type (Primary Key)';
   COMMENT ON COLUMN "ODBCAPTURE"."BUILD_CONF"."BUILD_TYPE" IS 'Name of the build type (Unique Key) (Required)';
   COMMENT ON COLUMN "ODBCAPTURE"."BUILD_CONF"."NOTES" IS 'Free text field (Optional)';
   COMMENT ON TABLE "ODBCAPTURE"."BUILD_CONF"  IS 'List of Build Types.  Also defines the names of the top level directories';


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/BUILD_PATH.tbl
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.BUILD_PATH Table
--

set define off


--DBMS_METADATA:ODBCAPTURE.BUILD_PATH

  CREATE TABLE "ODBCAPTURE"."BUILD_PATH" 
   (	"PARENT_BUILD_SEQ" NUMBER(2,0) NOT NULL ENABLE, 
	"BUILD_SEQ" NUMBER(2,0) NOT NULL ENABLE
   ) SEGMENT CREATION IMMEDIATE  LOGGING;
ALTER TABLE "ODBCAPTURE"."BUILD_PATH" ADD CONSTRAINT "BUILD_PATH_PK" PRIMARY KEY ("PARENT_BUILD_SEQ", "BUILD_SEQ")
  USING INDEX  ENABLE;
ALTER TABLE "ODBCAPTURE"."BUILD_PATH" ADD CONSTRAINT "BUILD_PATH_CK1" CHECK (parent_build_seq < build_seq) ENABLE;

--  Comments

--DBMS_METADATA:ODBCAPTURE.BUILD_PATH

   COMMENT ON COLUMN "ODBCAPTURE"."BUILD_PATH"."PARENT_BUILD_SEQ" IS 'Parent Unique Sequence of the build type (Primary Key)';
   COMMENT ON COLUMN "ODBCAPTURE"."BUILD_PATH"."BUILD_SEQ" IS 'Unique Sequence of the build type (Primary Key)';
   COMMENT ON TABLE "ODBCAPTURE"."BUILD_PATH"  IS 'Multi-path Hierarchy of BUILD_TYPEs';


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/BUILD_TYPE_TIMING.tbl
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.BUILD_TYPE_TIMING Table
--

set define off


--DBMS_METADATA:ODBCAPTURE.BUILD_TYPE_TIMING

  CREATE TABLE "ODBCAPTURE"."BUILD_TYPE_TIMING" 
   (	"FROM_BUILD_TYPE" VARCHAR2(10 BYTE), 
	"BUILD_TIMING" CHAR(7 BYTE), 
	"TO_BUILD_TYPE" VARCHAR2(10 BYTE)
   ) SEGMENT CREATION IMMEDIATE  LOGGING;

--  Comments

--DBMS_METADATA:ODBCAPTURE.BUILD_TYPE_TIMING

   COMMENT ON COLUMN "ODBCAPTURE"."BUILD_TYPE_TIMING"."FROM_BUILD_TYPE" IS 'Mapped "from" BUILD_TYPE';
   COMMENT ON COLUMN "ODBCAPTURE"."BUILD_TYPE_TIMING"."BUILD_TIMING" IS 'Timing (Future or Current) of BUILD_TYPE installations';
   COMMENT ON COLUMN "ODBCAPTURE"."BUILD_TYPE_TIMING"."TO_BUILD_TYPE" IS 'Mapped "ro" BUILD_TYPE';
   COMMENT ON TABLE "ODBCAPTURE"."BUILD_TYPE_TIMING"  IS 'De-Normalized Permutated Data from BUILD_CONF and BUILD_PATH.';


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/DBA_DEPENDENCIES_TAB.tbl
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.DBA_DEPENDENCIES_TAB Table
--

set define off


--DBMS_METADATA:ODBCAPTURE.DBA_DEPENDENCIES_TAB

  CREATE TABLE "ODBCAPTURE"."DBA_DEPENDENCIES_TAB" 
   (	"OBJECT_OWNER_BUILD_TYPE" VARCHAR2(10 BYTE) NOT NULL ENABLE, 
	"OBJECT_OWNER" VARCHAR2(128 BYTE) NOT NULL ENABLE, 
	"OBJECT_NAME" VARCHAR2(128 BYTE) NOT NULL ENABLE, 
	"OBJECT_TYPE" VARCHAR2(19 BYTE), 
	"REFERENCED_OWNER" VARCHAR2(128 BYTE), 
	"REF_OWNER_BUILD_TYPE" VARCHAR2(10 BYTE) NOT NULL ENABLE, 
	"REFERENCED_NAME" VARCHAR2(128 BYTE), 
	"REFERENCED_TYPE" VARCHAR2(19 BYTE), 
	"REFERENCED_LINK_NAME" VARCHAR2(128 BYTE), 
	"DEPENDENCY_TYPE" VARCHAR2(4 BYTE)
   ) SEGMENT CREATION IMMEDIATE  LOGGING;

--  Comments

--DBMS_METADATA:ODBCAPTURE.DBA_DEPENDENCIES_TAB


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/DBA_OBJECTS_TAB.tbl
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.DBA_OBJECTS_TAB Table
--

set define off


--DBMS_METADATA:ODBCAPTURE.DBA_OBJECTS_TAB

  CREATE TABLE "ODBCAPTURE"."DBA_OBJECTS_TAB" 
   (	"OBJECT_OWNER_BUILD_TYPE" VARCHAR2(10 BYTE), 
	"OBJECT_OWNER" VARCHAR2(128 BYTE), 
	"OBJECT_NAME" VARCHAR2(128 BYTE), 
	"OBJECT_TYPE" VARCHAR2(23 BYTE), 
	"TABLE_FLAG" VARCHAR2(3 BYTE), 
	"SELTYPE" VARCHAR2(4 BYTE)
   ) SEGMENT CREATION IMMEDIATE  LOGGING;

--  Comments

--DBMS_METADATA:ODBCAPTURE.DBA_OBJECTS_TAB


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/DBA_TAB_PRIVS_TAB.tbl
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.DBA_TAB_PRIVS_TAB Table
--

set define off


--DBMS_METADATA:ODBCAPTURE.DBA_TAB_PRIVS_TAB

  CREATE TABLE "ODBCAPTURE"."DBA_TAB_PRIVS_TAB" 
   (	"OBJECT_OWNER_BUILD_TYPE" VARCHAR2(10 BYTE), 
	"OBJECT_OWNER" VARCHAR2(128 BYTE), 
	"OBJECT_TYPE" VARCHAR2(24 BYTE), 
	"OBJECT_NAME" VARCHAR2(128 BYTE), 
	"PRIVILEGE" VARCHAR2(40 BYTE), 
	"GRANTEE" VARCHAR2(128 BYTE), 
	"GRANTEE_UOR_TYPE" CHAR(4 BYTE), 
	"GRANTEE_BUILD_TYPE" VARCHAR2(10 BYTE), 
	"GRANTABLE" VARCHAR2(3 BYTE), 
	"HIERARCHY" VARCHAR2(3 BYTE), 
	"COMMON" VARCHAR2(3 BYTE), 
	"INHERITED" VARCHAR2(3 BYTE)
   ) SEGMENT CREATION IMMEDIATE  LOGGING;

--  Comments

--DBMS_METADATA:ODBCAPTURE.DBA_TAB_PRIVS_TAB


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/DLOAD_CONF.tbl
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.DLOAD_CONF Table
--

set define off


--DBMS_METADATA:ODBCAPTURE.DLOAD_CONF

  CREATE TABLE "ODBCAPTURE"."DLOAD_CONF" 
   (	"USERNAME" VARCHAR2(128 BYTE) NOT NULL ENABLE, 
	"TABLE_NAME" VARCHAR2(128 BYTE) NOT NULL ENABLE, 
	"BUILD_TYPE" VARCHAR2(10 BYTE) NOT NULL ENABLE, 
	"ORDER_BY_COLUMNS" VARCHAR2(4000 BYTE) NOT NULL ENABLE, 
	"BEFORE_SELECT_SQL" VARCHAR2(4000 BYTE), 
	"COLUMNS_REMOVED" VARCHAR2(4000 BYTE), 
	"WHERE_CLAUSE" VARCHAR2(4000 BYTE), 
	"AFTER_ORDER_BY_SQL" VARCHAR2(4000 BYTE), 
	"NOTES" VARCHAR2(4000 BYTE)
   ) SEGMENT CREATION IMMEDIATE  LOGGING;
ALTER TABLE "ODBCAPTURE"."DLOAD_CONF" ADD CONSTRAINT "DLOAD_CONF_PK" PRIMARY KEY ("USERNAME", "TABLE_NAME", "BUILD_TYPE")
  USING INDEX  ENABLE;

--  Comments

--DBMS_METADATA:ODBCAPTURE.DLOAD_CONF

   COMMENT ON COLUMN "ODBCAPTURE"."DLOAD_CONF"."USERNAME" IS 'Name of the database schema (Primary Key Column 1). Value must be in SCHEMA_CONF table.';
   COMMENT ON COLUMN "ODBCAPTURE"."DLOAD_CONF"."TABLE_NAME" IS 'Name of the database table/view (Primary Key Column 2).';
   COMMENT ON COLUMN "ODBCAPTURE"."DLOAD_CONF"."BUILD_TYPE" IS 'Name of the database schema (Primary Key Column 3). Value must be in BUILD_CONF table.';
   COMMENT ON COLUMN "ODBCAPTURE"."DLOAD_CONF"."ORDER_BY_COLUMNS" IS 'ORDER BY columns for the selected data load to capture.  List the column names as they would appear in an ORDER BY clause.';
   COMMENT ON COLUMN "ODBCAPTURE"."DLOAD_CONF"."BEFORE_SELECT_SQL" IS 'Any SQL before " select * from owner.table " for the selected data load to capture (Optional).';
   COMMENT ON COLUMN "ODBCAPTURE"."DLOAD_CONF"."COLUMNS_REMOVED" IS 'REGEXP Filter of Columns to Remove from Data Load (Optional)';
   COMMENT ON COLUMN "ODBCAPTURE"."DLOAD_CONF"."WHERE_CLAUSE" IS 'WHERE clause for the selected data load to capture (Optional). Do not add the WHERE keyword';
   COMMENT ON COLUMN "ODBCAPTURE"."DLOAD_CONF"."AFTER_ORDER_BY_SQL" IS 'Any SQL after the ORDER BY clause for the selected data load to capture (Optional). Do not add ";" at the end.';
   COMMENT ON COLUMN "ODBCAPTURE"."DLOAD_CONF"."NOTES" IS 'Free text field (Optional)';
   COMMENT ON TABLE "ODBCAPTURE"."DLOAD_CONF"  IS 'DATA LOAD filter for each table/view in a schema for a build type.';


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/ELEMENT_CONF.tbl
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.ELEMENT_CONF Table
--

set define off


--DBMS_METADATA:ODBCAPTURE.ELEMENT_CONF

  CREATE TABLE "ODBCAPTURE"."ELEMENT_CONF" 
   (	"ELEMENT_SEQ" NUMBER(5,0) NOT NULL ENABLE, 
	"ELEMENT_NAME" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"FILE_EXT1" VARCHAR2(6 BYTE) NOT NULL ENABLE, 
	"FILE_EXT2" VARCHAR2(6 BYTE), 
	"FILE_EXT3" VARCHAR2(6 BYTE), 
	"OBJECT_TYPE" VARCHAR2(30 BYTE), 
	"NAME_CHECK_OBJECT_TYPE" VARCHAR2(30 BYTE), 
	"NOTES" VARCHAR2(1024 BYTE)
   ) SEGMENT CREATION IMMEDIATE  LOGGING;
ALTER TABLE "ODBCAPTURE"."ELEMENT_CONF" ADD CONSTRAINT "ELEMENT_CONF_PK" PRIMARY KEY ("ELEMENT_SEQ")
  USING INDEX  ENABLE;
ALTER TABLE "ODBCAPTURE"."ELEMENT_CONF" ADD CONSTRAINT "ELEMENT_CONF_UK1" UNIQUE ("ELEMENT_NAME")
  USING INDEX  ENABLE;

--  Comments

--DBMS_METADATA:ODBCAPTURE.ELEMENT_CONF

   COMMENT ON COLUMN "ODBCAPTURE"."ELEMENT_CONF"."ELEMENT_SEQ" IS 'Sequence for this element (Primary Key)';
   COMMENT ON COLUMN "ODBCAPTURE"."ELEMENT_CONF"."ELEMENT_NAME" IS 'Name of the element (Unique Key) (Required)';
   COMMENT ON COLUMN "ODBCAPTURE"."ELEMENT_CONF"."FILE_EXT1" IS 'Primary filename extension this element (Required)';
   COMMENT ON COLUMN "ODBCAPTURE"."ELEMENT_CONF"."FILE_EXT2" IS 'Secondary filename extension this element (Optional)';
   COMMENT ON COLUMN "ODBCAPTURE"."ELEMENT_CONF"."FILE_EXT3" IS 'Tertiary filename extension this element (Optional)';
   COMMENT ON COLUMN "ODBCAPTURE"."ELEMENT_CONF"."OBJECT_TYPE" IS 'Actual DBA_OBJECTS Object Type for this element';
   COMMENT ON COLUMN "ODBCAPTURE"."ELEMENT_CONF"."NAME_CHECK_OBJECT_TYPE" IS 'Object Type used for Windows file name checking';
   COMMENT ON COLUMN "ODBCAPTURE"."ELEMENT_CONF"."NOTES" IS 'Free text field (Optional)';
   COMMENT ON TABLE "ODBCAPTURE"."ELEMENT_CONF"  IS 'List of Elements to install.  Also defines the filename extensions that are used';


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/METADATA_TRANSFORM_PARAMS.tbl
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.METADATA_TRANSFORM_PARAMS Table
--

set define off


--DBMS_METADATA:ODBCAPTURE.METADATA_TRANSFORM_PARAMS

  CREATE TABLE "ODBCAPTURE"."METADATA_TRANSFORM_PARAMS" 
   (	"NAME" VARCHAR2(30 BYTE) NOT NULL ENABLE, 
	"VALUE_TYPE" VARCHAR2(8 BYTE) NOT NULL ENABLE, 
	"VALUE" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE  LOGGING;
ALTER TABLE "ODBCAPTURE"."METADATA_TRANSFORM_PARAMS" ADD CONSTRAINT "METADATA_TRANSFORM_PARAMS_CK1" CHECK (value_type in ('BOOLEAN','NUMBER','VARCHAR')) ENABLE;
ALTER TABLE "ODBCAPTURE"."METADATA_TRANSFORM_PARAMS" ADD CONSTRAINT "METADATA_TRANSFORM_PARAMS_PK" PRIMARY KEY ("NAME")
  USING INDEX  ENABLE;

--  Comments

--DBMS_METADATA:ODBCAPTURE.METADATA_TRANSFORM_PARAMS

   COMMENT ON COLUMN "ODBCAPTURE"."METADATA_TRANSFORM_PARAMS"."NAME" IS 'Parameter Name';
   COMMENT ON COLUMN "ODBCAPTURE"."METADATA_TRANSFORM_PARAMS"."VALUE_TYPE" IS 'Type of Parameter: "BOOLEAN", "NUMBER", or "VARCHAR"';
   COMMENT ON COLUMN "ODBCAPTURE"."METADATA_TRANSFORM_PARAMS"."VALUE" IS 'Parameter Value';
   COMMENT ON TABLE "ODBCAPTURE"."METADATA_TRANSFORM_PARAMS"  IS 'DBMS_METADATA Transformation Paramters.';


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/OBJECT_CONF.tbl
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.OBJECT_CONF Table
--

set define off


--DBMS_METADATA:ODBCAPTURE.OBJECT_CONF

  CREATE TABLE "ODBCAPTURE"."OBJECT_CONF" 
   (	"USERNAME" VARCHAR2(128 BYTE) NOT NULL ENABLE, 
	"ELEMENT_NAME" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"BUILD_TYPE" VARCHAR2(10 BYTE) NOT NULL ENABLE, 
	"OBJECT_NAME_REGEXP" VARCHAR2(4000 BYTE) NOT NULL ENABLE, 
	"NOTES" VARCHAR2(1024 BYTE)
   ) SEGMENT CREATION IMMEDIATE  LOGGING;
ALTER TABLE "ODBCAPTURE"."OBJECT_CONF" ADD CONSTRAINT "OBJECT_CONF_PK" PRIMARY KEY ("USERNAME", "ELEMENT_NAME", "BUILD_TYPE")
  USING INDEX  ENABLE;
ALTER TABLE "ODBCAPTURE"."OBJECT_CONF" ADD CONSTRAINT "OBJECT_CONF_CK1" CHECK (element_name not in ('USER','QUEUE_TABLE','DATA_LOAD','TABLE_FOREIGN_KEY','VIEW_FOREIGN_KEY','MVIEW_FOREIGN_KEY')) ENABLE;

--  Comments

--DBMS_METADATA:ODBCAPTURE.OBJECT_CONF

   COMMENT ON COLUMN "ODBCAPTURE"."OBJECT_CONF"."USERNAME" IS 'Name of the database schema (Primary Key Column 1). Value must be in SCHEMA_CONF table.';
   COMMENT ON COLUMN "ODBCAPTURE"."OBJECT_CONF"."ELEMENT_NAME" IS 'Name of the element (Primary Key Column 2). Value must be in ELEMENT_CONF table.';
   COMMENT ON COLUMN "ODBCAPTURE"."OBJECT_CONF"."BUILD_TYPE" IS 'Name of the build type (Primary Key Column 3). Value must be in BUILD_CONF table.';
   COMMENT ON COLUMN "ODBCAPTURE"."OBJECT_CONF"."OBJECT_NAME_REGEXP" IS 'Where clause of the selected object to capture (Required).';
   COMMENT ON COLUMN "ODBCAPTURE"."OBJECT_CONF"."NOTES" IS 'Free text field (Optional)';
   COMMENT ON TABLE "ODBCAPTURE"."OBJECT_CONF"  IS 'Object name filter for each element in a schema for an build type.';


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/OBJ_INSTALL_COMMENTS_TAB.tbl
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.OBJ_INSTALL_COMMENTS_TAB Table
--

set define off


--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_COMMENTS_TAB

  CREATE TABLE "ODBCAPTURE"."OBJ_INSTALL_COMMENTS_TAB" 
   (	"BUILD_TYPE" VARCHAR2(10 BYTE), 
	"OBJECT_OWNER_BUILD_TYPE" VARCHAR2(10 BYTE), 
	"TABLE_OWNER" VARCHAR2(128 BYTE), 
	"TABLE_BUILD_TYPE" VARCHAR2(10 BYTE), 
	"TABLE_NAME" VARCHAR2(128 BYTE), 
	"TABLE_TYPE" VARCHAR2(23 BYTE), 
	"ELEMENT_NAME" VARCHAR2(20 BYTE), 
	"COLUMN_NAME" VARCHAR2(128 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE)
   ) SEGMENT CREATION IMMEDIATE  LOGGING;

--  Comments

--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_COMMENTS_TAB


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/OBJ_INSTALL_CONTEXT_TAB.tbl
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.OBJ_INSTALL_CONTEXT_TAB Table
--

set define off


--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_CONTEXT_TAB

  CREATE TABLE "ODBCAPTURE"."OBJ_INSTALL_CONTEXT_TAB" 
   (	"BUILD_TYPE" VARCHAR2(10 BYTE), 
	"BUILD_TIMING" CHAR(7 BYTE), 
	"CONTEXT_BUILD_TYPE" VARCHAR2(10 BYTE), 
	"CONTEXT_OBJECT_NAME_REGEXP" VARCHAR2(4000 BYTE), 
	"CONTEXT_OWNER" VARCHAR2(128 BYTE), 
	"CONTEXT_NAME" VARCHAR2(128 BYTE), 
	"CONTEXT_TYPE" VARCHAR2(22 BYTE), 
	"PACKAGE_BUILD_TYPE" VARCHAR2(10 BYTE), 
	"PACKAGE_OBJECT_NAME_REGEXP" VARCHAR2(4000 BYTE), 
	"PACKAGE_OWNER" VARCHAR2(128 BYTE), 
	"PACKAGE_NAME" VARCHAR2(128 BYTE), 
	"PACKAGE_TYPE" VARCHAR2(23 BYTE), 
	"ELEMENT_NAME" VARCHAR2(20 BYTE), 
	"FILE_EXT1" VARCHAR2(6 BYTE), 
	"FILE_EXT2" VARCHAR2(6 BYTE), 
	"FILE_EXT3" VARCHAR2(6 BYTE)
   ) SEGMENT CREATION IMMEDIATE  LOGGING;

--  Comments

--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_CONTEXT_TAB


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/OBJ_INSTALL_DATA_LOAD_TAB.tbl
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.OBJ_INSTALL_DATA_LOAD_TAB Table
--

set define off


--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_DATA_LOAD_TAB

  CREATE TABLE "ODBCAPTURE"."OBJ_INSTALL_DATA_LOAD_TAB" 
   (	"BUILD_TYPE" VARCHAR2(10 BYTE) NOT NULL ENABLE, 
	"BUILD_TIMING" CHAR(7 BYTE), 
	"TABLE_BUILD_TYPE" VARCHAR2(10 BYTE), 
	"TABLE_BUILD_TIMING" CHAR(7 BYTE), 
	"TABLE_OWNER" VARCHAR2(128 BYTE), 
	"TABLE_NAME" VARCHAR2(128 BYTE), 
	"TABLE_TYPE" VARCHAR2(23 BYTE), 
	"BEFORE_SELECT_SQL" VARCHAR2(4000 BYTE), 
	"COLUMNS_REMOVED" VARCHAR2(4000 BYTE), 
	"WHERE_CLAUSE" VARCHAR2(4000 BYTE), 
	"ORDER_BY_COLUMNS" VARCHAR2(4000 BYTE) NOT NULL ENABLE, 
	"AFTER_ORDER_BY_SQL" VARCHAR2(4000 BYTE), 
	"NOTES" VARCHAR2(4000 BYTE), 
	"ELEMENT_NAME" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"FILE_EXT1" VARCHAR2(6 BYTE) NOT NULL ENABLE, 
	"FILE_EXT2" VARCHAR2(6 BYTE), 
	"FILE_EXT3" VARCHAR2(6 BYTE)
   ) SEGMENT CREATION IMMEDIATE  LOGGING;

--  Comments

--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_DATA_LOAD_TAB


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/OBJ_INSTALL_FKEY_TAB.tbl
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.OBJ_INSTALL_FKEY_TAB Table
--

set define off


--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_FKEY_TAB

  CREATE TABLE "ODBCAPTURE"."OBJ_INSTALL_FKEY_TAB" 
   (	"BUILD_TYPE" VARCHAR2(10 BYTE), 
	"BUILD_TYPE_SELECTOR" VARCHAR2(20 BYTE), 
	"BASE_TABLE_BUILD_TYPE" VARCHAR2(10 BYTE), 
	"BASE_TABLE_OBJECT_NAME_REGEXP" VARCHAR2(4000 BYTE), 
	"BASE_TABLE_OWNER" VARCHAR2(128 BYTE), 
	"BASE_TABLE_NAME" VARCHAR2(128 BYTE), 
	"BASE_TABLE_TYPE" VARCHAR2(23 BYTE), 
	"FOREIGN_KEY_NAME" VARCHAR2(128 BYTE), 
	"UNIQUE_KEY_NAME" VARCHAR2(128 BYTE), 
	"UNIQUE_KEY_TYPE" VARCHAR2(1 BYTE), 
	"REF_TABLE_BUILD_TYPE" VARCHAR2(10 BYTE), 
	"REF_TABLE_OBJECT_NAME_REGEXP" VARCHAR2(4000 BYTE), 
	"REF_TABLE_OWNER" VARCHAR2(128 BYTE), 
	"REF_TABLE_NAME" VARCHAR2(128 BYTE), 
	"REF_TABLE_TYPE" VARCHAR2(23 BYTE), 
	"ELEMENT_NAME" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"FILE_EXT1" VARCHAR2(6 BYTE) NOT NULL ENABLE, 
	"FILE_EXT2" VARCHAR2(6 BYTE), 
	"FILE_EXT3" VARCHAR2(6 BYTE)
   ) SEGMENT CREATION IMMEDIATE  LOGGING;

--  Comments

--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_FKEY_TAB


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/OBJ_INSTALL_INDEX_TAB.tbl
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.OBJ_INSTALL_INDEX_TAB Table
--

set define off


--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_INDEX_TAB

  CREATE TABLE "ODBCAPTURE"."OBJ_INSTALL_INDEX_TAB" 
   (	"BUILD_TYPE" VARCHAR2(10 BYTE), 
	"BUILD_TYPE_SELECTOR" VARCHAR2(6 BYTE), 
	"INDEX_BUILD_TYPE" VARCHAR2(10 BYTE), 
	"INDEX_OBJECT_NAME_REGEXP" VARCHAR2(4000 BYTE), 
	"INDEX_OWNER" VARCHAR2(128 BYTE), 
	"INDEX_NAME" VARCHAR2(128 BYTE), 
	"OBJECT_TYPE" VARCHAR2(23 BYTE), 
	"UNIQUENESS" VARCHAR2(9 BYTE), 
	"INDEX_TYPE" VARCHAR2(27 BYTE), 
	"ITYP_OWNER" VARCHAR2(128 BYTE), 
	"ITYP_NAME" VARCHAR2(128 BYTE), 
	"TABLE_BUILD_TYPE" VARCHAR2(10 BYTE), 
	"TARGET_OBJECT_NAME_REGEXP" VARCHAR2(4000 BYTE), 
	"TABLE_OWNER" VARCHAR2(128 BYTE), 
	"TABLE_NAME" VARCHAR2(128 BYTE), 
	"TABLE_TYPE" VARCHAR2(23 BYTE), 
	"ELEMENT_NAME" VARCHAR2(20 BYTE), 
	"FILE_EXT1" VARCHAR2(6 BYTE), 
	"FILE_EXT2" VARCHAR2(6 BYTE), 
	"FILE_EXT3" VARCHAR2(6 BYTE)
   ) SEGMENT CREATION IMMEDIATE  LOGGING;

--  Comments

--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_INDEX_TAB


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/OBJ_INSTALL_OBJECT_TAB.tbl
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.OBJ_INSTALL_OBJECT_TAB Table
--

set define off


--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_OBJECT_TAB

  CREATE TABLE "ODBCAPTURE"."OBJ_INSTALL_OBJECT_TAB" 
   (	"BUILD_TYPE" VARCHAR2(10 BYTE), 
	"BUILD_TIMING" CHAR(7 BYTE), 
	"OBJECT_NAME_REGEXP" VARCHAR2(4000 BYTE), 
	"OBJECT_OWNER_BUILD_TYPE" VARCHAR2(10 BYTE), 
	"OBJECT_OWNER" VARCHAR2(128 BYTE), 
	"OBJECT_BUILD_TYPE" VARCHAR2(10 BYTE), 
	"OBJECT_NAME" VARCHAR2(128 BYTE), 
	"OBJECT_TYPE" VARCHAR2(23 BYTE), 
	"ELEMENT_NAME" VARCHAR2(20 BYTE), 
	"FILE_EXT1" VARCHAR2(6 BYTE), 
	"FILE_EXT2" VARCHAR2(6 BYTE), 
	"FILE_EXT3" VARCHAR2(6 BYTE)
   ) SEGMENT CREATION IMMEDIATE  LOGGING;

--  Comments

--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_OBJECT_TAB


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/OBJ_INSTALL_SYNONYM_TAB.tbl
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.OBJ_INSTALL_SYNONYM_TAB Table
--

set define off


--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_SYNONYM_TAB

  CREATE TABLE "ODBCAPTURE"."OBJ_INSTALL_SYNONYM_TAB" 
   (	"BUILD_TYPE" VARCHAR2(10 BYTE), 
	"BUILD_TYPE_SELECTOR" VARCHAR2(20 BYTE), 
	"SYNONYM_BUILD_TYPE" VARCHAR2(10 BYTE), 
	"SYNONYM_OBJECT_NAME_REGEXP" VARCHAR2(4000 BYTE), 
	"SYNONYM_OWNER" VARCHAR2(128 BYTE), 
	"SYNONYM_NAME" VARCHAR2(128 BYTE), 
	"OBJECT_TYPE" CHAR(7 BYTE), 
	"DB_LINK" VARCHAR2(128 BYTE), 
	"TARGET_BUILD_TYPE" VARCHAR2(10 BYTE), 
	"TARGET_OBJECT_NAME_REGEXP" VARCHAR2(4000 BYTE), 
	"TARGET_OWNER" VARCHAR2(128 BYTE), 
	"TARGET_NAME" VARCHAR2(128 BYTE), 
	"TARGET_TYPE" VARCHAR2(23 BYTE), 
	"ELEMENT_NAME" VARCHAR2(20 BYTE), 
	"FILE_EXT1" VARCHAR2(6 BYTE), 
	"FILE_EXT2" VARCHAR2(6 BYTE), 
	"FILE_EXT3" VARCHAR2(6 BYTE)
   ) SEGMENT CREATION IMMEDIATE  LOGGING;

--  Comments

--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_SYNONYM_TAB


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/OBJ_INSTALL_TRIGGER_TAB.tbl
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.OBJ_INSTALL_TRIGGER_TAB Table
--

set define off


--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_TRIGGER_TAB

  CREATE TABLE "ODBCAPTURE"."OBJ_INSTALL_TRIGGER_TAB" 
   (	"BUILD_TYPE" VARCHAR2(10 BYTE), 
	"BUILD_TYPE_SELECTOR" VARCHAR2(20 BYTE), 
	"TRIGGER_BUILD_TYPE" VARCHAR2(10 BYTE), 
	"TRIGGER_OBJECT_NAME_REGEXP" VARCHAR2(4000 BYTE), 
	"TRIGGER_OWNER" VARCHAR2(128 BYTE), 
	"TRIGGER_NAME" VARCHAR2(128 BYTE), 
	"OBJECT_TYPE" VARCHAR2(23 BYTE), 
	"TARGET_BUILD_TYPE" VARCHAR2(10 BYTE), 
	"TARGET_OBJECT_NAME_REGEXP" VARCHAR2(4000 BYTE), 
	"TARGET_OWNER" VARCHAR2(128 BYTE), 
	"TARGET_NAME" VARCHAR2(128 BYTE), 
	"TARGET_TYPE" VARCHAR2(23 BYTE), 
	"ELEMENT_NAME" VARCHAR2(20 BYTE), 
	"FILE_EXT1" VARCHAR2(6 BYTE), 
	"FILE_EXT2" VARCHAR2(6 BYTE), 
	"FILE_EXT3" VARCHAR2(6 BYTE)
   ) SEGMENT CREATION IMMEDIATE  LOGGING;

--  Comments

--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_TRIGGER_TAB


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/ROLE_CONF.tbl
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.ROLE_CONF Table
--

set define off


--DBMS_METADATA:ODBCAPTURE.ROLE_CONF

  CREATE TABLE "ODBCAPTURE"."ROLE_CONF" 
   (	"ROLENAME" VARCHAR2(128 BYTE) NOT NULL ENABLE, 
	"BUILD_TYPE" VARCHAR2(10 BYTE) NOT NULL ENABLE, 
	"ORACLE_PROVIDED" VARCHAR2(1 BYTE) NOT NULL ENABLE, 
	"NOTES" VARCHAR2(1024 BYTE)
   ) SEGMENT CREATION IMMEDIATE  LOGGING;
ALTER TABLE "ODBCAPTURE"."ROLE_CONF" ADD CONSTRAINT "ROLE_CONF_PK" PRIMARY KEY ("ROLENAME", "BUILD_TYPE")
  USING INDEX  ENABLE;
ALTER TABLE "ODBCAPTURE"."ROLE_CONF" ADD CONSTRAINT "ROLE_CONF_CK1" CHECK ("ORACLE_PROVIDED" in ('Y','N')) ENABLE;

--  Comments

--DBMS_METADATA:ODBCAPTURE.ROLE_CONF

   COMMENT ON COLUMN "ODBCAPTURE"."ROLE_CONF"."ROLENAME" IS 'Name of the database role (Primary Key Column 1)';
   COMMENT ON COLUMN "ODBCAPTURE"."ROLE_CONF"."BUILD_TYPE" IS 'Build Type for this database role (Primary Key Column 2). Value must exist in BUILD_CONF table.';
   COMMENT ON COLUMN "ODBCAPTURE"."ROLE_CONF"."ORACLE_PROVIDED" IS 'Identifies a Role already provided with the database';
   COMMENT ON COLUMN "ODBCAPTURE"."ROLE_CONF"."NOTES" IS 'Free text field (Optional)';
   COMMENT ON TABLE "ODBCAPTURE"."ROLE_CONF"  IS 'List of Roles to install in each Build Type.';


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/SCHEMA_CONF.tbl
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.SCHEMA_CONF Table
--

set define off


--DBMS_METADATA:ODBCAPTURE.SCHEMA_CONF

  CREATE TABLE "ODBCAPTURE"."SCHEMA_CONF" 
   (	"USERNAME" VARCHAR2(128 BYTE) NOT NULL ENABLE, 
	"BUILD_TYPE" VARCHAR2(10 BYTE) NOT NULL ENABLE, 
	"ORACLE_PROVIDED" VARCHAR2(1 BYTE) NOT NULL ENABLE, 
	"PROFILE" VARCHAR2(128 BYTE), 
	"TEMPORARY_TSPACE" VARCHAR2(30 BYTE), 
	"DEFAULT_TSPACE" VARCHAR2(30 BYTE), 
	"TS_QUOTA" VARCHAR2(10 BYTE), 
	"NOTES" VARCHAR2(1024 BYTE)
   ) SEGMENT CREATION IMMEDIATE  LOGGING;
ALTER TABLE "ODBCAPTURE"."SCHEMA_CONF" ADD CONSTRAINT "SCHEMA_CONF_CK1" CHECK ( REGEXP_LIKE ("TS_QUOTA",'^UNLIMITED$|^[0-9]+[KMG]$')) ENABLE;
ALTER TABLE "ODBCAPTURE"."SCHEMA_CONF" ADD CONSTRAINT "SCHEMA_CONF_PK" PRIMARY KEY ("USERNAME")
  USING INDEX  ENABLE;
ALTER TABLE "ODBCAPTURE"."SCHEMA_CONF" ADD CONSTRAINT "SCHEMA_CONF_CK2" CHECK (oracle_provided in ('Y','N')) ENABLE;

--  Comments

--DBMS_METADATA:ODBCAPTURE.SCHEMA_CONF

   COMMENT ON COLUMN "ODBCAPTURE"."SCHEMA_CONF"."USERNAME" IS 'Name of the database schema (Primary Key)';
   COMMENT ON COLUMN "ODBCAPTURE"."SCHEMA_CONF"."BUILD_TYPE" IS 'Build Type for this database schema (Required). All objects for this schema are generated for this build type unless filtered by OBJECT_CONF. Value must be in BUILD_CONF table.';
   COMMENT ON COLUMN "ODBCAPTURE"."SCHEMA_CONF"."ORACLE_PROVIDED" IS 'Identifies a Schema/User already provided with the database (Required)';
   COMMENT ON COLUMN "ODBCAPTURE"."SCHEMA_CONF"."PROFILE" IS 'Profile for the User.  NULL is DEFAULT.';
   COMMENT ON COLUMN "ODBCAPTURE"."SCHEMA_CONF"."TEMPORARY_TSPACE" IS 'Name of the temporary tablespace.  NULL is TEMP';
   COMMENT ON COLUMN "ODBCAPTURE"."SCHEMA_CONF"."DEFAULT_TSPACE" IS 'Default Tablespace Name for this Schema (optional)';
   COMMENT ON COLUMN "ODBCAPTURE"."SCHEMA_CONF"."TS_QUOTA" IS 'Tablespace quota for this schema. NULL is UNLIMITED.';
   COMMENT ON COLUMN "ODBCAPTURE"."SCHEMA_CONF"."NOTES" IS 'Free text field (Optional)';
   COMMENT ON TABLE "ODBCAPTURE"."SCHEMA_CONF"  IS 'List of Schema to install in each Build Type.';


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/SCHEMA_OBJECTS_TAB.tbl
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.SCHEMA_OBJECTS_TAB Table
--

set define off


--DBMS_METADATA:ODBCAPTURE.SCHEMA_OBJECTS_TAB

  CREATE TABLE "ODBCAPTURE"."SCHEMA_OBJECTS_TAB" 
   (	"BUILD_TYPE" VARCHAR2(10 BYTE), 
	"OBJECT_OWNER" VARCHAR2(128 BYTE), 
	"ELEMENT_NAME" VARCHAR2(20 BYTE), 
	 CONSTRAINT "SCHEMA_OBJECTS_TAB_PK" PRIMARY KEY ("BUILD_TYPE", "OBJECT_OWNER", "ELEMENT_NAME") ENABLE
   ) ORGANIZATION INDEX NOCOMPRESS ;

--  Comments

--DBMS_METADATA:ODBCAPTURE.SCHEMA_OBJECTS_TAB


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/TSPACE_CONF.tbl
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.TSPACE_CONF Table
--

set define off


--DBMS_METADATA:ODBCAPTURE.TSPACE_CONF

  CREATE TABLE "ODBCAPTURE"."TSPACE_CONF" 
   (	"USERNAME" VARCHAR2(128 BYTE) NOT NULL ENABLE, 
	"TSPACE_NAME" VARCHAR2(30 BYTE) NOT NULL ENABLE, 
	"TS_QUOTA" VARCHAR2(10 BYTE)
   ) SEGMENT CREATION IMMEDIATE  LOGGING;
ALTER TABLE "ODBCAPTURE"."TSPACE_CONF" ADD CONSTRAINT "TSPACE_CONF_PK" PRIMARY KEY ("USERNAME", "TSPACE_NAME")
  USING INDEX  ENABLE;

--  Comments

--DBMS_METADATA:ODBCAPTURE.TSPACE_CONF

   COMMENT ON COLUMN "ODBCAPTURE"."TSPACE_CONF"."USERNAME" IS 'Name of the database schema (Primary Key)';
   COMMENT ON COLUMN "ODBCAPTURE"."TSPACE_CONF"."TSPACE_NAME" IS 'Name of the tablespace (Primary Key)';
   COMMENT ON COLUMN "ODBCAPTURE"."TSPACE_CONF"."TS_QUOTA" IS 'Tablespace quota for this schema and tablespace. NULL is UNLIMITED.';
   COMMENT ON TABLE "ODBCAPTURE"."TSPACE_CONF"  IS 'Additional Tablespace Quotas for Schema';


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/ZIP_FILES.tbl
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.ZIP_FILES Table
--

set define off


--DBMS_METADATA:ODBCAPTURE.ZIP_FILES

  CREATE TABLE "ODBCAPTURE"."ZIP_FILES" 
   (	"FILE_NAME" VARCHAR2(1000 BYTE), 
	"DATE_CREATED" DATE DEFAULT sysdate, 
	"FILE_SIZE" NUMBER(38,0) DEFAULT 0, 
	"FILE_BLOB" BLOB
   ) SEGMENT CREATION IMMEDIATE  LOGGING;
ALTER TABLE "ODBCAPTURE"."ZIP_FILES" ADD CONSTRAINT "ZIP_FILES_PK" PRIMARY KEY ("FILE_NAME")
  USING INDEX  ENABLE;

--  Comments

--DBMS_METADATA:ODBCAPTURE.ZIP_FILES


--  Grants


--  Synonyms


set define on

----------------------------------------
-- DATA_LOAD Install


prompt ------------------------------------------------------------
prompt NOTE: DATA LOADING for "ODBCAPTURE/BUILD_CONF.cldr" NOT IMPLEMENTED
prompt ------------------------------------------------------------


prompt ------------------------------------------------------------
prompt NOTE: DATA LOADING for "ODBCAPTURE/BUILD_PATH.cldr" NOT IMPLEMENTED
prompt ------------------------------------------------------------


prompt ------------------------------------------------------------
prompt NOTE: DATA LOADING for "ODBCAPTURE/ELEMENT_CONF.cldr" NOT IMPLEMENTED
prompt ------------------------------------------------------------


prompt ------------------------------------------------------------
prompt NOTE: DATA LOADING for "ODBCAPTURE/METADATA_TRANSFORM_PARAMS.cldr" NOT IMPLEMENTED
prompt ------------------------------------------------------------


prompt ------------------------------------------------------------
prompt NOTE: DATA LOADING for "ODBCAPTURE/ROLE_CONF.cldr" NOT IMPLEMENTED
prompt ------------------------------------------------------------


prompt ------------------------------------------------------------
prompt NOTE: DATA LOADING for "ODBCAPTURE/SCHEMA_CONF.cldr" NOT IMPLEMENTED
prompt ------------------------------------------------------------


prompt ------------------------------------------------------------
prompt NOTE: DATA LOADING for "ODBCAPTURE/TSPACE_CONF.cldr" NOT IMPLEMENTED
prompt ------------------------------------------------------------


----------------------------------------
-- INDEX Install

prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/DBA_DEPENDENCIES_TAB.tidx
prompt ------------------------------------------------------------

--
--  Create Indexes for ODBCAPTURE.DBA_DEPENDENCIES_TAB TABLE
--

set define off


--  NOTE: This is a "INDEX" Index

--DBMS_METADATA:ODBCAPTURE.DBA_DEPENDENCIES_TAB_IDX2

  CREATE INDEX "ODBCAPTURE"."DBA_DEPENDENCIES_TAB_IDX2" ON "ODBCAPTURE"."DBA_DEPENDENCIES_TAB" ("REFERENCED_OWNER", "REFERENCED_NAME", "REFERENCED_TYPE") 
  ;

--  NOTE: This is a "INDEX" Index

--DBMS_METADATA:ODBCAPTURE.DBA_DEPENDENCIES_TAB_IX1

  CREATE INDEX "ODBCAPTURE"."DBA_DEPENDENCIES_TAB_IX1" ON "ODBCAPTURE"."DBA_DEPENDENCIES_TAB" ("OBJECT_OWNER_BUILD_TYPE", "OBJECT_OWNER", "OBJECT_NAME") 
  ;

set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/DBA_OBJECTS_TAB.tidx
prompt ------------------------------------------------------------

--
--  Create Indexes for ODBCAPTURE.DBA_OBJECTS_TAB TABLE
--

set define off


--  NOTE: This is a "INDEX" Index

--DBMS_METADATA:ODBCAPTURE.DBA_OBJECTS_TAB_IX1

  CREATE INDEX "ODBCAPTURE"."DBA_OBJECTS_TAB_IX1" ON "ODBCAPTURE"."DBA_OBJECTS_TAB" ("OBJECT_OWNER_BUILD_TYPE", "OBJECT_OWNER", "OBJECT_NAME") 
  ;

set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/DBA_TAB_PRIVS_TAB.tidx
prompt ------------------------------------------------------------

--
--  Create Indexes for ODBCAPTURE.DBA_TAB_PRIVS_TAB TABLE
--

set define off


--  NOTE: This is a "INDEX" Index

--DBMS_METADATA:ODBCAPTURE.DBA_TAB_PRIVS_TAB_IX1

  CREATE INDEX "ODBCAPTURE"."DBA_TAB_PRIVS_TAB_IX1" ON "ODBCAPTURE"."DBA_TAB_PRIVS_TAB" ("OBJECT_OWNER_BUILD_TYPE", "OBJECT_OWNER", "OBJECT_NAME") 
  ;

set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/OBJ_INSTALL_COMMENTS_TAB.tidx
prompt ------------------------------------------------------------

--
--  Create Indexes for ODBCAPTURE.OBJ_INSTALL_COMMENTS_TAB TABLE
--

set define off


--  NOTE: This is a "INDEX" Index

--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_COMMENTS_TAB_IX1

  CREATE INDEX "ODBCAPTURE"."OBJ_INSTALL_COMMENTS_TAB_IX1" ON "ODBCAPTURE"."OBJ_INSTALL_COMMENTS_TAB" ("BUILD_TYPE", "TABLE_OWNER", "TABLE_NAME") 
  ;

set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/OBJ_INSTALL_CONTEXT_TAB.tidx
prompt ------------------------------------------------------------

--
--  Create Indexes for ODBCAPTURE.OBJ_INSTALL_CONTEXT_TAB TABLE
--

set define off


--  NOTE: This is a "INDEX" Index

--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_CONTEXT_TAB_IX1

  CREATE INDEX "ODBCAPTURE"."OBJ_INSTALL_CONTEXT_TAB_IX1" ON "ODBCAPTURE"."OBJ_INSTALL_CONTEXT_TAB" ("BUILD_TYPE", "CONTEXT_OWNER", "CONTEXT_NAME") 
  ;

set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/OBJ_INSTALL_DATA_LOAD_TAB.tidx
prompt ------------------------------------------------------------

--
--  Create Indexes for ODBCAPTURE.OBJ_INSTALL_DATA_LOAD_TAB TABLE
--

set define off


--  NOTE: This is a "INDEX" Index

--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_DATA_LOAD_TAB_IX1

  CREATE INDEX "ODBCAPTURE"."OBJ_INSTALL_DATA_LOAD_TAB_IX1" ON "ODBCAPTURE"."OBJ_INSTALL_DATA_LOAD_TAB" ("BUILD_TYPE", "TABLE_OWNER", "TABLE_NAME") 
  ;

set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/OBJ_INSTALL_FKEY_TAB.tidx
prompt ------------------------------------------------------------

--
--  Create Indexes for ODBCAPTURE.OBJ_INSTALL_FKEY_TAB TABLE
--

set define off


--  NOTE: This is a "INDEX" Index

--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_FKEY_TAB_IX1

  CREATE INDEX "ODBCAPTURE"."OBJ_INSTALL_FKEY_TAB_IX1" ON "ODBCAPTURE"."OBJ_INSTALL_FKEY_TAB" ("BUILD_TYPE", "BASE_TABLE_OWNER", "FOREIGN_KEY_NAME") 
  ;

set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/OBJ_INSTALL_INDEX_TAB.tidx
prompt ------------------------------------------------------------

--
--  Create Indexes for ODBCAPTURE.OBJ_INSTALL_INDEX_TAB TABLE
--

set define off


--  NOTE: This is a "INDEX" Index

--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_INDEX_TAB_IX1

  CREATE INDEX "ODBCAPTURE"."OBJ_INSTALL_INDEX_TAB_IX1" ON "ODBCAPTURE"."OBJ_INSTALL_INDEX_TAB" ("BUILD_TYPE", "TABLE_OWNER", "TABLE_NAME") 
  ;

set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/OBJ_INSTALL_OBJECT_TAB.tidx
prompt ------------------------------------------------------------

--
--  Create Indexes for ODBCAPTURE.OBJ_INSTALL_OBJECT_TAB TABLE
--

set define off


--  NOTE: This is a "INDEX" Index

--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_OBJECT_TAB_IX1

  CREATE INDEX "ODBCAPTURE"."OBJ_INSTALL_OBJECT_TAB_IX1" ON "ODBCAPTURE"."OBJ_INSTALL_OBJECT_TAB" ("BUILD_TYPE", "OBJECT_OWNER", "OBJECT_NAME") 
  ;

set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/OBJ_INSTALL_SYNONYM_TAB.tidx
prompt ------------------------------------------------------------

--
--  Create Indexes for ODBCAPTURE.OBJ_INSTALL_SYNONYM_TAB TABLE
--

set define off


--  NOTE: This is a "INDEX" Index

--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_SYNONYM_TAB_IX1

  CREATE INDEX "ODBCAPTURE"."OBJ_INSTALL_SYNONYM_TAB_IX1" ON "ODBCAPTURE"."OBJ_INSTALL_SYNONYM_TAB" ("BUILD_TYPE", "SYNONYM_OWNER", "SYNONYM_NAME") 
  ;

--  NOTE: This is a "INDEX" Index

--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_SYNONYM_TAB_IX2

  CREATE INDEX "ODBCAPTURE"."OBJ_INSTALL_SYNONYM_TAB_IX2" ON "ODBCAPTURE"."OBJ_INSTALL_SYNONYM_TAB" ("BUILD_TYPE", "TARGET_OWNER", "TARGET_NAME") 
  ;

set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/OBJ_INSTALL_TRIGGER_TAB.tidx
prompt ------------------------------------------------------------

--
--  Create Indexes for ODBCAPTURE.OBJ_INSTALL_TRIGGER_TAB TABLE
--

set define off


--  NOTE: This is a "INDEX" Index

--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_TRIGGER_TAB_IX1

  CREATE INDEX "ODBCAPTURE"."OBJ_INSTALL_TRIGGER_TAB_IX1" ON "ODBCAPTURE"."OBJ_INSTALL_TRIGGER_TAB" ("BUILD_TYPE", "TRIGGER_OWNER", "TRIGGER_NAME") 
  ;

--  NOTE: This is a "INDEX" Index

--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_TRIGGER_TAB_IX2

  CREATE INDEX "ODBCAPTURE"."OBJ_INSTALL_TRIGGER_TAB_IX2" ON "ODBCAPTURE"."OBJ_INSTALL_TRIGGER_TAB" ("BUILD_TYPE", "TARGET_OWNER", "TARGET_NAME") 
  ;

set define on

----------------------------------------
-- VIEW Install

prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/AQ_SYSTEM_PRIVS_VW.vw
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.AQ_SYSTEM_PRIVS_VW view
--

set define off


--
--  Cannot grant permisions on a view with an error
--  https://asktom.oracle.com/pls/apex/f?p=100:11:0::::P11_QUESTION_ID:43253832697675#2653213300346351987
create view "ODBCAPTURE"."AQ_SYSTEM_PRIVS_VW"
  as   select * from TEMP_PUBLICLY_UPDATEABLE_TABLE;

--  Grants



--DBMS_METADATA:ODBCAPTURE.AQ_SYSTEM_PRIVS_VW

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ODBCAPTURE"."AQ_SYSTEM_PRIVS_VW" ("GRANTEE", "PRIVILEGE", "DBMS_AQ_PRIV", "ADMIN_OPTION", "COMMON", "INHERITED") AS 
  select grantee
      ,privilege
      ,case privilege
       when 'ENQUEUE ANY QUEUE' then 'ENQUEUE_ANY'
       when 'DEQUEUE ANY QUEUE' then 'DEQUEUE_ANY'
       when 'MANAGE ANY QUEUE'  then 'MANAGE_ANY'
       else 'ERROR: Unknown Privilege ' || privilege
       end                             DBMS_AQ_PRIV
      ,admin_option
      ,common
      ,inherited
 from  dba_sys_privs
 where privilege like '% ANY QUEUE';

--  Comments

--DBMS_METADATA:ODBCAPTURE.AQ_SYSTEM_PRIVS_VW


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/BUILD_PATH_REVIEW.vw
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.BUILD_PATH_REVIEW view
--

set define off


--
--  Cannot grant permisions on a view with an error
--  https://asktom.oracle.com/pls/apex/f?p=100:11:0::::P11_QUESTION_ID:43253832697675#2653213300346351987
create view "ODBCAPTURE"."BUILD_PATH_REVIEW"
  as   select * from TEMP_PUBLICLY_UPDATEABLE_TABLE;

--  Grants



--DBMS_METADATA:ODBCAPTURE.BUILD_PATH_REVIEW

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ODBCAPTURE"."BUILD_PATH_REVIEW" ("PARENT_BUILD_SEQ", "PARENT_BUILD_TYPE", "PARENT_NOTES", "BUILD_SEQ", "BUILD_TYPE", "NOTES") AS 
  select m.parent_build_seq
      ,p.build_type          parent_build_type
      ,p.notes               parent_notes
      ,m.build_seq
      ,t.build_type
      ,t.notes
 from  build_path  m
       join build_conf  p
            on  p.build_seq = m.parent_build_seq
       join build_conf  t
            on  t.build_seq = m.build_seq
UNION ALL
select NULL                  parent_build_seq
      ,NULL                  parent_build_type
      ,NULL                  parent_notes
      ,t.build_seq
      ,t.build_type
      ,t.notes
 from  build_conf  t
 where t.build_seq not in (
       select m.build_seq from build_path m)
 order by parent_build_seq nulls first, build_seq;

--  Comments

--DBMS_METADATA:ODBCAPTURE.BUILD_PATH_REVIEW


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/DBA_DEPENDENCIES_VIEW.vw
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.DBA_DEPENDENCIES_VIEW view
--

set define off


--
--  Cannot grant permisions on a view with an error
--  https://asktom.oracle.com/pls/apex/f?p=100:11:0::::P11_QUESTION_ID:43253832697675#2653213300346351987
create view "ODBCAPTURE"."DBA_DEPENDENCIES_VIEW"
  as   select * from TEMP_PUBLICLY_UPDATEABLE_TABLE;

--  Grants



--DBMS_METADATA:ODBCAPTURE.DBA_DEPENDENCIES_VIEW

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ODBCAPTURE"."DBA_DEPENDENCIES_VIEW" ("OBJECT_OWNER_BUILD_TYPE", "OBJECT_OWNER", "OBJECT_NAME", "OBJECT_TYPE", "REFERENCED_OWNER", "REF_OWNER_BUILD_TYPE", "REFERENCED_NAME", "REFERENCED_TYPE", "REFERENCED_LINK_NAME", "DEPENDENCY_TYPE") AS 
  select scd.build_type                   OBJECT_OWNER_BUILD_TYPE
      ,dep.owner                          OBJECT_OWNER
      ,dep.name                           OBJECT_NAME
      ,dep.type                           OBJECT_TYPE
      ,dep.referenced_owner
      ,scr.build_type                     REF_OWNER_BUILD_TYPE
      ,dep.referenced_name
      ,dep.referenced_type
      ,dep.referenced_link_name
      ,dep.dependency_type
 from  schema_conf  scd
       join dba_dependencies  dep
            on  dep.owner = scd.username
       join schema_conf  scr
            on  scr.username = dep.referenced_owner
       -- Exclude Oracle Provided Object Owners
 where scd.oracle_provided = 'N';

--  Comments

--DBMS_METADATA:ODBCAPTURE.DBA_DEPENDENCIES_VIEW


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/DBA_OBJECTS_VIEW.vw
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.DBA_OBJECTS_VIEW view
--

set define off


--
--  Cannot grant permisions on a view with an error
--  https://asktom.oracle.com/pls/apex/f?p=100:11:0::::P11_QUESTION_ID:43253832697675#2653213300346351987
create view "ODBCAPTURE"."DBA_OBJECTS_VIEW"
  as   select * from TEMP_PUBLICLY_UPDATEABLE_TABLE;

--  Grants



--DBMS_METADATA:ODBCAPTURE.DBA_OBJECTS_VIEW

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ODBCAPTURE"."DBA_OBJECTS_VIEW" ("OBJECT_OWNER_BUILD_TYPE", "OBJECT_OWNER", "OBJECT_NAME", "OBJECT_TYPE", "TABLE_FLAG", "SELTYPE") AS 
  select sc.build_type           OBJECT_OWNER_BUILD_TYPE
      ,obj.owner                 OBJECT_OWNER
      ,obj.object_name
      ,obj.object_type
      ,case when tab.table_name is not null then 'TAB'
            when xml.table_name is not null then 'XML'
            when  nt.table_name is not null then  'NT'
                                            else NULL
       end                       TABLE_FLAG
      ,'BASE'                    SELTYPE
 from  schema_conf  sc
       join dba_objects  obj
            on  obj.owner = sc.username
  left join dba_tables  tab
            on  tab.owner       = obj.owner
            and tab.table_name  = obj.object_name
            and obj.object_type = 'TABLE'
  left join dba_xml_tables  xml
            on  xml.owner       = obj.owner
            and xml.table_name  = obj.object_name
            and obj.object_type = 'TABLE'
  left join dba_nested_tables  nt
            on  nt.owner        = obj.owner
            and nt.table_name   = obj.object_name
            and obj.object_type = 'TABLE'
 where sc.oracle_provided = 'N'      -- Exclude Oracle Provided Object Owner
 group by obj.owner
      ,sc.build_type
      ,obj.object_name
      ,obj.object_type
      ,case when tab.table_name is not null then 'TAB'
            when xml.table_name is not null then 'XML'
            when  nt.table_name is not null then  'NT'
                                            else NULL
       end
UNION ALL
select sco.build_type            OBJECT_OWNER_BUILD_TYPE
      ,syn.owner                 OBJECT_OWNER
      ,syn.synonym_name          OBJECT_NAME
      ,'SYNONYM'                 OBJECT_TYPE
      ,NULL                      TABLE_FLAG
      ,'PUB'                     SELTYPE
 from  schema_conf  sco
       join dba_synonyms  syn
            on  syn.owner = sco.username
       join schema_conf  sct
            on  sct.username        = syn.table_owner
            and sct.oracle_provided = 'N'   -- Exclude Oracle Provided Synonym Owner
 where sco.build_type = 'pub'     -- Public Synonyms
UNION ALL
select sco.build_type            OBJECT_OWNER_BUILD_TYPE
      ,priv.owner                OBJECT_OWNER
      ,priv.table_name           OBJECT_NAME
      ,priv.type                 OBJECT_TYPE
      ,case when tab.table_name is not null then 'TAB'
            when xml.table_name is not null then 'XML'
            when  nt.table_name is not null then  'NT'
                                            else NULL
       end                       TABLE_FLAG
      ,'SYS'                     SELTYPE
 from  schema_conf  sco
       join dba_tab_privs  priv
            on  priv.owner      = sco.username
       join schema_conf  sct
            on  sct.username        = priv.grantee
            and sct.oracle_provided = 'N'   -- Exclude Oracle Provided Grantee
  left join dba_tables  tab
            on  tab.owner      = priv.owner
            and tab.table_name = priv.table_name
            and priv.type      = 'TABLE'
  left join dba_xml_tables  xml
            on  xml.owner      = priv.owner
            and xml.table_name = priv.table_name
            and priv.type      = 'TABLE'
  left join dba_nested_tables  nt
            on  nt.owner      = priv.owner
            and nt.table_name = priv.table_name
            and priv.type     = 'TABLE'
 where sco.oracle_provided = 'Y'          -- ONLY Oracle Provided Object Owners
 group by priv.owner
      ,sco.build_type
      ,priv.table_name
      ,priv.type
      ,case when tab.table_name is not null then 'TAB'
            when xml.table_name is not null then 'XML'
            when  nt.table_name is not null then  'NT'
                                            else NULL
       end;

--  Comments

--DBMS_METADATA:ODBCAPTURE.DBA_OBJECTS_VIEW


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/DBA_TAB_PRIVS_VIEW.vw
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.DBA_TAB_PRIVS_VIEW view
--

set define off


--
--  Cannot grant permisions on a view with an error
--  https://asktom.oracle.com/pls/apex/f?p=100:11:0::::P11_QUESTION_ID:43253832697675#2653213300346351987
create view "ODBCAPTURE"."DBA_TAB_PRIVS_VIEW"
  as   select * from TEMP_PUBLICLY_UPDATEABLE_TABLE;

--  Grants



--DBMS_METADATA:ODBCAPTURE.DBA_TAB_PRIVS_VIEW

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ODBCAPTURE"."DBA_TAB_PRIVS_VIEW" ("OBJECT_OWNER_BUILD_TYPE", "OBJECT_OWNER", "OBJECT_TYPE", "OBJECT_NAME", "PRIVILEGE", "GRANTEE", "GRANTEE_UOR_TYPE", "GRANTEE_BUILD_TYPE", "GRANTABLE", "HIERARCHY", "COMMON", "INHERITED") AS 
  select obj.object_owner_build_type
      ,priv.owner                       OBJECT_OWNER
      ,priv.type                        OBJECT_TYPE
      ,priv.table_name                  OBJECT_NAME
      ,priv.privilege
      ,priv.grantee
      ,gsl.uor_type                     GRANTEE_UOR_TYPE
      ,gsl.build_type                   GRANTEE_BUILD_TYPE
      ,priv.grantable
      ,priv.hierarchy
      ,priv.common
      ,priv.inherited
 from  dba_objects_tab  obj
       join dba_tab_privs  priv
            on  priv.owner      = obj.object_owner
            and priv.table_name = obj.object_name
       join uor_install_view  gsl
            on  gsl.user_or_role = priv.grantee
       join schema_conf  own
            on  own.username = priv.owner
 where (   gsl.oracle_provided = 'N'             -- Not Oracle Provided Grantee
        OR (    gsl.build_type      = 'pub'      -- Grants to 'pub'
            and own.oracle_provided = 'N' )      -- But not owned by Oracle Provided
        OR (    gsl.build_type = 'pub'           -- Grants to 'pub'
            and priv.type      = 'DIRECTORY')    -- Directories are owned by 'SYS'
       );

--  Comments

--DBMS_METADATA:ODBCAPTURE.DBA_TAB_PRIVS_VIEW


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/OBJ_INSTALL_COMMENTS_VIEW.vw
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.OBJ_INSTALL_COMMENTS_VIEW view
--

set define off


--
--  Cannot grant permisions on a view with an error
--  https://asktom.oracle.com/pls/apex/f?p=100:11:0::::P11_QUESTION_ID:43253832697675#2653213300346351987
create view "ODBCAPTURE"."OBJ_INSTALL_COMMENTS_VIEW"
  as   select * from TEMP_PUBLICLY_UPDATEABLE_TABLE;

--  Grants



--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_COMMENTS_VIEW

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ODBCAPTURE"."OBJ_INSTALL_COMMENTS_VIEW" ("BUILD_TYPE", "OBJECT_OWNER_BUILD_TYPE", "TABLE_OWNER", "TABLE_BUILD_TYPE", "TABLE_NAME", "TABLE_TYPE", "ELEMENT_NAME", "COLUMN_NAME", "COMMENTS") AS 
  select d.build_type
      ,d.object_owner_build_type
      ,c.owner                          TABLE_OWNER
      ,d.object_build_type              TABLE_BUILD_TYPE
      ,c.table_name
      ,d.object_type                    TABLE_TYPE
      ,d.element_name
      ,c.column_name
      ,c.comments
 from  obj_install_object_tab  d
       join schema_conf  o
            on  o.username = d.object_owner
            -- Don't need comments on Oracle Provided Object Owners
            and o.oracle_provided = 'N'
       join dba_col_comments  c
            on  c.owner       = d.object_owner
            and c.table_name  = d.object_name
            and c.comments is not null
 where d.object_type in ('TABLE','VIEW','MATERIALIZED VIEW')
UNION ALL
select d.build_type
      ,d.object_owner_build_type
      ,c.owner                          TABLE_OWNER
      ,d.object_build_type              TABLE_BUILD_TYPE
      ,c.table_name
      ,c.table_type
      ,d.element_name
      ,NULL                             COLUMN_NAME
      ,c.comments
 from  obj_install_object_tab  d
       join schema_conf  o
            on  o.username = d.object_owner
            -- Don't need comments on Oracle Provided Object Owners
            and o.oracle_provided = 'N'
       join dba_tab_comments  c
            on  c.owner       = d.object_owner
            and c.table_name  = d.object_name
            and c.table_type  = d.object_type
            and c.comments is not null;

--  Comments

--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_COMMENTS_VIEW


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/OBJ_INSTALL_CONTEXT_VIEW.vw
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.OBJ_INSTALL_CONTEXT_VIEW view
--

set define off


--
--  Cannot grant permisions on a view with an error
--  https://asktom.oracle.com/pls/apex/f?p=100:11:0::::P11_QUESTION_ID:43253832697675#2653213300346351987
create view "ODBCAPTURE"."OBJ_INSTALL_CONTEXT_VIEW"
  as   select * from TEMP_PUBLICLY_UPDATEABLE_TABLE;

--  Grants



--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_CONTEXT_VIEW

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ODBCAPTURE"."OBJ_INSTALL_CONTEXT_VIEW" ("BUILD_TYPE", "BUILD_TIMING", "CONTEXT_BUILD_TYPE", "CONTEXT_OBJECT_NAME_REGEXP", "CONTEXT_OWNER", "CONTEXT_NAME", "CONTEXT_TYPE", "PACKAGE_BUILD_TYPE", "PACKAGE_OBJECT_NAME_REGEXP", "PACKAGE_OWNER", "PACKAGE_NAME", "PACKAGE_TYPE", "ELEMENT_NAME", "FILE_EXT1", "FILE_EXT2", "FILE_EXT3") AS 
  select obj.build_type
      ,t.build_timing
      ,obj.build_type                 CONTEXT_BUILD_TYPE
      ,obj.object_name_regexp         CONTEXT_OBJECT_NAME_REGEXP
      ,obj.object_owner               CONTEXT_OWNER
      ,ctx.namespace                  CONTEXT_NAME
      ,ctx.type                       CONTEXT_TYPE
      ,pkg.build_type                 PACKAGE_BUILD_TYPE
      ,pkg.object_name_regexp         PACKAGE_OBJECT_NAME_REGEXP
      ,pkg.object_owner               PACKAGE_OWNER
      ,pkg.object_name                PACKAGE_NAME
      ,pkg.object_type                PACKAGE_TYPE
      ,obj.element_name
      ,obj.file_ext1
      ,obj.file_ext2
      ,obj.file_ext3
 from  obj_install_object_tab  obj
       join dba_context  ctx
            on  ctx.namespace = obj.object_name
       join obj_install_object_tab  pkg
            on  pkg.object_owner  = ctx.schema
            and pkg.object_name   = ctx.package
            and pkg.object_type   = 'PACKAGE'
       join build_type_timing  t
            -- Ensure the package is installed before this Context
            on  t.from_build_type = obj.build_type
            and t.to_build_type   = pkg.build_type
 where obj.object_owner = 'SYS'
  and  obj.object_type  = 'CONTEXT'
  and  ctx.namespace not like common_util.get_RECYCLE_BIN_PATTERN escape '\';

--  Comments

--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_CONTEXT_VIEW


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/OBJ_INSTALL_DATA_LOAD_VIEW.vw
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.OBJ_INSTALL_DATA_LOAD_VIEW view
--

set define off


--
--  Cannot grant permisions on a view with an error
--  https://asktom.oracle.com/pls/apex/f?p=100:11:0::::P11_QUESTION_ID:43253832697675#2653213300346351987
create view "ODBCAPTURE"."OBJ_INSTALL_DATA_LOAD_VIEW"
  as   select * from TEMP_PUBLICLY_UPDATEABLE_TABLE;

--  Grants



--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_DATA_LOAD_VIEW

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ODBCAPTURE"."OBJ_INSTALL_DATA_LOAD_VIEW" ("BUILD_TYPE", "BUILD_TIMING", "TABLE_BUILD_TYPE", "TABLE_BUILD_TIMING", "TABLE_OWNER", "TABLE_NAME", "TABLE_TYPE", "BEFORE_SELECT_SQL", "COLUMNS_REMOVED", "WHERE_CLAUSE", "ORDER_BY_COLUMNS", "AFTER_ORDER_BY_SQL", "NOTES", "ELEMENT_NAME", "FILE_EXT1", "FILE_EXT2", "FILE_EXT3") AS 
  select dlc.build_type
      ,t.build_timing
      ,tab.build_type                 TABLE_BUILD_TYPE
      ,tab.build_timing               TABLE_BUILD_TIMING
      ,tab.object_owner               TABLE_OWNER
      ,tab.object_name                TABLE_NAME
      ,tab.object_type                TABLE_TYPE
      ,dlc.before_select_sql
      ,dlc.columns_removed
      ,dlc.where_clause
      ,dlc.order_by_columns
      ,dlc.after_order_by_sql
      ,dlc.notes
      ,ec.element_name
      ,ec.file_ext1
      ,ec.file_ext2
      ,ec.file_ext3
 from  obj_install_object_tab  tab
       join dload_conf  dlc
            on  dlc.username   = tab.object_owner
            and dlc.table_name = tab.object_name
       join element_conf  ec
            on  ec.element_name = 'DATA_LOAD'
       join build_type_timing  t
            -- Ensure the Table is installed before this Data Load
            on  t.from_build_type = dlc.build_type
            and t.to_build_type   = tab.build_type;

--  Comments

--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_DATA_LOAD_VIEW


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/OBJ_INSTALL_FKEY_VIEW.vw
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.OBJ_INSTALL_FKEY_VIEW view
--

set define off


--
--  Cannot grant permisions on a view with an error
--  https://asktom.oracle.com/pls/apex/f?p=100:11:0::::P11_QUESTION_ID:43253832697675#2653213300346351987
create view "ODBCAPTURE"."OBJ_INSTALL_FKEY_VIEW"
  as   select * from TEMP_PUBLICLY_UPDATEABLE_TABLE;

--  Grants



--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_FKEY_VIEW

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ODBCAPTURE"."OBJ_INSTALL_FKEY_VIEW" ("BUILD_TYPE", "BUILD_TYPE_SELECTOR", "BASE_TABLE_BUILD_TYPE", "BASE_TABLE_OBJECT_NAME_REGEXP", "BASE_TABLE_OWNER", "BASE_TABLE_NAME", "BASE_TABLE_TYPE", "FOREIGN_KEY_NAME", "UNIQUE_KEY_NAME", "UNIQUE_KEY_TYPE", "REF_TABLE_BUILD_TYPE", "REF_TABLE_OBJECT_NAME_REGEXP", "REF_TABLE_OWNER", "REF_TABLE_NAME", "REF_TABLE_TYPE", "ELEMENT_NAME", "FILE_EXT1", "FILE_EXT2", "FILE_EXT3") AS 
  select case t.build_timing
            when 'CURRENT'
            then base_t.build_type
            else ref_t.build_type
      end                              BUILD_TYPE
      ,case t.build_timing
            when 'CURRENT'
            then 'BASE TABLE'
            else 'REF TABLE'
      end                              BUILD_TYPE_SELECTOR
      ,base_t.build_type               BASE_TABLE_BUILD_TYPE
      ,base_t.object_name_regexp       BASE_TABLE_OBJECT_NAME_REGEXP
      ,base_t.object_owner             BASE_TABLE_OWNER
      ,base_t.object_name              BASE_TABLE_NAME
      ,base_t.object_type              BASE_TABLE_TYPE
      ,fk.constraint_name              FOREIGN_KEY_NAME
      ,pk.constraint_name              UNIQUE_KEY_NAME
      ,pk.constraint_type              UNIQUE_KEY_TYPE
      ,ref_t.build_type                REF_TABLE_BUILD_TYPE
      ,ref_t.object_name_regexp        REF_TABLE_OBJECT_NAME_REGEXP
      ,ref_t.object_owner              REF_TABLE_OWNER
      ,ref_t.object_name               REF_TABLE_NAME
      ,ref_t.object_type               REF_TABLE_TYPE
      ,ec.element_name
      ,ec.file_ext1
      ,ec.file_ext2
      ,ec.file_ext3
 from  obj_install_object_tab  base_t
       join schema_conf  own
            on  own.username        = base_t.object_owner
            and own.oracle_provided = 'N'    -- Exclude base tables owned by Oracle Provided
       join element_conf  ec
            on  ec.element_name = case when base_t.object_type = 'MATERIALIZED VIEW'
                                       then 'MVIEW_FOREIGN_KEY'
                                       else base_t.object_type || '_FOREIGN_KEY'
                                  end
       join dba_constraints  fk
            on  fk.owner           = base_t.object_owner
            and fk.table_name      = base_t.object_name
            and fk.constraint_type = 'R'
            and fk.constraint_name not like common_util.get_RECYCLE_BIN_PATTERN escape '\'
       join dba_constraints  pk
            on  pk.owner           = fk.r_owner
            and pk.constraint_name = fk.r_constraint_name
            and pk.constraint_type in ('P','U')
       join obj_install_object_tab  ref_t
            on  ref_t.object_owner  = pk.owner
            and ref_t.object_name   = pk.table_name
            and ref_t.object_type  in ('MATERIALIZED VIEW', 'TABLE', 'VIEW')
       join build_type_timing  t
            -- Ensure the Ref Table is installed before this Foreign Key
            on  t.from_build_type = base_t.build_type
            and t.to_build_type   = ref_t.build_type
 where base_t.object_type  in ('MATERIALIZED VIEW', 'TABLE', 'VIEW');

--  Comments

--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_FKEY_VIEW


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/OBJ_INSTALL_INDEX_VIEW.vw
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.OBJ_INSTALL_INDEX_VIEW view
--

set define off


--
--  Cannot grant permisions on a view with an error
--  https://asktom.oracle.com/pls/apex/f?p=100:11:0::::P11_QUESTION_ID:43253832697675#2653213300346351987
create view "ODBCAPTURE"."OBJ_INSTALL_INDEX_VIEW"
  as   select * from TEMP_PUBLICLY_UPDATEABLE_TABLE;

--  Grants



--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_INDEX_VIEW

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ODBCAPTURE"."OBJ_INSTALL_INDEX_VIEW" ("BUILD_TYPE", "BUILD_TYPE_SELECTOR", "INDEX_BUILD_TYPE", "INDEX_OBJECT_NAME_REGEXP", "INDEX_OWNER", "INDEX_NAME", "OBJECT_TYPE", "UNIQUENESS", "INDEX_TYPE", "ITYP_OWNER", "ITYP_NAME", "TABLE_BUILD_TYPE", "TARGET_OBJECT_NAME_REGEXP", "TABLE_OWNER", "TABLE_NAME", "TABLE_TYPE", "ELEMENT_NAME", "FILE_EXT1", "FILE_EXT2", "FILE_EXT3") AS 
  select case t.build_timing
            when 'CURRENT'
            then obj.build_type
            else tgt.build_type
      end                          BUILD_TYPE
      ,case t.build_timing
            when 'CURRENT'
            then 'INDEX'
            else 'TARGET'
      end                          BUILD_TYPE_SELECTOR
      ,obj.build_type              INDEX_BUILD_TYPE
      ,obj.object_name_regexp      INDEX_OBJECT_NAME_REGEXP
      ,obj.object_owner            INDEX_OWNER
      ,obj.object_name             INDEX_NAME
      ,obj.object_type
      ,ind.uniqueness
      ,ind.index_type
      ,ind.ityp_owner
      ,ind.ityp_name
      ,tgt.build_type              TABLE_BUILD_TYPE
      ,tgt.object_name_regexp      TARGET_OBJECT_NAME_REGEXP
      ,tgt.object_owner            TABLE_OWNER
      ,tgt.object_name             TABLE_NAME
      ,tgt.object_type             TABLE_TYPE
      ,obj.element_name
      ,obj.file_ext1
      ,obj.file_ext2
      ,obj.file_ext3
 from  obj_install_object_tab  obj
       join schema_conf  own
            on  own.username        = obj.object_owner
            and own.oracle_provided = 'N'    -- Exclude Oracle Provided Index Schemas
       join dba_indexes  ind
            on  ind.owner      = obj.object_owner
            and ind.index_name = obj.object_name
            and ind.index_name not like common_util.get_RECYCLE_BIN_PATTERN escape '\'
       join obj_install_object_tab  tgt
            on  tgt.object_owner = ind.table_owner
            and tgt.object_name  = ind.table_name
            and tgt.object_type  = ind.table_type
       join build_type_timing  t
            -- Ensure Target Table is installed before this Index
            on  t.from_build_type = obj.build_type
            and t.to_build_type   = tgt.build_type
 where obj.object_type = 'INDEX';

--  Comments

--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_INDEX_VIEW


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/OBJ_INSTALL_OBJECT_VIEW.vw
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.OBJ_INSTALL_OBJECT_VIEW view
--

set define off


--
--  Cannot grant permisions on a view with an error
--  https://asktom.oracle.com/pls/apex/f?p=100:11:0::::P11_QUESTION_ID:43253832697675#2653213300346351987
create view "ODBCAPTURE"."OBJ_INSTALL_OBJECT_VIEW"
  as   select * from TEMP_PUBLICLY_UPDATEABLE_TABLE;

--  Grants



--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_OBJECT_VIEW

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ODBCAPTURE"."OBJ_INSTALL_OBJECT_VIEW" ("BUILD_TYPE", "BUILD_TIMING", "OBJECT_NAME_REGEXP", "OBJECT_OWNER_BUILD_TYPE", "OBJECT_OWNER", "OBJECT_BUILD_TYPE", "OBJECT_NAME", "OBJECT_TYPE", "ELEMENT_NAME", "FILE_EXT1", "FILE_EXT2", "FILE_EXT3") AS 
  with q_nondflt as (
  select oc.build_type
      ,t.build_timing
      ,oc.object_name_regexp
      ,obj.object_owner_build_type
      ,obj.object_owner
      ,oc.build_type               OBJECT_BUILD_TYPE
      ,obj.object_name
      ,obj.object_type
      ,ec.element_name
      ,ec.file_ext1
      ,ec.file_ext2
      ,ec.file_ext3
 from  dba_objects_tab  obj
       join element_conf  ec
            on  ec.object_type = obj.object_type
            and (   ec.object_type != 'INDEX'
                 or ec.element_name  = (select case ind.table_type
                                               when 'MATERIALIZED VIEW' then 'MVIEW'
                                                                        else ind.table_type
                                               end      || '_INDEX'
                                         from  dba_indexes  ind
                                         where ind.owner = obj.object_owner
                                          and  ind.index_name = obj.object_name) )
            and (   ec.object_type != 'TRIGGER'
                 or ec.element_name  = (select case trg.base_object_type
                                               when 'MATERIALIZED VIEW' then 'MVIEW'
                                                                        else trg.base_object_type
                                               end      || '_TRIGGER'
                                         from  dba_triggers  trg
                                         where trg.owner = obj.object_owner
                                          and  trg.trigger_name = obj.object_name) )
       join object_conf  oc
            on  oc.username     = obj.object_owner
            and oc.build_type  != obj.object_owner_build_type
            and oc.element_name = ec.element_name
            and regexp_like(obj.object_name, oc.object_name_regexp)
       join build_type_timing  t
            -- Ensure the owner is installed before this object
            on  t.from_build_type = oc.build_type
            and t.to_build_type   = obj.object_owner_build_type
 where (   obj.table_flag != 'NT'    -- Nested Tables masquarade as tables in DBA_OBJECTS
        OR obj.table_flag is NULL)
  and  obj.object_name not like common_util.get_RECYCLE_BIN_PATTERN escape '\'
), q_dflt as (
  select obj.object_owner_build_type BUILD_TYPE
      ,'CURRENT'                     BUILD_TIMING
      ,NULL                          OBJECT_NAME_REGEXP
      ,obj.object_owner_build_type
      ,obj.object_owner
      ,obj.object_owner_build_type   OBJECT_BUILD_TYPE
      ,obj.object_name
      ,obj.object_type
      ,ec.element_name
      ,ec.file_ext1
      ,ec.file_ext2
      ,ec.file_ext3
 from  dba_objects_tab  obj
       join element_conf  ec
            on  ec.object_type = obj.object_type
            and (   ec.object_type != 'INDEX'
                 or ec.element_name  = (select case ind.table_type
                                               when 'MATERIALIZED VIEW' then 'MVIEW'
                                                                        else ind.table_type
                                               end      || '_INDEX'
                                         from  dba_indexes  ind
                                         where ind.owner = obj.object_owner
                                          and  ind.index_name = obj.object_name) )
            and (   ec.object_type  != 'TRIGGER'
                 or ec.element_name  = (select case trg.base_object_type
                                              when 'MATERIALIZED VIEW' then 'MVIEW'
                                                                       else trg.base_object_type
                                              end      || '_TRIGGER'
                                        from  dba_triggers  trg
                                        where trg.owner = obj.object_owner
                                         and  trg.trigger_name = obj.object_name) )
 where (   obj.table_flag != 'NT'    -- Nested Tables masquarade as tables in DBA_OBJECTS
        OR obj.table_flag is NULL)
  and  (obj.object_owner, obj.object_type, obj.object_name) not in (
        select q_nondflt.object_owner, q_nondflt.object_type, q_nondflt.object_name from q_nondflt)
  and  obj.object_name not like common_util.get_RECYCLE_BIN_PATTERN escape '\'
), q_sys as (
  select oc.build_type
      ,'CURRENT'                     BUILD_TIMING
      ,oc.object_name_regexp
      ,oc.build_type                 OBJECT_OWNER_BUILD_TYPE
      ,obj.object_owner
      ,oc.build_type                 OBJECT_BUILD_TYPE
      ,obj.object_name
      ,obj.object_type
      ,ec.element_name
      ,ec.file_ext1
      ,ec.file_ext2
      ,ec.file_ext3
 from  dba_objects_tab  obj
       join element_conf  ec
            on  ec.object_type = obj.object_type
       join object_conf  oc
            on  oc.username     = obj.object_owner
            and oc.build_type  != obj.object_owner_build_type
            and oc.element_name = ec.element_name
            and regexp_like(obj.object_name, oc.object_name_regexp)
 where obj.object_name not like common_util.get_RECYCLE_BIN_PATTERN escape '\'
  and  obj.object_owner = 'SYS'
  and  obj.object_type in ('CONTEXT', 'DIRECTORY')
)
select "BUILD_TYPE","BUILD_TIMING","OBJECT_NAME_REGEXP","OBJECT_OWNER_BUILD_TYPE","OBJECT_OWNER","OBJECT_BUILD_TYPE","OBJECT_NAME","OBJECT_TYPE","ELEMENT_NAME","FILE_EXT1","FILE_EXT2","FILE_EXT3" from q_nondflt
UNION ALL
select "BUILD_TYPE","BUILD_TIMING","OBJECT_NAME_REGEXP","OBJECT_OWNER_BUILD_TYPE","OBJECT_OWNER","OBJECT_BUILD_TYPE","OBJECT_NAME","OBJECT_TYPE","ELEMENT_NAME","FILE_EXT1","FILE_EXT2","FILE_EXT3" from q_dflt
UNION ALL
select "BUILD_TYPE","BUILD_TIMING","OBJECT_NAME_REGEXP","OBJECT_OWNER_BUILD_TYPE","OBJECT_OWNER","OBJECT_BUILD_TYPE","OBJECT_NAME","OBJECT_TYPE","ELEMENT_NAME","FILE_EXT1","FILE_EXT2","FILE_EXT3" from q_sys;

--  Comments

--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_OBJECT_VIEW


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/OBJ_INSTALL_SYNONYM_VIEW.vw
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.OBJ_INSTALL_SYNONYM_VIEW view
--

set define off


--
--  Cannot grant permisions on a view with an error
--  https://asktom.oracle.com/pls/apex/f?p=100:11:0::::P11_QUESTION_ID:43253832697675#2653213300346351987
create view "ODBCAPTURE"."OBJ_INSTALL_SYNONYM_VIEW"
  as   select * from TEMP_PUBLICLY_UPDATEABLE_TABLE;

--  Grants



--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_SYNONYM_VIEW

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ODBCAPTURE"."OBJ_INSTALL_SYNONYM_VIEW" ("BUILD_TYPE", "BUILD_TYPE_SELECTOR", "SYNONYM_BUILD_TYPE", "SYNONYM_OBJECT_NAME_REGEXP", "SYNONYM_OWNER", "SYNONYM_NAME", "OBJECT_TYPE", "DB_LINK", "TARGET_BUILD_TYPE", "TARGET_OBJECT_NAME_REGEXP", "TARGET_OWNER", "TARGET_NAME", "TARGET_TYPE", "ELEMENT_NAME", "FILE_EXT1", "FILE_EXT2", "FILE_EXT3") AS 
  select case t.build_timing
            when 'CURRENT'
            then tgt.build_type
            else obj.build_type
      end                             BUILD_TYPE
      ,case t.build_timing
            when 'CURRENT'
            then 'SYNONYM'
            else 'TARGET'
      end                             BUILD_TYPE_SELECTOR
      ,obj.build_type                 SYNONYM_BUILD_TYPE
      ,obj.object_name_regexp         SYNONYM_OBJECT_NAME_REGEXP
      ,obj.object_owner               SYNONYM_OWNER
      ,obj.object_name                SYNONYM_NAME
      ,'SYNONYM'                      OBJECT_TYPE
      ,syn.db_link
      ,tgt.build_type                 TARGET_BUILD_TYPE
      ,tgt.object_name_regexp         TARGET_OBJECT_NAME_REGEXP
      ,tgt.object_owner               TARGET_OWNER
      ,tgt.object_name                TARGET_NAME
      ,tgt.object_type                TARGET_TYPE
      ,obj.element_name
      ,obj.file_ext1
      ,obj.file_ext2
      ,obj.file_ext3
 from  obj_install_object_tab  obj
       join sys.dba_synonyms  syn
            on  syn.owner        = obj.object_owner
            and syn.synonym_name = obj.object_name
       join schema_conf  own
            on  own.username = syn.owner
       join obj_install_object_tab  tgt
            on  tgt.object_owner  = syn.table_owner
            and tgt.object_name   = syn.table_name
            and tgt.object_type  in ('FUNCTION', 'OPERATOR', 'PACKAGE', 'PROCEDURE',
                                     'SEQUENCE', 'SYNONYM', 'TABLE', 'TYPE', 'VIEW',
                                     'MATERIALIZED VIEW', 'JAVA SOURCE', 'QUEUE')
       join build_type_timing  t
            -- Ensure the Target is installed before this Synonym
            on  t.from_build_type = tgt.build_type
            and t.to_build_type   = obj.build_type
 where obj.object_type                    = 'SYNONYM'
  and  (   own.oracle_provided = 'N'                -- Exclude Oracle Provided Synonyms
        OR obj.object_owner_build_type = 'pub' )  -- Include Public Synonyms
  and  syn.synonym_name              not like common_util.get_RECYCLE_BIN_PATTERN escape '\';

--  Comments

--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_SYNONYM_VIEW


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/OBJ_INSTALL_TRIGGER_VIEW.vw
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.OBJ_INSTALL_TRIGGER_VIEW view
--

set define off


--
--  Cannot grant permisions on a view with an error
--  https://asktom.oracle.com/pls/apex/f?p=100:11:0::::P11_QUESTION_ID:43253832697675#2653213300346351987
create view "ODBCAPTURE"."OBJ_INSTALL_TRIGGER_VIEW"
  as   select * from TEMP_PUBLICLY_UPDATEABLE_TABLE;

--  Grants



--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_TRIGGER_VIEW

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ODBCAPTURE"."OBJ_INSTALL_TRIGGER_VIEW" ("BUILD_TYPE", "BUILD_TYPE_SELECTOR", "TRIGGER_BUILD_TYPE", "TRIGGER_OBJECT_NAME_REGEXP", "TRIGGER_OWNER", "TRIGGER_NAME", "OBJECT_TYPE", "TARGET_BUILD_TYPE", "TARGET_OBJECT_NAME_REGEXP", "TARGET_OWNER", "TARGET_NAME", "TARGET_TYPE", "ELEMENT_NAME", "FILE_EXT1", "FILE_EXT2", "FILE_EXT3") AS 
  select case t.build_timing
            when 'CURRENT'
            then obj.build_type
            else tab.build_type
      end                             BUILD_TYPE
      ,case t.build_timing
            when 'CURRENT'
            then 'TRIGGER'
            else 'TARGET'
      end                             BUILD_TYPE_SELECTOR
      ,obj.build_type                 TRIGGER_BUILD_TYPE
      ,obj.object_name_regexp         TRIGGER_OBJECT_NAME_REGEXP
      ,obj.object_owner               TRIGGER_OWNER
      ,obj.object_name                TRIGGER_NAME
      ,obj.object_type
      ,tab.build_type                 TARGET_BUILD_TYPE
      ,tab.object_name_regexp         TARGET_OBJECT_NAME_REGEXP
      ,tab.object_owner               TARGET_OWNER
      ,tab.object_name                TARGET_NAME
      ,tab.object_type                TARGET_TYPE
      ,obj.element_name
      ,obj.file_ext1
      ,obj.file_ext2
      ,obj.file_ext3
 from  obj_install_object_tab  obj
       join dba_triggers  trig
            on  trig.owner        = obj.object_owner
            and trig.trigger_name = obj.object_name
       join schema_conf  trigown
            on  trigown.username        = trig.owner
            and trigown.oracle_provided = 'N'  -- Exclude Oracle Provided Triggers
       join obj_install_object_tab  tab
            on  tab.object_owner  = trig.table_owner
            and tab.object_name   = trig.table_name
            and tab.object_type   = trig.base_object_type  -- Eliminates SYSTEM Triggers
       join schema_conf  tabown
            on  tabown.username        = tab.object_owner
            and tabown.oracle_provided = 'N'   -- Exclude Oracle Provided Base Tables
       join build_type_timing t
            -- Ensure the Table is installed before this Trigger
            on  t.from_build_type = obj.build_type
            and t.to_build_type   = tab.build_type
 where obj.object_type  = 'TRIGGER'
  and  obj.element_name = case when trig.base_object_type = 'MATERIALIZED VIEW' then 'MVIEW_TRIGGER'
                                                                                else trig.base_object_type || '_TRIGGER'
                          end
  and  obj.object_name not like common_util.get_RECYCLE_BIN_PATTERN escape '\';

--  Comments

--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_TRIGGER_VIEW


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/PRIV_OBJ_DIR_VIEW.vw
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.PRIV_OBJ_DIR_VIEW view
--

set define off


--
--  Cannot grant permisions on a view with an error
--  https://asktom.oracle.com/pls/apex/f?p=100:11:0::::P11_QUESTION_ID:43253832697675#2653213300346351987
create view "ODBCAPTURE"."PRIV_OBJ_DIR_VIEW"
  as   select * from TEMP_PUBLICLY_UPDATEABLE_TABLE;

--  Grants



--DBMS_METADATA:ODBCAPTURE.PRIV_OBJ_DIR_VIEW

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ODBCAPTURE"."PRIV_OBJ_DIR_VIEW" ("BUILD_TYPE", "BUILD_TIMING", "OBJECT_NAME_REGEXP", "DIRECTORY_BUILD_TYPE", "DIRECTORY_OWNER", "DIRECTORY_NAME", "OBJECT_TYPE", "DIRECTORY_PATH", "GRANTEE_BUILD_TYPE", "GRANTEE", "GRANTEE_UOR_TYPE", "PRIVILEGE", "GRANTABLE", "HIERARCHY", "COMMON", "INHERITED", "ELEMENT_NAME", "FILE_EXT1", "FILE_EXT2", "FILE_EXT3") AS 
  with q_nondflt as (
  select oc.build_type
      ,t.build_timing
      ,oc.object_name_regexp
      ,oc.build_type           DIRECTORY_BUILD_TYPE
      ,'SYS'                   DIRECTORY_OWNER
      ,dir.directory_name
      ,'DIRECTORY'             OBJECT_TYPE
      ,dir.directory_path      DIRECTORY_PATH
      ,uor.build_type          GRANTEE_BUILD_TYPE
      ,uor.user_or_role        GRANTEE
      ,uor.uor_type            GRANTEE_UOR_TYPE
      ,priv.privilege
      ,priv.grantable
      ,priv.hierarchy
      ,priv.common
      ,priv.inherited
      ,ec.element_name
      ,ec.file_ext1
      ,ec.file_ext2
      ,ec.file_ext3
 from  dba_tab_privs_tab  priv
       join uor_install_view  uor
            on  uor.user_or_role = priv.grantee
            and uor.oracle_provided = 'N'      -- Not Oracle Provided Grantee
       join dba_directories  dir
            on  dir.directory_name = priv.object_name
            and dir.directory_name not like common_util.get_RECYCLE_BIN_PATTERN escape '\'
       join element_conf  ec
            on  ec.element_name = priv.object_type
       join object_conf  oc
            -- OBJECT_CONF is configured based on Grantee, not Owner
            on  oc.username     = uor.user_or_role
            and oc.build_type  != uor.build_type
            and oc.element_name = priv.object_type
            and regexp_like(dir.directory_name, oc.object_name_regexp)
       join build_type_timing  t
            -- Ensure Grantee is available when Directory is installed
            on  t.from_build_type = oc.build_type
            and t.to_build_type   = uor.build_type
 where priv.object_owner = 'SYS'
  and  priv.object_type  = 'DIRECTORY'
), q_dflt as (
select uor.build_type
      ,'CURRENT'               BUILD_TIMING
      ,NULL                    OBJECT_NAME_REGEXP
      ,'sys'                   DIRECTORY_BUILD_TYPE
      ,'SYS'                   DIRECTORY_OWNER
      ,dir.directory_name
      ,'DIRECTORY'             OBJECT_TYPE
      ,dir.directory_path      DIRECTORY_PATH
      ,uor.build_type          GRANTEE_BUILD_TYPE
      ,uor.user_or_role        GRANTEE
      ,uor.uor_type            GRANTEE_UOR_TYPE
      ,priv.privilege
      ,priv.grantable
      ,priv.hierarchy
      ,priv.common
      ,priv.inherited
      ,ec.element_name
      ,ec.file_ext1
      ,ec.file_ext2
      ,ec.file_ext3
 from  dba_tab_privs_tab  priv
       join uor_install_view  uor
            on  uor.user_or_role    = priv.grantee
            and uor.oracle_provided = 'N'      -- Not Oracle Provided Grantee
       join dba_directories  dir
            on  dir.directory_name = priv.object_name
            and dir.directory_name not like common_util.get_RECYCLE_BIN_PATTERN escape '\'
       join element_conf  ec
            on  ec.element_name = priv.object_type
 where (priv.grantee, dir.directory_name) not in (select q_nondflt.grantee, q_nondflt.directory_name from q_nondflt)
  and  priv.object_owner = 'SYS'
  and  priv.object_type  = 'DIRECTORY'
)
select "BUILD_TYPE","BUILD_TIMING","OBJECT_NAME_REGEXP","DIRECTORY_BUILD_TYPE","DIRECTORY_OWNER","DIRECTORY_NAME","OBJECT_TYPE","DIRECTORY_PATH","GRANTEE_BUILD_TYPE","GRANTEE","GRANTEE_UOR_TYPE","PRIVILEGE","GRANTABLE","HIERARCHY","COMMON","INHERITED","ELEMENT_NAME","FILE_EXT1","FILE_EXT2","FILE_EXT3" from q_nondflt
UNION ALL
select "BUILD_TYPE","BUILD_TIMING","OBJECT_NAME_REGEXP","DIRECTORY_BUILD_TYPE","DIRECTORY_OWNER","DIRECTORY_NAME","OBJECT_TYPE","DIRECTORY_PATH","GRANTEE_BUILD_TYPE","GRANTEE","GRANTEE_UOR_TYPE","PRIVILEGE","GRANTABLE","HIERARCHY","COMMON","INHERITED","ELEMENT_NAME","FILE_EXT1","FILE_EXT2","FILE_EXT3" from q_dflt;

--  Comments

--DBMS_METADATA:ODBCAPTURE.PRIV_OBJ_DIR_VIEW


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/PRIV_OBJ_HACL_VIEW.vw
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.PRIV_OBJ_HACL_VIEW view
--

set define off


--
--  Cannot grant permisions on a view with an error
--  https://asktom.oracle.com/pls/apex/f?p=100:11:0::::P11_QUESTION_ID:43253832697675#2653213300346351987
create view "ODBCAPTURE"."PRIV_OBJ_HACL_VIEW"
  as   select * from TEMP_PUBLICLY_UPDATEABLE_TABLE;

--  Grants



--DBMS_METADATA:ODBCAPTURE.PRIV_OBJ_HACL_VIEW

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ODBCAPTURE"."PRIV_OBJ_HACL_VIEW" ("BUILD_TYPE", "BUILD_TIMING", "BUILD_TYPE_SELECTOR", "OBJECT_NAME_REGEXP", "HACL_BUILD_TYPE", "HACL_NAME", "GRANTEE_BUILD_TYPE", "GRANTEE", "GRANTEE_UOR_TYPE", "PRIVILEGE", "HOST", "LOWER_PORT", "UPPER_PORT", "ACE_ORDER", "START_DATE", "END_DATE", "PRINCIPAL_TYPE", "GRANT_TYPE", "INVERTED_PRINCIPAL", "ELEMENT_NAME", "FILE_EXT1", "FILE_EXT2", "FILE_EXT3") AS 
  with q_nondflt as (
  select case t.build_timing
            when 'CURRENT'
            then ol.build_type
            else uor.build_type
       end                            BUILD_TYPE
      ,t.build_timing
      ,case t.build_timing
            when 'CURRENT'
            then 'OBJECT_NAME_REGEXP'
            else 'GRANTEE'
       end                            BUILD_TYPE_SELECTOR
      ,ol.object_name_regexp
      ,ol.build_type                  HACL_BUILD_TYPE
      ,a.host || ',' || a.lower_port || '-' || a.upper_port
                                      HACL_NAME           -- Defined Length Concatenations Don't Need a CAST
      ,uor.build_type                 GRANTEE_BUILD_TYPE
      ,uor.user_or_role               GRANTEE
      ,uor.uor_type                   GRANTEE_UOR_TYPE
      ,a.privilege
      ,a.host
      ,nvl(to_char(a.lower_port),'NULL')
                                      LOWER_PORT
      ,nvl(to_char(a.upper_port),'NULL')
                                      UPPER_PORT
      ,a.ace_order
      ,nvl(to_char(a.start_date,'YYYYMMDDHH24MISS.FF'), 'NULL')
                                      START_DATE
      ,nvl(to_char(a.end_date,'YYYYMMDDHH24MISS.FF'), 'NULL')
                                      END_DATE
      ,a.principal_type
      ,a.grant_type
      ,a.inverted_principal
      ,ec.element_name
      ,ec.file_ext1
      ,ec.file_ext2
      ,ec.file_ext3
 from  dba_host_aces  a
       join uor_install_view  uor
            on  uor.user_or_role    = a.principal
       join element_conf  ec
            on  ec.element_name = 'HOST_ACL'
       join object_conf  ol
            on  ol.username     = uor.user_or_role
            and ol.build_type  != uor.build_type
            and ol.element_name = ec.element_name
            and regexp_like(a.host || ',' || a.lower_port || '-' || a.upper_port, ol.object_name_regexp)
       join build_type_timing  t
            -- Ensure the Grantee is available when the HACL is installed
            on  t.from_build_type = ol.build_type
            and t.to_build_type   = uor.build_type
 where (   uor.oracle_provided = 'N'    -- Exclude Oracle Provided Grantees
        OR uor.build_type = 'pub')    -- Include PUBLIC as the grantee
), q_dflt as (
  select uor.build_type
      ,'CURRENT'                      BUILD_TIMING
      ,'GRANTEE'                      BUILD_TYPE_SELECTOR
      ,NULL                           OBJECT_NAME_REGEXP
      ,'sys'                          HACL_BUILD_TYPE  -- Use the BUILD_TYPE of the Grantee
      ,a.host || ',' || a.lower_port || '-' || a.upper_port
                                      HACL_NAME          -- Defined Length Concatenations Don't Need a CAST
      ,uor.build_type                 GRANTEE_BUILD_TYPE
      ,uor.user_or_role               GRANTEE
      ,uor.uor_type                   GRANTEE_UOR_TYPE
      ,a.privilege
      ,a.host
      ,nvl(to_char(a.lower_port),'NULL')
                                      LOWER_PORT
      ,nvl(to_char(a.upper_port),'NULL')
                                      UPPER_PORT
      ,a.ace_order
      ,nvl(to_char(a.start_date,'YYYYMMDDHH24MISS.FF'), 'NULL')
                                      START_DATE
      ,nvl(to_char(a.end_date,'YYYYMMDDHH24MISS.FF'), 'NULL')
                                      END_DATE
      ,a.principal_type
      ,a.grant_type
      ,a.inverted_principal
      ,ec.element_name
      ,ec.file_ext1
      ,ec.file_ext2
      ,ec.file_ext3
  from dba_host_aces  a
       join uor_install_view  uor
            on  uor.user_or_role    = a.principal
            and uor.oracle_provided = 'N'    -- Exclude Oracle Provided Grantees
       join element_conf  ec
            on  ec.element_name = 'HOST_ACL'
 where (a.principal, a.host || ',' || a.lower_port || '-' || a.upper_port) not in
       (select q_nondflt.grantee, q_nondflt.hacl_name from q_nondflt)
)
select "BUILD_TYPE","BUILD_TIMING","BUILD_TYPE_SELECTOR","OBJECT_NAME_REGEXP","HACL_BUILD_TYPE","HACL_NAME","GRANTEE_BUILD_TYPE","GRANTEE","GRANTEE_UOR_TYPE","PRIVILEGE","HOST","LOWER_PORT","UPPER_PORT","ACE_ORDER","START_DATE","END_DATE","PRINCIPAL_TYPE","GRANT_TYPE","INVERTED_PRINCIPAL","ELEMENT_NAME","FILE_EXT1","FILE_EXT2","FILE_EXT3" from q_nondflt
UNION ALL
select "BUILD_TYPE","BUILD_TIMING","BUILD_TYPE_SELECTOR","OBJECT_NAME_REGEXP","HACL_BUILD_TYPE","HACL_NAME","GRANTEE_BUILD_TYPE","GRANTEE","GRANTEE_UOR_TYPE","PRIVILEGE","HOST","LOWER_PORT","UPPER_PORT","ACE_ORDER","START_DATE","END_DATE","PRINCIPAL_TYPE","GRANT_TYPE","INVERTED_PRINCIPAL","ELEMENT_NAME","FILE_EXT1","FILE_EXT2","FILE_EXT3" from q_dflt;

--  Comments

--DBMS_METADATA:ODBCAPTURE.PRIV_OBJ_HACL_VIEW


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/PRIV_OBJ_INSTALL_VW.vw
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.PRIV_OBJ_INSTALL_VW view
--

set define off


--
--  Cannot grant permisions on a view with an error
--  https://asktom.oracle.com/pls/apex/f?p=100:11:0::::P11_QUESTION_ID:43253832697675#2653213300346351987
create view "ODBCAPTURE"."PRIV_OBJ_INSTALL_VW"
  as   select * from TEMP_PUBLICLY_UPDATEABLE_TABLE;

--  Grants



--DBMS_METADATA:ODBCAPTURE.PRIV_OBJ_INSTALL_VW

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ODBCAPTURE"."PRIV_OBJ_INSTALL_VW" ("BUILD_TYPE", "BUILD_TIMING", "BUILD_TYPE_SELECTOR", "OBJECT_BUILD_TYPE", "OBJECT_OWNER", "OBJECT_NAME", "OBJECT_TYPE", "GRANTEE_BUILD_TYPE", "GRANTEE", "GRANTEE_UOR_TYPE", "PRIVILEGE", "GRANTABLE", "HIERARCHY", "COMMON", "INHERITED", "ELEMENT_NAME", "FILE_EXT1", "FILE_EXT2", "FILE_EXT3") AS 
  select case t.build_timing
            when 'CURRENT'
            then obj.build_type
            else uor.build_type
       end                            BUILD_TYPE
      ,t.build_timing
      ,case t.build_timing
            when 'CURRENT'
            then 'OBJECT'
            else 'GRANTEE'
       end                            BUILD_TYPE_SELECTOR
      ,obj.build_type                 OBJECT_BUILD_TYPE
      ,obj.object_owner
      ,obj.object_name
      ,obj.object_type
      ,uor.build_type                 GRANTEE_BUILD_TYPE
      ,uor.user_or_role               GRANTEE
      ,uor.uor_type                   GRANTEE_UOR_TYPE
      ,priv.privilege
      ,priv.grantable
      ,priv.hierarchy
      ,priv.common
      ,priv.inherited
      ,ec.element_name
      ,ec.file_ext1
      ,ec.file_ext2
      ,ec.file_ext3
 from  dba_tab_privs_tab  priv
       join uor_install_view  uor
            on  uor.user_or_role = priv.grantee
       join obj_install_object_tab  obj
            on  obj.object_owner  = priv.object_owner
            and obj.object_name   = priv.object_name
            and obj.object_type   = priv.object_type
       join schema_conf  own
            on  own.username = obj.object_owner
       join element_conf  ec
            on  ec.element_name = 'GRANT'
       join build_type_timing  t
            -- Ensure Grantee is available after installation of object
            on  from_build_type = obj.object_build_type
            and to_build_type   = uor.build_type
 where priv.object_owner != 'SYS'             -- Exclude database objects owned by SYS
  and  (   uor.oracle_provided = 'N'          -- Not Oracle Provided Grantee
        OR (    uor.build_type    = 'pub'   -- Include 'pub' Grantees
            AND own.oracle_provided = 'N' )   -- Only if owner not Oracle Provided
       );

--  Comments

--DBMS_METADATA:ODBCAPTURE.PRIV_OBJ_INSTALL_VW


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/PRIV_OBJ_QUEUE_VIEW.vw
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.PRIV_OBJ_QUEUE_VIEW view
--

set define off


--
--  Cannot grant permisions on a view with an error
--  https://asktom.oracle.com/pls/apex/f?p=100:11:0::::P11_QUESTION_ID:43253832697675#2653213300346351987
create view "ODBCAPTURE"."PRIV_OBJ_QUEUE_VIEW"
  as   select * from TEMP_PUBLICLY_UPDATEABLE_TABLE;

--  Grants



--DBMS_METADATA:ODBCAPTURE.PRIV_OBJ_QUEUE_VIEW

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ODBCAPTURE"."PRIV_OBJ_QUEUE_VIEW" ("BUILD_TYPE", "BUILD_TIMING", "BUILD_TYPE_SELECTOR", "QUEUE_BUILD_TYPE", "QUEUE_OWNER", "QUEUE_NAME", "OBJECT_TYPE", "GRANTEE_BUILD_TYPE", "GRANTEE", "GRANTEE_UOR_TYPE", "PRIVILEGE", "GRANTABLE", "HIERARCHY", "COMMON", "INHERITED", "ELEMENT_NAME", "FILE_EXT1", "FILE_EXT2", "FILE_EXT3") AS 
  select case t.build_timing
            when 'CURRENT'
            then obj.build_type
            else uor.build_type
       end                            BUILD_TYPE
      ,t.build_timing
      ,case t.build_timing
            when 'CURRENT'
            then 'QUEUE'
            else 'GRANTEE'
       end                            BUILD_TYPE_SELECTOR
      ,obj.build_type                 QUEUE_BUILD_TYPE
      ,obj.object_owner               QUEUE_OWNER
      ,obj.object_name                QUEUE_NAME
      ,'QUEUE'                        OBJECT_TYPE
      ,uor.build_type                 GRANTEE_BUILD_TYPE
      ,uor.user_or_role               GRANTEE
      ,uor.uor_type                   GRANTEE_UOR_TYPE
      ,tp.privilege
      ,tp.grantable
      ,tp.hierarchy
      ,tp.common
      ,tp.inherited
      ,ec.element_name
      ,ec.file_ext1
      ,ec.file_ext2
      ,ec.file_ext3
 from uor_install_view  uor
       join dba_tab_privs_tab  tp
            on  tp.grantee     = uor.user_or_role
            and tp.object_type = 'QUEUE'
       join dba_queues  aq
            on  aq.owner = tp.object_owner
            and aq.name  = tp.object_name
       join obj_install_object_tab  obj
            on  obj.object_owner = tp.object_owner
            and obj.object_name  = tp.object_name
            and obj.object_type  = 'QUEUE'
       join schema_conf  own
            on  own.username = obj.object_owner
       join element_conf  ec
            on  ec.element_name = 'GRANT'
       join build_type_timing  t
            -- Ensure the Grantee is available when the Queue is installed
            on  t.from_build_type = obj.build_type
            and t.to_build_type   = uor.build_type
 where (   aq.queue_type is null
        or aq.queue_type != 'EXCEPTION_QUEUE')
  and  aq.name not like common_util.get_RECYCLE_BIN_PATTERN escape '\'
  and  (   uor.oracle_provided = 'N'          -- Exclude Oracle Provided Grantees
        OR (    uor.build_type    = 'pub'   -- Include 'pub' Grantess
            AND own.oracle_provided = 'N' )   -- Only if owner not Oracle Provided
       );

--  Comments

--DBMS_METADATA:ODBCAPTURE.PRIV_OBJ_QUEUE_VIEW


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/PRIV_OBJ_WACL_VIEW.vw
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.PRIV_OBJ_WACL_VIEW view
--

set define off


--
--  Cannot grant permisions on a view with an error
--  https://asktom.oracle.com/pls/apex/f?p=100:11:0::::P11_QUESTION_ID:43253832697675#2653213300346351987
create view "ODBCAPTURE"."PRIV_OBJ_WACL_VIEW"
  as   select * from TEMP_PUBLICLY_UPDATEABLE_TABLE;

--  Grants



--DBMS_METADATA:ODBCAPTURE.PRIV_OBJ_WACL_VIEW

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ODBCAPTURE"."PRIV_OBJ_WACL_VIEW" ("BUILD_TYPE", "BUILD_TIMING", "BUILD_TYPE_SELECTOR", "OBJECT_NAME_REGEXP", "WACL_BUILD_TYPE", "WACL_NAME", "GRANTEE_BUILD_TYPE", "GRANTEE", "GRANTEE_UOR_TYPE", "PRIVILEGE", "WALLET_PATH", "ACE_ORDER", "START_DATE", "END_DATE", "PRINCIPAL_TYPE", "GRANT_TYPE", "INVERTED_PRINCIPAL", "ELEMENT_NAME", "FILE_EXT1", "FILE_EXT2", "FILE_EXT3") AS 
  with q_nondflt as (
  select case t.build_timing
            when 'CURRENT'
            then ol.build_type
            else uor.build_type
       end                            BUILD_TYPE
      ,t.build_timing
      ,case t.build_timing
            when 'CURRENT'
            then 'OBJECT_NAME_REGEXP'
            else 'GRANTEE'
       end                            BUILD_TYPE_SELECTOR
      ,ol.object_name_regexp
      ,ol.build_type                  WACL_BUILD_TYPE
      ,regexp_replace(regexp_replace(substr(a.wallet_path
                                           ,greatest(0-length(a.wallet_path)
                                                    ,-255) )
                                    ,'^file:','')
                     ,'[\/]','_')     WACL_NAME
      ,uor.build_type                 GRANTEE_BUILD_TYPE
      ,uor.user_or_role               GRANTEE
      ,uor.uor_type                   GRANTEE_UOR_TYPE
      ,a.privilege
      ,a.wallet_path
      ,a.ace_order
      ,nvl(to_char(a.start_date,'YYYYMMDDHH24MISS.FF'), 'NULL')
                                      START_DATE
      ,nvl(to_char(a.end_date,'YYYYMMDDHH24MISS.FF'), 'NULL')
                                      END_DATE
      ,a.principal_type
      ,a.grant_type
      ,a.inverted_principal
      ,ec.element_name
      ,ec.file_ext1
      ,ec.file_ext2
      ,ec.file_ext3
 from  dba_wallet_aces  a
       join uor_install_view  uor
            on  uor.user_or_role    = a.principal
       join element_conf  ec
            on  ec.element_name = 'WALLET_ACL'
       join object_conf  ol
            on  ol.username     = uor.user_or_role
            and ol.build_type  != uor.build_type
            and ol.element_name = ec.element_name
            and regexp_like(a.wallet_path, ol.object_name_regexp)
       join build_type_timing  t
            -- Ensure the Grantee is available when the WACL is installed
            on  t.from_build_type = ol.build_type
            and t.to_build_type   = uor.build_type
 where (   uor.oracle_provided = 'N'    -- Exclude Oracle Provided Grantees
        OR uor.build_type = 'pub')    -- Include PUBLIC as the grantee
), q_dflt as (
  select uor.build_type
      ,'CURRENT'                      BUILD_TIMING
      ,'GRANTEE'                      BUILD_TYPE_SELECTOR
      ,NULL                           OBJECT_NAME_REGEXP
      ,'sys'                          WACL_BUILD_TYPE  -- Use the BUILD_TYPE of the Grantee
      ,regexp_replace(regexp_replace(substr(a.wallet_path
                                           ,greatest(0-length(a.wallet_path)
                                                    ,-255) )
                                    ,'^file:','')
                     ,'[\/]','_')     WACL_NAME
      ,uor.build_type                 GRANTEE_BUILD_TYPE
      ,uor.user_or_role               GRANTEE
      ,uor.uor_type                   GRANTEE_UOR_TYPE
      ,a.privilege
      ,a.wallet_path
      ,a.ace_order
      ,nvl(to_char(a.start_date,'YYYYMMDDHH24MISS.FF'), 'NULL')
                                      START_DATE
      ,nvl(to_char(a.end_date,'YYYYMMDDHH24MISS.FF'), 'NULL')
                                      END_DATE
      ,a.principal_type
      ,a.grant_type
      ,a.inverted_principal
      ,ec.element_name
      ,ec.file_ext1
      ,ec.file_ext2
      ,ec.file_ext3
  from dba_wallet_aces  a
       join uor_install_view  uor
            on  uor.user_or_role    = a.principal
            and uor.oracle_provided = 'N'    -- Exclude Oracle Provided Grantees
       join element_conf  ec
            on  ec.element_name = 'WALLET_ACL'
 where (a.principal, a.wallet_path) not in
       (select q_nondflt.grantee, q_nondflt.wacl_name from q_nondflt)
)
select "BUILD_TYPE","BUILD_TIMING","BUILD_TYPE_SELECTOR","OBJECT_NAME_REGEXP","WACL_BUILD_TYPE","WACL_NAME","GRANTEE_BUILD_TYPE","GRANTEE","GRANTEE_UOR_TYPE","PRIVILEGE","WALLET_PATH","ACE_ORDER","START_DATE","END_DATE","PRINCIPAL_TYPE","GRANT_TYPE","INVERTED_PRINCIPAL","ELEMENT_NAME","FILE_EXT1","FILE_EXT2","FILE_EXT3" from q_nondflt
UNION ALL
select "BUILD_TYPE","BUILD_TIMING","BUILD_TYPE_SELECTOR","OBJECT_NAME_REGEXP","WACL_BUILD_TYPE","WACL_NAME","GRANTEE_BUILD_TYPE","GRANTEE","GRANTEE_UOR_TYPE","PRIVILEGE","WALLET_PATH","ACE_ORDER","START_DATE","END_DATE","PRINCIPAL_TYPE","GRANT_TYPE","INVERTED_PRINCIPAL","ELEMENT_NAME","FILE_EXT1","FILE_EXT2","FILE_EXT3" from q_dflt;

--  Comments

--DBMS_METADATA:ODBCAPTURE.PRIV_OBJ_WACL_VIEW


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/PRIV_QUEUE_REGISTER_VIEW.vw
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.PRIV_QUEUE_REGISTER_VIEW view
--

set define off


--
--  Cannot grant permisions on a view with an error
--  https://asktom.oracle.com/pls/apex/f?p=100:11:0::::P11_QUESTION_ID:43253832697675#2653213300346351987
create view "ODBCAPTURE"."PRIV_QUEUE_REGISTER_VIEW"
  as   select * from TEMP_PUBLICLY_UPDATEABLE_TABLE;

--  Grants



--DBMS_METADATA:ODBCAPTURE.PRIV_QUEUE_REGISTER_VIEW

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ODBCAPTURE"."PRIV_QUEUE_REGISTER_VIEW" ("BUILD_TYPE", "BUILD_TYPE_SELECTOR", "QUEUE_BUILD_TYPE", "QUEUE_OWNER", "QUEUE_NAME", "OBJECT_TYPE", "CONSUMER_BUILD_TYPE", "CONSUMER_NAME", "CONSUMER_UOR_TYPE", "SUBSCRIPTION_NAME", "NAMESPACE", "LOCATION_NAME", "USER_CONTEXT", "QOSFLAGS", "TIMEOUT", "NTFN_GROUPING_CLASS", "NTFN_GROUPING_VALUE", "NTFN_GROUPING_TYPE", "NTFN_GROUPING_START_TIME", "NTFN_GROUPING_REPEAT_COUNT", "CONTEXT_SIZE") AS 
  select case t.build_timing
            when 'CURRENT'
            then aq.build_type
            else uor.build_type
       end                               BUILD_TYPE
      ,case t.build_timing
            when 'CURRENT'
            then 'QUEUE'
            else 'CONSUMER'
       end                               BUILD_TYPE_SELECTOR
      ,aq.build_type                     QUEUE_BUILD_TYPE
      ,aq.object_owner                   QUEUE_OWNER
      ,aq.object_name                    QUEUE_NAME
      ,'QUEUE'                           OBJECT_TYPE
      ,uor.build_type                    CONSUMER_BUILD_TYPE
      ,uor.user_or_role                  CONSUMER_NAME
      ,uor.uor_type                      CONSUMER_UOR_TYPE
      ,aqreg.subscription_name           -- "subscription_name" defines the datatype
      ,aqreg.namespace
      ,aqreg.location_name
      ,aqreg.user_context
      ,aqreg.qosflags
      ,aqreg.timeout
      ,aqreg.ntfn_grouping_class
      ,aqreg.ntfn_grouping_value
      ,aqreg.ntfn_grouping_type
      ,aqreg.ntfn_grouping_start_time
      ,aqreg.ntfn_grouping_repeat_count
      ,aqreg.context_size
 from  uor_install_view  uor
       join dba_subscr_registrations  aqreg
            on  substr(aqreg.subscription_name
                      ,instr(aqreg.subscription_name,':') + 1
                      ,4000) = uor.user_or_role
       join obj_install_object_tab  aq
            on  aq.object_owner = substr(aqreg.subscription_name
                                        ,1
                                        ,instr(aqreg.subscription_name,'.') - 1)
            and aq.object_name = substr(aqreg.subscription_name
                                       ,instr(aqreg.subscription_name,'.') + 1
                                       ,instr(aqreg.subscription_name,':') -
                                        instr(aqreg.subscription_name,'.') - 1)
       join schema_conf  own
            on  own.username = aq.object_owner
       join build_type_timing  t
            -- Ensure the Consumer is avaialable when this Queue is installed
            on  t.from_build_type = aq.build_type
            and t.to_build_type   = uor.build_type
 where aq.object_type   = 'QUEUE'
       -- Exclude Oracle Provided queues
  and  own.oracle_provided = 'N';

--  Comments

--DBMS_METADATA:ODBCAPTURE.PRIV_QUEUE_REGISTER_VIEW


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/PRIV_QUEUE_SUBSCRIBE_VIEW.vw
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.PRIV_QUEUE_SUBSCRIBE_VIEW view
--

set define off


--
--  Cannot grant permisions on a view with an error
--  https://asktom.oracle.com/pls/apex/f?p=100:11:0::::P11_QUESTION_ID:43253832697675#2653213300346351987
create view "ODBCAPTURE"."PRIV_QUEUE_SUBSCRIBE_VIEW"
  as   select * from TEMP_PUBLICLY_UPDATEABLE_TABLE;

--  Grants



--DBMS_METADATA:ODBCAPTURE.PRIV_QUEUE_SUBSCRIBE_VIEW

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ODBCAPTURE"."PRIV_QUEUE_SUBSCRIBE_VIEW" ("BUILD_TYPE", "BUILD_TYPE_SELECTOR", "QUEUE_BUILD_TYPE", "QUEUE_OWNER", "QUEUE_NAME", "OBJECT_TYPE", "CONSUMER_BUILD_TYPE", "CONSUMER_NAME", "CONSUMER_UOR_TYPE", "ADDRESS", "PROTOCOL", "RULE", "TRANSFORMATION", "QUEUE_TO_QUEUE", "DELIVERY_MODE") AS 
  select case t.build_timing
            when 'CURRENT'
            then aq.build_type
            else uor.build_type
       end                           BUILD_TYPE
      ,case t.build_timing
            when 'CURRENT'
            then 'QUEUE'
            else 'CONSUMER'
       end                           BUILD_TYPE_SELECTOR
      ,aq.build_type                 QUEUE_BUILD_TYPE
      ,aq.object_owner               QUEUE_OWNER
      ,aq.object_name                QUEUE_NAME
      ,'QUEUE'                       OBJECT_TYPE
      ,uor.build_type                CONSUMER_BUILD_TYPE
      ,uor.user_or_role              CONSUMER_NAME
      ,uor.uor_type                  CONSUMER_UOR_TYPE
      ,aqsub.address
      ,aqsub.protocol
      ,aqsub.rule
      ,aqsub.transformation
      ,aqsub.queue_to_queue
      ,aqsub.delivery_mode
 from  uor_install_view  uor
       join dba_queue_subscribers  aqsub
            on  aqsub.consumer_name = uor.user_or_role
       join obj_install_object_tab  aq
            on  aq.object_owner = aqsub.owner
            and aq.object_name  = aqsub.queue_name
       join schema_conf  own
            on  own.username = aq.object_owner
       -- Ensure Consumer is available when Queue is installed
       join build_type_timing  t
            on  t.from_build_type = aq.build_type
            and t.to_build_type   = uor.build_type
 where aq.object_type   = 'QUEUE'
       -- Exclude Oracle Provided queues
  and  own.oracle_provided = 'N';

--  Comments

--DBMS_METADATA:ODBCAPTURE.PRIV_QUEUE_SUBSCRIBE_VIEW


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/PRIV_QUEUE_SYSPRIVS_VIEW.vw
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.PRIV_QUEUE_SYSPRIVS_VIEW view
--

set define off


--
--  Cannot grant permisions on a view with an error
--  https://asktom.oracle.com/pls/apex/f?p=100:11:0::::P11_QUESTION_ID:43253832697675#2653213300346351987
create view "ODBCAPTURE"."PRIV_QUEUE_SYSPRIVS_VIEW"
  as   select * from TEMP_PUBLICLY_UPDATEABLE_TABLE;

--  Grants



--DBMS_METADATA:ODBCAPTURE.PRIV_QUEUE_SYSPRIVS_VIEW

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ODBCAPTURE"."PRIV_QUEUE_SYSPRIVS_VIEW" ("BUILD_TYPE", "BUILD_TIMING", "BUILD_TYPE_SELECTOR", "OBJECT_NAME_REGEXP", "OBJECT_NAME_REGEXP_BUILD_TYPE", "GRANT_BUILD_TYPE", "GRANT_OWNER", "GRANT_NAME", "GRANTEE_BUILD_TYPE", "GRANTEE", "GRANTEE_UOR_TYPE", "ADMIN_OPTION", "COMMON", "INHERITED", "ELEMENT_NAME", "FILE_EXT1", "FILE_EXT2", "FILE_EXT3") AS 
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
      ,oc.build_type                    OBJECT_NAME_REGEXP_BUILD_TYPE
      ,'sys'                            GRANT_BUILD_TYPE
      ,'SYS'                            GRANT_OWNER
      ,aqsp.dbms_aq_priv                GRANT_NAME
      ,uor.build_type                   GRANTEE_BUILD_TYPE
      ,uor.user_or_role                 GRANTEE
      ,uor.uor_type                     GRANTEE_UOR_TYPE
      ,aqsp.admin_option
      ,aqsp.common
      ,aqsp.inherited
      ,'GRANT'                          ELEMENT_NAME
      ,ec.file_ext1
      ,ec.file_ext2
      ,ec.file_ext3
 from  aq_system_privs_vw  aqsp
       join uor_install_view  uor
            on  uor.user_or_role = aqsp.grantee
            and uor.oracle_provided = 'N'   -- Exclude Oracle Provided Grantees
       join element_conf  ec
            on  ec.element_name = 'GRANT'
  left join object_conf  oc
            on  oc.element_name = 'GRANT'
            and oc.username     = aqsp.grantee
            and regexp_like(aqsp.dbms_aq_priv, oc.object_name_regexp)
  left join build_type_timing  t
            on  t.from_build_type = uor.build_type
            and t.to_build_type   = oc.build_type;

--  Comments

--DBMS_METADATA:ODBCAPTURE.PRIV_QUEUE_SYSPRIVS_VIEW


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/PRIV_ROLE_PRIVILEGES_VIEW.vw
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.PRIV_ROLE_PRIVILEGES_VIEW view
--

set define off


--
--  Cannot grant permisions on a view with an error
--  https://asktom.oracle.com/pls/apex/f?p=100:11:0::::P11_QUESTION_ID:43253832697675#2653213300346351987
create view "ODBCAPTURE"."PRIV_ROLE_PRIVILEGES_VIEW"
  as   select * from TEMP_PUBLICLY_UPDATEABLE_TABLE;

--  Grants



--DBMS_METADATA:ODBCAPTURE.PRIV_ROLE_PRIVILEGES_VIEW

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ODBCAPTURE"."PRIV_ROLE_PRIVILEGES_VIEW" ("BUILD_TYPE", "BUILD_TIMING", "BUILD_TYPE_SELECTOR", "OBJECT_NAME_REGEXP", "OBJECT_NAME_REGEXP_BUILD_TYPE", "ROLE_BUILD_TYPE", "ROLENAME", "GRANTEE_BUILD_TYPE", "GRANTEE", "GRANTEE_UOR_TYPE", "DEFAULT_ROLE", "ADMIN_OPTION", "DELEGATE_OPTION", "COMMON", "INHERITED") AS 
  select case t.build_timing
          when 'FUTURE' then oc.build_type
                        else uor.build_type
       end                                       BUILD_TYPE
      ,case t.build_timing
          when 'FUTURE' then 'FUTURE'
                        else 'CURRENT'
       end                                       BUILD_TIMING
      ,case t.build_timing
          when 'FUTURE' then 'OBJECT_NAME_REGEXP'
                        else 'GRANTEE'
       end                                       BUILD_TYPE_SELECTOR
      ,oc.object_name_regexp
      ,oc.build_type                             OBJECT_NAME_REGEXP_BUILD_TYPE
      ,trc.build_type                            ROLE_BUILD_TYPE
      ,trc.rolename
      ,uor.build_type                            GRANTEE_BUILD_TYPE
      ,uor.user_or_role                          GRANTEE
      ,uor.uor_type                              GRANTEE_UOR_TYPE
      ,priv.default_role
      ,priv.admin_option
      ,priv.delegate_option
      ,priv.common
      ,priv.inherited
 from  dba_role_privs  priv
       join uor_install_view  uor
            on  uor.user_or_role = priv.grantee
            and uor.oracle_provided = 'N'    -- Exclude Oracle Provided Grantees
       join role_conf  trc
            on  trc.rolename        = priv.granted_role
            and trc.oracle_provided = 'Y'    -- Only Oracle Provided Roles
  left join object_conf  oc
            on  oc.element_name = 'ROLE'
            and oc.username     = priv.grantee
            and regexp_like(trc.rolename, oc.object_name_regexp)
  left join build_type_timing  t
            on  t.from_build_type = uor.build_type
            and t.to_build_type   = oc.build_type
UNION ALL
  select case t.build_timing
          when 'FUTURE' then trc.build_type
                        else uor.build_type
       end                                       BUILD_TYPE
      ,case t.build_timing
          when 'FUTURE' then 'FUTURE'
                        else 'CURRENT'
       end                                       BUILD_TIMING
      ,case t.build_timing
          when 'FUTURE' then 'OBJECT_NAME_REGEXP'
                        else 'GRANTEE'
       end                                       BUILD_TYPE_SELECTOR
      ,NULL                                      OBJECT_NAME_REGEXP
      ,NULL                                      OBJECT_NAME_REGEXP_BUILD_TYPE
      ,trc.build_type                            ROLE_BUILD_TYPE
      ,trc.rolename
      ,uor.build_type                            GRANTEE_BUILD_TYPE
      ,uor.user_or_role                          GRANTEE
      ,uor.uor_type                              GRANTEE_UOR_TYPE
      ,priv.default_role
      ,priv.admin_option
      ,priv.delegate_option
      ,priv.common
      ,priv.inherited
 from  dba_role_privs  priv
       join uor_install_view  uor
            on  uor.user_or_role = priv.grantee
            and uor.oracle_provided = 'N'    -- Exclude Oracle Provided Grantees
       join role_conf  trc
            on  trc.rolename        = priv.granted_role
            and trc.oracle_provided = 'N'    -- Not Oracle Provided Role
       -- Ensure the Grantee is available after installation of the Role
       join build_type_timing  t
            on  t.from_build_type = uor.build_type
            and t.to_build_type   = trc.build_type;

--  Comments

--DBMS_METADATA:ODBCAPTURE.PRIV_ROLE_PRIVILEGES_VIEW


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/PRIV_SYSOBJ_PRIVILEGES_VIEW.vw
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.PRIV_SYSOBJ_PRIVILEGES_VIEW view
--

set define off


--
--  Cannot grant permisions on a view with an error
--  https://asktom.oracle.com/pls/apex/f?p=100:11:0::::P11_QUESTION_ID:43253832697675#2653213300346351987
create view "ODBCAPTURE"."PRIV_SYSOBJ_PRIVILEGES_VIEW"
  as   select * from TEMP_PUBLICLY_UPDATEABLE_TABLE;

--  Grants



--DBMS_METADATA:ODBCAPTURE.PRIV_SYSOBJ_PRIVILEGES_VIEW

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ODBCAPTURE"."PRIV_SYSOBJ_PRIVILEGES_VIEW" ("BUILD_TYPE", "BUILD_TIMING", "BUILD_TYPE_SELECTOR", "OBJECT_NAME_REGEXP", "OBJECT_NAME_REGEXP_BUILD_TYPE", "OBJECT_OWNER_BUILD_TYPE", "OBJECT_OWNER", "OBJECT_NAME", "OBJECT_TYPE", "GRANTEE_BUILD_TYPE", "GRANTEE", "GRANTEE_UOR_TYPE", "PRIVILEGE", "GRANTABLE", "HIERARCHY", "COMMON", "INHERITED") AS 
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
      ,oc.build_type                    OBJECT_NAME_REGEXP_BUILD_TYPE
      ,priv.object_owner_build_type
      ,priv.object_owner
      ,priv.object_name
      ,priv.object_type
      ,priv.grantee_build_type
      ,priv.grantee
      ,priv.grantee_uor_type
      ,priv.privilege
      ,priv.grantable
      ,priv.hierarchy
      ,priv.common
      ,priv.inherited
 from  dba_tab_privs_tab  priv
       join uor_install_view  uor
            on  uor.user_or_role = priv.grantee
            and uor.oracle_provided = 'N'    -- Exclude Oracle Provided Grantees
  left join object_conf  oc
            on  oc.element_name = 'SYS_GRANT'
            and oc.username     = priv.grantee
            and regexp_like(priv.object_name, oc.object_name_regexp)
  left join build_type_timing  t
            on  t.from_build_type = uor.build_type
            and t.to_build_type   = oc.build_type
       -- Include only 'sys' Objects
 where priv.object_owner  = 'SYS';

--  Comments

--DBMS_METADATA:ODBCAPTURE.PRIV_SYSOBJ_PRIVILEGES_VIEW


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/PRIV_SYSTEM_PRIVILEGES_VIEW.vw
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.PRIV_SYSTEM_PRIVILEGES_VIEW view
--

set define off


--
--  Cannot grant permisions on a view with an error
--  https://asktom.oracle.com/pls/apex/f?p=100:11:0::::P11_QUESTION_ID:43253832697675#2653213300346351987
create view "ODBCAPTURE"."PRIV_SYSTEM_PRIVILEGES_VIEW"
  as   select * from TEMP_PUBLICLY_UPDATEABLE_TABLE;

--  Grants



--DBMS_METADATA:ODBCAPTURE.PRIV_SYSTEM_PRIVILEGES_VIEW

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ODBCAPTURE"."PRIV_SYSTEM_PRIVILEGES_VIEW" ("BUILD_TYPE", "BUILD_TIMING", "BUILD_TYPE_SELECTOR", "OBJECT_NAME_REGEXP", "OBJECT_NAME_REGEXP_BUILD_TYPE", "GRANTEE_BUILD_TYPE", "GRANTEE_UOR_TYPE", "GRANTEE", "SYSTEM_PRIVILEGE_NAME", "ADMIN_OPTION", "COMMON", "INHERITED") AS 
  select case t.build_timing
          when 'FUTURE' then oc.build_type
                        else uor.build_type
       end                                       BUILD_TYPE
      ,case t.build_timing
          when 'FUTURE' then 'FUTURE'
                        else 'CURRENT'
       end                                       BUILD_TIMING
      ,case t.build_timing
          when 'FUTURE' then 'OBJECT_NAME_REGEXP'
                        else 'GRANTEE'
       end                                       BUILD_TYPE_SELECTOR
      ,oc.object_name_regexp
      ,oc.build_type                             OBJECT_NAME_REGEXP_BUILD_TYPE
      ,uor.build_type                            GRANTEE_BUILD_TYPE
      ,uor.uor_type                              GRANTEE_UOR_TYPE
      ,priv.grantee
      ,priv.privilege                            SYSTEM_PRIVILEGE_NAME
      ,priv.admin_option
      ,priv.common
      ,priv.inherited
 from  dba_sys_privs  priv
       join uor_install_view  uor
            on  uor.user_or_role = priv.grantee
            and uor.oracle_provided = 'N'    -- Exclude Oracle Provided Grantees
  left join object_conf  oc
            on  oc.element_name = 'GRANT'
            and oc.username     = priv.grantee
            and regexp_like(priv.privilege, oc.object_name_regexp)
  left join build_type_timing  t
            on  t.from_build_type = uor.build_type
            and t.to_build_type   = oc.build_type
 where priv.privilege not like '% ANY QUEUE';

--  Comments

--DBMS_METADATA:ODBCAPTURE.PRIV_SYSTEM_PRIVILEGES_VIEW


--  Grants


--  Synonyms


set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/UOR_INSTALL_VIEW.vw
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.UOR_INSTALL_VIEW view
--

set define off


--
--  Cannot grant permisions on a view with an error
--  https://asktom.oracle.com/pls/apex/f?p=100:11:0::::P11_QUESTION_ID:43253832697675#2653213300346351987
create view "ODBCAPTURE"."UOR_INSTALL_VIEW"
  as   select * from TEMP_PUBLICLY_UPDATEABLE_TABLE;

--  Grants



--DBMS_METADATA:ODBCAPTURE.UOR_INSTALL_VIEW

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ODBCAPTURE"."UOR_INSTALL_VIEW" ("BUILD_TYPE", "ORACLE_PROVIDED", "USER_OR_ROLE", "UOR_TYPE", "FILE_EXT1", "NOTES") AS 
  select sc.build_type
      ,sc.oracle_provided
      ,sc.username            USER_OR_ROLE
      ,'USER'                 UOR_TYPE
      ,ec.file_ext1
      ,sc.notes
 from  schema_conf  sc
       join element_conf  ec
            on  ec.element_name = 'USER'
UNION ALL
select rl.build_type
      ,rl.oracle_provided
      ,rl.rolename              USER_OR_ROLE
      ,'ROLE'                   UOR_TYPE
      ,ec.file_ext1
      ,rl.notes
 from  role_conf  rl
       join element_conf  ec
            on  ec.element_name = 'ROLE';

--  Comments

--DBMS_METADATA:ODBCAPTURE.UOR_INSTALL_VIEW


--  Grants


--  Synonyms


set define on

----------------------------------------
-- PACKAGE BODY Install

prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/COMMON_UTIL.pkbsql
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.COMMON_UTIL Package Body
--

set define off


--DBMS_METADATA:ODBCAPTURE.COMMON_UTIL

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "ODBCAPTURE"."COMMON_UTIL" 
as

------------------------------------------------------------
-- Add SYS Grants File Header to Script File
procedure add_sysgrants_file_header
      (fh  in out nocopy  fh2.sf_ptr_type)
is
begin
   fh2.script_put_line(fh, '');
   fh2.script_put_line(fh, '');
   fh2.script_put_line(fh, '--');
   fh2.script_put_line(fh, '--  Future Grant SYS Objects (but not directories)');
   fh2.script_put_line(fh, '--');
   fh2.script_put_line(fh, '');
   fh2.script_put_line(fh, 'set define off');
   fh2.script_put_line(fh, '');
end add_sysgrants_file_header;


------------------------------------------------------------
-- Add Grants File Header to Script File
procedure add_grants_file_header
      (fh          in out nocopy  fh2.sf_ptr_type
      ,in_grantee  in             varchar2)
is
begin
   fh2.script_put_line(fh, '');
   fh2.script_put_line(fh, '');
   fh2.script_put_line(fh, '--');
   fh2.script_put_line(fh, '--  Create ' || in_grantee || ' Grants');
   fh2.script_put_line(fh, '--');
   fh2.script_put_line(fh, '');
   fh2.script_put_line(fh, 'set define off');
   fh2.script_put_line(fh, '');
end add_grants_file_header;


------------------------------------------------------------
-- Set DBMS_METADATA Transformation Parameters
procedure dbms_metadata_settings
is
begin
   -- http://docs.oracle.com/database/121/ARPLS/d_metada.htm#ARPLS66910
   for buff in (select * from metadata_transform_params)
   loop
      case buff.value_type
         when 'BOOLEAN' then
            dbms_metadata.set_transform_param
               (transform_handle => dbms_metadata.session_transform
               ,name             => buff.name
               ,value            => regexp_like(buff.value, '^[TY]', 'i'));
         when 'NUMBER' then
            dbms_metadata.set_transform_param
               (transform_handle => dbms_metadata.session_transform
               ,name             => buff.name
               ,value            => to_number(buff.value));
         when 'VARCHAR' then
            dbms_metadata.set_transform_param
               (transform_handle => dbms_metadata.session_transform
               ,name             => buff.name
               ,value            => buff.value);
      end case;
   end loop;
end dbms_metadata_settings;


------------------------------------------------------------
-- RPAD changed to include truncate.
-- This function brings back the old functionality.
function old_rpad
      (in_expr1  in varchar2
      ,in_n      in number
      ,in_expr2  in varchar2 default null)
   return varchar2
is
begin
   if in_expr1 is null or length(in_expr1) >= in_n
   then
      return in_expr1;
   end if;
   return rpad(in_expr1, in_n, nvl(in_expr2,' '));
end old_rpad;

------------------------------------------------------------
-- Return RECYCLE_BIN_PATTERN for SQL Queries
function get_RECYCLE_BIN_PATTERN
   return varchar2
is
begin
   return RECYCLE_BIN_PATTERN;
end get_RECYCLE_BIN_PATTERN;


------------------------------------------------------------
-- Add linefeeds before MAXIMUM_SQL_LENGTH at commas, if possible.
function split_sql_length
      (in_str  IN CLOB)
   return CLOB
is
   olen     number;           -- Original Length of IN_STR
   ptr      number;           -- Current Position in IN_STR
   out_str  CLOB;             -- Output String
   oset     number;           -- Line Cut-off at the comma
begin
   olen    := length(in_str);
   ptr     := 1;
   out_str := '';
   while olen - ptr + 1 > MAXIMUM_SQL_LENGTH
   loop
      oset := instr(substr(in_str, ptr, MAXIMUM_SQL_LENGTH), LF, -1);
      if oset <= 0
      then
         oset := instr(substr(in_str, ptr, MAXIMUM_SQL_LENGTH), ',', -1);
         if oset <= 0
         then
            raise_application_error(-20000
                                   ,substr('Unable to find "," in string: ' ||
                                            substr(in_str, ptr, MAXIMUM_SQL_LENGTH)
                                          ,1,4000                              ) );
         end if;
         out_str := out_str || substr(substr(in_str, ptr, MAXIMUM_SQL_LENGTH), 1, oset) || LF;
      else
         out_str := out_str || substr(substr(in_str, ptr, MAXIMUM_SQL_LENGTH), 1, oset);
      end if;
      ptr   := ptr + oset;
   end loop;
   return(out_str || substr(in_str, ptr, MAXIMUM_SQL_LENGTH));
end split_sql_length;


------------------------------------------------------------
-- Must escape "@" with a CHR(16): ^P, Control-P, DLE
--   Otherwise, SQL*Plus will attempt to run a script
function escape_at_sign
      (in_str      IN   CLOB)
   return CLOB
is
begin
   return regexp_replace(in_str, '('||LF||'[[:space:]]*)@', '\1'||CHR(16)||'@');
end escape_at_sign;


------------------------------------------------------------
-- Check for invalid Windows characters in filenames
--
--http://stackoverflow.com/questions/1976007/what-characters-are-forbidden-in-windows-and-linux-directory-names
-- < (less than)
-- > (greater than)
-- : (colon)
-- " (double quote)
-- / (forward slash)
-- \ (backslash)
-- | (vertical bar or pipe)
-- ? (question mark)
-- * (asterisk)
--
procedure check_windows_filenames
      (in_build_type  in varchar2)
is
begin
   for buff in (
      select obj.object_owner || '.' || obj.object_name || '(' || obj.object_type || ')'  oname
       from  dba_objects_tab  obj
             join element_conf  otl
                  on  otl.name_check_object_type = obj.object_type
       where (   obj.object_type != 'TYPE'
              or obj.object_name not like SYS_TYPE_REGEXP escape '\')
        and  regexp_like (obj.object_name, '[<>:"/\|?*]')
        and  obj.object_name not like RECYCLE_BIN_PATTERN escape '\'
        order by obj.object_owner, obj.object_name, obj.object_type)
   loop
      raise_application_error (-20000,
         'Found Forbidden Windows Filename Character in ' || buff.oname);
   end loop;
   -- Several Object Types have Sub-Object Types.
   --   Also this is not necessary for Linux.  It is only a problem for Windows
   for buff in (
      select obj.object_owner
            ,upper(obj.object_name)   object_name
            ,obj.object_type
            ,count(*)                 num_names
       from  dba_objects_tab  obj
       where obj.object_owner_build_type = in_build_type
        and  obj.object_type in (select otl.name_check_object_type from element_conf otl)
        and  (   obj.object_type != 'TYPE'
              or obj.object_name not like SYS_TYPE_REGEXP escape '\')
        and  obj.object_name not like RECYCLE_BIN_PATTERN escape '\'
       group by obj.object_owner, upper(obj.object_name), obj.object_type
       having count(*) > 1
       order by obj.object_owner, upper(obj.object_name), obj.object_type)
   loop
      raise_application_error (-20000,
         'Schema ' || buff.object_owner || ' has ' ||
                      buff.num_names    || ' ' ||
                      buff.object_type  || 's with a name like ' ||
                      buff.object_name  );
   end loop;
end check_windows_filenames;


-------------------------------------------
-- Refresh Data Tables
procedure update_view_tabs
is
   --
   procedure do_it (in_text varchar2) is
      dbi_beg_secs    number := dbms_utility.get_time;
   begin
      --dbms_output.put_line(in_text);
      execute immediate in_text;
      dbms_output.put_line('SUCCESS(' || to_char(SQL%ROWCOUNT,'B9999') ||
                          ' rows in ' || substr(to_char((dbms_utility.get_time -
                                                         dbi_beg_secs
                                                        )/100
                                                       ,'B99.9')
                                               ,2   -- Remove Leading space (sign is not needed)
                                               ,100) ||
                            ' sec): ' || substr(in_text,1,100)  );
   exception when others then
      raise_application_error (-20000, 'FAILED: ' || SQLERRM || CHR(10) ||
                                       substr(in_text,1,100) || CHR(10) ||
                                       dbms_utility.format_error_backtrace);
   end do_it;
   --
   procedure update_build_type_timing is
      dbi_beg_secs    number      := dbms_utility.get_time;
      num_rows        pls_integer := 0;
   begin
      for buff in (select build_type from build_conf)
      loop
         insert into build_type_timing (from_build_type, build_timing, to_build_type)
         with qcur as (
         select buff.build_type                  FROM_BUILD_TYPE
               ,'CURRENT'                        BUILD_TIMING
               ,t.build_type                     TO_BUILD_TYPE
          from  build_path  m
                join build_conf  t
                     on  t.build_seq = m.build_seq
          connect by prior m.parent_build_seq = m.build_seq
          start with t.build_type = buff.build_type
         ), qfut as (
         select buff.build_type                  FROM_BUILD_TYPE
               ,'FUTURE'                         BUILD_TIMING
               ,t.build_type                     TO_BUILD_TYPE
          from  build_path  m
                join build_conf  t
                     on  t.build_seq = m.parent_build_seq
          connect by m.parent_build_seq = prior m.build_seq
          start with t.build_type = buff.build_type
         )
         select FROM_BUILD_TYPE, BUILD_TIMING, TO_BUILD_TYPE from qcur
         UNION
         select FROM_BUILD_TYPE, BUILD_TIMING, TO_BUILD_TYPE from qfut
          where TO_BUILD_TYPE != buff.build_type
         UNION
         select buff.build_type       FROM_BUILD_TYPE
               ,'CURRENT'             BUILD_TIMING
               ,'sys'                 TO_BUILD_TYPE
          from  dual;
         num_rows := num_rows + SQL%ROWCOUNT;
      end loop;
      dbms_output.put_line('SUCCESS(' || to_char(num_rows,'B9999') ||
                          ' rows in ' || substr(to_char((dbms_utility.get_time -
                                                         dbi_beg_secs
                                                        )/100
                                                       ,'B99.9')
                                               ,2   -- Remove Leading space (sign is not needed)
                                               ,100) ||
                            ' sec): update_build_type_timing');
   exception when others then
      raise_application_error (-20000, 'update_build_type_timing FAILED: ' || SQLERRM);
   end update_build_type_timing;
   --
begin
   dbms_output.put_line('Running ' || $$PLSQL_UNIT || '.update_view_tabs');
   --
   dbms_output.put_line('');
   grab_scripts.set_installed_types;
   dbms_output.put_line('');
   --
   do_it('truncate table schema_objects_tab');
   do_it('truncate table obj_install_comments_tab');
   do_it('truncate table obj_install_trigger_tab');
   do_it('truncate table obj_install_synonym_tab');
   do_it('truncate table obj_install_data_load_tab');
   do_it('truncate table obj_install_index_tab');
   do_it('truncate table obj_install_fkey_tab');
   do_it('truncate table obj_install_context_tab');
   do_it('truncate table obj_install_object_tab');
   do_it('truncate table dba_dependencies_tab');
   do_it('truncate table dba_tab_privs_tab');
   do_it('truncate table dba_objects_tab');
   --
   do_it('truncate table build_type_timing');
   update_build_type_timing;
   --
   do_it('insert into dba_objects_tab           select * from dba_objects_view');
   do_it('insert into dba_tab_privs_tab         select * from dba_tab_privs_view');
   do_it('insert into dba_dependencies_tab      select * from dba_dependencies_view');
   do_it('insert into obj_install_object_tab    select * from obj_install_object_view');
   do_it('insert into obj_install_context_tab   select * from obj_install_context_view');
   do_it('insert into obj_install_fkey_tab      select * from obj_install_fkey_view');
   do_it('insert into obj_install_index_tab     select * from obj_install_index_view');
   do_it('insert into obj_install_data_load_tab select * from obj_install_data_load_view');
   do_it('insert into obj_install_synonym_tab   select * from obj_install_synonym_view');
   do_it('insert into obj_install_trigger_tab   select * from obj_install_trigger_view');
   do_it('insert into obj_install_comments_tab  select * from obj_install_comments_view');
   --
   -- DISTINCT is required instead of GROUP BY for Oracle Database
   --   23ai Free Release 23.0.0.0.0 - Develop, Learn, and Run for Free Version 23.4.0.24.05
   --
   do_it('insert into schema_objects_tab (BUILD_TYPE,     OBJECT_OWNER,     ELEMENT_NAME) ' || CHR(10) ||
         'select DISTINCT                 build_type,    context_owner,     element_name  ' || CHR(10) ||
         ' from obj_install_context_tab' );
   --
   do_it('insert into schema_objects_tab (BUILD_TYPE,     OBJECT_OWNER,     ELEMENT_NAME) ' || CHR(10) ||
         'select DISTINCT                 build_type,      table_owner,     element_name  ' || CHR(10) ||
         ' from obj_install_data_load_tab' );
   --
   do_it('insert into schema_objects_tab (BUILD_TYPE,     OBJECT_OWNER,     ELEMENT_NAME) ' || CHR(10) ||
         'select DISTINCT                 build_type, base_table_owner,     element_name  ' || CHR(10) ||
         ' from obj_install_fkey_tab' );
   --
   do_it('insert into schema_objects_tab (BUILD_TYPE,     OBJECT_OWNER,     ELEMENT_NAME) ' || CHR(10) ||
         'select DISTINCT                 build_type,      index_owner,     element_name  ' || CHR(10) ||
         ' from obj_install_index_tab' );
   --
   do_it('insert into schema_objects_tab (BUILD_TYPE,     OBJECT_OWNER,     ELEMENT_NAME) ' || CHR(10) ||
         'select DISTINCT             obj.build_type, obj.object_owner, obj.element_name  ' || CHR(10) ||
         ' from obj_install_object_tab  obj '                                               || CHR(10) ||
         '      join schema_conf  own '                                                     || CHR(10) ||
         '           on  own.username = obj.object_owner '                                  || CHR(10) ||
         '           and own.oracle_provided = ''N'' '                                      || CHR(10) ||  -- Exclude Oracle Provided objects
         ' where obj.object_type not in (''INDEX'', ''SYNONYM'', ''TRIGGER'')' );
   --
   do_it('insert into schema_objects_tab (BUILD_TYPE,     OBJECT_OWNER,     ELEMENT_NAME) ' || CHR(10) ||
         'select DISTINCT                 build_type,    synonym_owner,     element_name  ' || CHR(10) ||
         ' from obj_install_synonym_TAB' );
   --
   do_it('insert into schema_objects_tab (BUILD_TYPE,     OBJECT_OWNER,     ELEMENT_NAME) ' || CHR(10) ||
         'select DISTINCT                 build_type,    trigger_owner,     element_name  ' || CHR(10) ||
         ' from obj_install_trigger_tab' );
   --
   do_it('insert into schema_objects_tab (BUILD_TYPE,     OBJECT_OWNER,     ELEMENT_NAME) ' || CHR(10) ||
         'select DISTINCT                 build_type,          grantee,     element_name  ' || CHR(10) ||
         ' from priv_obj_dir_view' );
   --
   do_it('insert into schema_objects_tab (BUILD_TYPE,     OBJECT_OWNER,     ELEMENT_NAME) ' || CHR(10) ||
         'select DISTINCT                 build_type,          grantee,     element_name  ' || CHR(10) ||
         ' from priv_obj_hacl_view' );
   --
   do_it('insert into schema_objects_tab (BUILD_TYPE,     OBJECT_OWNER,     ELEMENT_NAME) ' || CHR(10) ||
         'select DISTINCT                 build_type,          grantee,     element_name  ' || CHR(10) ||
         ' from priv_obj_queue_view' );
   --
   do_it('insert into schema_objects_tab (BUILD_TYPE,     OBJECT_OWNER,     ELEMENT_NAME) ' || CHR(10) ||
         'select DISTINCT                 build_type,          grantee,     element_name  ' || CHR(10) ||
         ' from priv_obj_wacl_view' );
   --
   do_it('insert into schema_objects_tab (BUILD_TYPE,     OBJECT_OWNER,     ELEMENT_NAME) ' || CHR(10) ||
         'select DISTINCT                 build_type,          grantee,     element_name  ' || CHR(10) ||
         ' from priv_queue_sysprivs_view' );
   --
   if grab_scripts.installed_types_aa.EXISTS('grbras')
   then
      do_it('insert into schema_objects_tab (BUILD_TYPE,     OBJECT_OWNER,     ELEMENT_NAME) ' || CHR(10) ||
            'select DISTINCT                 build_type,            owner,     element_name  ' || CHR(10) ||
            ' from priv_obj_racl_view' );
   end if;
   --
   commit;
   --
   do_it('begin sys.dbms_stats.gather_table_stats(ownname => ''ODBCAPTURE'', tabname => ''DBA_OBJECTS_TAB'',           cascade => TRUE); end;');
   do_it('begin sys.dbms_stats.gather_table_stats(ownname => ''ODBCAPTURE'', tabname => ''DBA_TAB_PRIVS_TAB'',         cascade => TRUE); end;');
   do_it('begin sys.dbms_stats.gather_table_stats(ownname => ''ODBCAPTURE'', tabname => ''DBA_DEPENDENCIES_TAB'',      cascade => TRUE); end;');
   do_it('begin sys.dbms_stats.gather_table_stats(ownname => ''ODBCAPTURE'', tabname => ''OBJ_INSTALL_OBJECT_TAB'',    cascade => TRUE); end;');
   do_it('begin sys.dbms_stats.gather_table_stats(ownname => ''ODBCAPTURE'', tabname => ''OBJ_INSTALL_CONTEXT_TAB'',   cascade => TRUE); end;');
   do_it('begin sys.dbms_stats.gather_table_stats(ownname => ''ODBCAPTURE'', tabname => ''OBJ_INSTALL_FKEY_TAB'',      cascade => TRUE); end;');
   do_it('begin sys.dbms_stats.gather_table_stats(ownname => ''ODBCAPTURE'', tabname => ''OBJ_INSTALL_INDEX_TAB'',     cascade => TRUE); end;');
   do_it('begin sys.dbms_stats.gather_table_stats(ownname => ''ODBCAPTURE'', tabname => ''OBJ_INSTALL_DATA_LOAD_TAB'', cascade => TRUE); end;');
   do_it('begin sys.dbms_stats.gather_table_stats(ownname => ''ODBCAPTURE'', tabname => ''OBJ_INSTALL_SYNONYM_TAB'',   cascade => TRUE); end;');
   do_it('begin sys.dbms_stats.gather_table_stats(ownname => ''ODBCAPTURE'', tabname => ''OBJ_INSTALL_TRIGGER_TAB'',   cascade => TRUE); end;');
   do_it('begin sys.dbms_stats.gather_table_stats(ownname => ''ODBCAPTURE'', tabname => ''OBJ_INSTALL_COMMENTS_TAB'',  cascade => TRUE); end;');
   do_it('begin sys.dbms_stats.gather_table_stats(ownname => ''ODBCAPTURE'', tabname => ''SCHEMA_OBJECTS_TAB'',        cascade => TRUE); end;');
   commit;
   --
   do_it('purge recyclebin');
   --
end update_view_tabs;


-------------------------------------------
-- Base64 Encoding
function b64_encode
      (in_blob     in BLOB
      ,in_add_hdr  in boolean default FALSE)
   return CLOB
is
   SPLIT_LEN   constant pls_integer  := 21843;    -- Must be divisible by 3
   l_clob               clob;
   len_blob             pls_integer;
   ptr                  pls_integer;
begin
   if in_blob is null then return null; end if;
   len_blob := length(in_blob);
   if len_blob = 0 then return empty_clob(); end if;
   dbms_lob.createtemporary(l_clob, true);
   if in_add_hdr
   then
      dbms_lob.append(l_clob, BASE64_ENCODE_HEADER || chr(10));
   end if;
   ptr := 1;
   while ptr <= len_blob
   loop
      dbms_lob.append(l_clob
                     ,UTL_RAW.CAST_TO_VARCHAR2(UTL_ENCODE.BASE64_ENCODE(dbms_lob.substr(in_blob
                                                                                       ,SPLIT_LEN
                                                                                       ,ptr
                                                                       )               )
                     )                        );
      ptr := ptr + SPLIT_LEN;
   end loop;
   return l_clob || CHR(10);
end b64_encode;


end common_util;
/

set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/FH2.pkbsql
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.FH2 Package Body
--

set define off


--DBMS_METADATA:ODBCAPTURE.FH2

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "ODBCAPTURE"."FH2" 
as

--
-- Table of Functions/Procedures
--
-- Script Handling Utilities
--  -) function script_is_open
--  -) PROCEDURE script_close_all
--  -) function script_open
--  -) procedure script_put
--  -) procedure script_put_line
--  -) PROCEDURE script_new_line
--  -) PROCEDURE script_close
--  -) procedure put_big_line
--  -) procedure remove_storage_clause
-- PUBLIC API
--  -) procedure write_scripts
--  -) procedure clear_buffers
--  -) function get_version
--


------------------------------------------------------------
---   Script Handling Utilities  ---
------------------------------------------------------------


-----------------------------------------------------
--  Check if a Script File is Open
function script_is_open
      (file   in fh2.sf_ptr_type)
   return boolean
is
begin
   return sf_aa.exists(file.bld_type)
      and sf_aa(file.bld_type).exists(file.bld_ord)
      and sf_aa(file.bld_type)(file.bld_ord).exists(file.file_id)
      and sf_aa(file.bld_type)(file.bld_ord)(file.file_id).is_open = 'Y';
end script_is_open;

-----------------------------------------------------
--  Close all Script Files
PROCEDURE script_close_all
is
   bld_ord   pls_integer;
   file_id    pls_integer;
begin
   if NOT sf_aa.EXISTS(grab_scripts.g_build_type)
   then
      return;
   end if;
   -- ELEMENT SEQ Loop
   bld_ord := sf_aa(grab_scripts.g_build_type).FIRST;
   <<DIR_LOOP>>
   loop
      -- File ID
      file_id := sf_aa(grab_scripts.g_build_type)(bld_ord).FIRST;
      <<FILE_LOOP>>
      loop
         --
         if sf_aa(grab_scripts.g_build_type)(bld_ord)(file_id).is_open = 'Y'
         then
            sf_aa(grab_scripts.g_build_type)(bld_ord)(file_id).is_open := 'N';
            dbms_output.put_line('SCRIPT_CLOSE_ALL: bld_type: ' || grab_scripts.g_build_type ||
                                                 ', bld_ord: '  || bld_ord ||
                                                 ', file_id: '   || file_id ||
                                                 ' was open.'    );
         end if;
         --
         exit FILE_LOOP when file_id = sf_aa(grab_scripts.g_build_type)(bld_ord).LAST;
         file_id := sf_aa(grab_scripts.g_build_type)(bld_ord).NEXT(file_id);
      end loop;  --FILE_LOOP
      --
      exit DIR_LOOP when bld_ord = sf_aa(grab_scripts.g_build_type).LAST;
      bld_ord := sf_aa(grab_scripts.g_build_type).NEXT(bld_ord);
   end loop;  --DIR_LOOP
end script_close_all;

-----------------------------------------------------
--  Open a Script File
function script_open
      (in_filename      in varchar2
      ,in_elmnt         in varchar2
      ,in_max_linesize  in binary_integer default 1024)
   return fh2.sf_ptr_type
is
   sf_ptr       fh2.sf_ptr_type;
   schema_name  varchar2(128);
   filename     varchar2(500);
   init_sf_aa   boolean;
   ----------------------------------------
   -- Find the ELEMENT SEQ for the in_elmnt
   procedure get_element_seq is
   begin
      sf_ptr.bld_ord := null;
      select element_seq into sf_ptr.bld_ord
       from  element_conf
       where element_name = in_elmnt;
   exception when OTHERS
   then
      script_close_all;
      raise_application_error(-20000, 'in_elmnt "' || in_elmnt ||
         '" not found in ELEMENT_CONF in script_open function' || LF ||
         SQLERRM);
   end get_element_seq;
   ----------------------------------------
   -- Find the File ID for the sf_ptr.bld_ord, and filename
   procedure get_file_id is
      file_id    pls_integer;
   begin
      -- Find Filename in Script File Array
      file_id := sf_aa(grab_scripts.g_build_type)(sf_ptr.bld_ord).FIRST;
      loop
         if    (   sf_aa(grab_scripts.g_build_type)(sf_ptr.bld_ord)(file_id).schema_name = schema_name
                OR (    sf_aa(grab_scripts.g_build_type)(sf_ptr.bld_ord)(file_id).schema_name is null
                    AND                                                 schema_name is null) )
           AND sf_aa(grab_scripts.g_build_type)(sf_ptr.bld_ord)(file_id).filename = filename
         then
            sf_ptr.file_id := file_id;
            if script_is_open(sf_ptr)
            then
               raise_application_error(-20000, 'Script Name: "' || grab_scripts.g_build_type ||
                                                            '/' || schema_name ||
                                                            '/' || filename ||
                                                   '" (ELMNT: ' || in_elmnt ||
                                            ') is already open.');
            end if;
            exit;
         end if;
         --
         exit when file_id = sf_aa(grab_scripts.g_build_type)(sf_ptr.bld_ord).LAST;
         file_id := sf_aa(grab_scripts.g_build_type)(sf_ptr.bld_ord).NEXT(file_id);
      end loop;
   end get_file_id;
begin
   sf_ptr.bld_type := grab_scripts.g_build_type;
   -- Set the Schema Name
   schema_name := case when grab_scripts.g_schema_name is null    then NULL
                       when grab_scripts.g_schema_name = 'PUBLIC' then 'SYSTEM'
                                                                  else grab_scripts.g_schema_name
                  end;
   -- Get the ELEMENT SEQ to sf_ptr
   get_element_seq;
   -- Starting from Oracle Database release 19c, version 19.3, file names
   --   with the $ character will no longer run on Windows.
   if instr(in_filename,'$') != 0
   then
      --dbms_output.put_line('  Warning: Changed "$" to "_" in filename: ' || in_filename);
      raise_application_error(-20000,'File names with the $ character will no longer run on Windows: ' || in_filename);
   end if;
   -- Windows also has trouble with "%" in a script name
   --    https://docs.oracle.com/en/database/oracle/oracle-database/23/sqlrf/Database-Object-Names-and-Qualifiers.html
   --    Quoted identifiers can contain any characters and punctuations marks as well as spaces
   if instr(in_filename,'%') != 0
   then
      --dbms_output.put_line('  Warning: Changed "%" to "_" in filename: ' || in_filename);
      raise_application_error(-20000,'Windows also has trouble with "%" in a script name: ' || in_filename);
   end if;
   -- Set Filename
   --  (This "replace(replace(" has been moved to the calling procedure.)
   --  filename := replace(replace(in_filename,'$','_'),'%','_');
   filename := in_filename;
   dbms_output.put_line('Script Open: ' || grab_scripts.g_build_type ||
                                    '/' || schema_name    ||
                                    '/' || filename       );
   -- Find File ID
   sf_ptr.file_id := null;
   if     sf_aa.EXISTS(grab_scripts.g_build_type)
      AND sf_aa(grab_scripts.g_build_type).EXISTS(sf_ptr.bld_ord)
   then
      -- Get the File ID for sf_ptr
      get_file_id;
      if sf_ptr.file_id is not null
      then
         sf_ptr.num_lines := sf_aa(sf_ptr.bld_type)(sf_ptr.bld_ord)(sf_ptr.file_id).num_buffers;
         init_sf_aa       := FALSE;
         sf_aa(sf_ptr.bld_type)(sf_ptr.bld_ord)(sf_ptr.file_id).is_open := 'Y';
      else
         sf_ptr.file_id   := sf_aa(sf_ptr.bld_type)(sf_ptr.bld_ord).COUNT + 1;
         sf_ptr.num_lines := 1;
         init_sf_aa       := TRUE;
      end if;
   else
      sf_ptr.file_id   := 1;
      sf_ptr.num_lines := 1;
      init_sf_aa       := TRUE;
   end if;
   if init_sf_aa
   then
      sf_aa(sf_ptr.bld_type)(sf_ptr.bld_ord)(sf_ptr.file_id).max_linesize := in_max_linesize;
      sf_aa(sf_ptr.bld_type)(sf_ptr.bld_ord)(sf_ptr.file_id).total_bytes  := 0;
      sf_aa(sf_ptr.bld_type)(sf_ptr.bld_ord)(sf_ptr.file_id).num_buffers  := 1;
      sf_aa(sf_ptr.bld_type)(sf_ptr.bld_ord)(sf_ptr.file_id).is_open      := 'Y';
      sf_aa(sf_ptr.bld_type)(sf_ptr.bld_ord)(sf_ptr.file_id).schema_name  := schema_name;
      sf_aa(sf_ptr.bld_type)(sf_ptr.bld_ord)(sf_ptr.file_id).filename     := filename;
      sf_aa(sf_ptr.bld_type)(sf_ptr.bld_ord)(sf_ptr.file_id).buffer_aa(1).len := 0;
   end if;
   return sf_ptr;
end script_open;

-----------------------------------------------------
--  Add Characters to a Script File
procedure script_put
      (file       IN OUT NOCOPY fh2.sf_ptr_type
      ,buffer     IN            VARCHAR2)
is
   SEARCH_STRING CONSTANT varchar2(30) := '[^' || chr(1) || '-' || chr(127) || ']';
   len           number(5);
   ascii_buffer  varchar2(32767);
begin
   --
   if nvl(lengthb(buffer),0) <= 0
   then
      return;
   end if;
   ascii_buffer := regexp_replace(buffer, SEARCH_STRING, '?');
   len := length(ascii_buffer);
   --dbms_output.put_line('/'||file.bld_ord||'/'||file.file_id||'('||file.num_lines||')len='||len||
   --                     '('||sf_aa(file.bld_ord)(file.file_id).buffer_aa(file.num_lines).len||')');
   --
   if sf_aa(file.bld_type)(file.bld_ord)(file.file_id).max_linesize >
      sf_aa(file.bld_type)(file.bld_ord)(file.file_id).buffer_aa(file.num_lines).len + len
   then
      --
      sf_aa(file.bld_type)(file.bld_ord)(file.file_id).buffer_aa(file.num_lines).buffer    :=
      sf_aa(file.bld_type)(file.bld_ord)(file.file_id).buffer_aa(file.num_lines).buffer || ascii_buffer;
      --
      sf_aa(file.bld_type)(file.bld_ord)(file.file_id).buffer_aa(file.num_lines).len   :=
      sf_aa(file.bld_type)(file.bld_ord)(file.file_id).buffer_aa(file.num_lines).len + len;
      --
   else
      --
      file.num_lines := file.num_lines + 1;
      sf_aa(file.bld_type)(file.bld_ord)(file.file_id).num_buffers := file.num_lines;
      --
      sf_aa(file.bld_type)(file.bld_ord)(file.file_id).buffer_aa(file.num_lines).buffer := ascii_buffer;
      sf_aa(file.bld_type)(file.bld_ord)(file.file_id).buffer_aa(file.num_lines).len    := len;
      --
   end if;
   --
   sf_aa(file.bld_type)(file.bld_ord)(file.file_id).total_bytes   :=
   sf_aa(file.bld_type)(file.bld_ord)(file.file_id).total_bytes + len;
   --
exception when others then
   raise_application_error(-20000,
      substr('script_put error: len = ' || len || LF ||
             '  sf_aa('||file.bld_type||')('||file.bld_ord||')('||file.file_id||').buffer_aa('||file.num_lines||').len = ' ||
                sf_aa(   file.bld_type   )(   file.bld_ord   )(   file.file_id   ).buffer_aa(   file.num_lines   ).len || LF ||
             '  sf_aa('||file.bld_type||')('||file.bld_ord||')('||file.file_id||').max_linesize = ' ||
                sf_aa(   file.bld_type   )(   file.bld_ord   )(   file.file_id   ).max_linesize || LF ||
              SQLERRM || LF || dbms_utility.format_error_backtrace || dbms_utility.format_call_stack ||
             '|' || ascii_buffer || '|'
             ,1,2000));
end script_put;

-----------------------------------------------------
--  Add a Line to a Script File
procedure script_put_line
      (file       IN OUT NOCOPY fh2.sf_ptr_type
      ,buffer     IN            VARCHAR2)
is
begin
   script_put(file, buffer || LF);
end script_put_line;

-----------------------------------------------------
--  Add a Line to a Script File
PROCEDURE script_new_line
      (file  IN OUT NOCOPY fh2.sf_ptr_type
      ,lines IN     NATURAL default 1)
is
   buff  varchar2(4000);
begin
   for i in 1 .. lines
   loop
      buff := buff || LF;
   end loop;
   script_put(file, buff);
end script_new_line;

-----------------------------------------------------
--  Close a Script File
PROCEDURE script_close
      (file   IN OUT NOCOPY fh2.sf_ptr_type)
is
begin
   sf_aa(file.bld_type)(file.bld_ord)(file.file_id).is_open := 'N';
end script_close;

------------------------------------------------------------
-- Put Big Line
--
procedure put_big_line
      (in_fh      in out NOCOPY fh2.sf_ptr_type
      ,in_loc     in            varchar2
      ,in_txt     in            CLOB
      ,in_max_len in            number)
is
   orig_len  number;         -- Original Length of IN_TXT
   ptr       number;         -- Current Position in IN_TXT
   ptr_len   number;         -- Length of IN_TXT from PTR, including PTR
   oset      number;         -- Candidate Offset from PTR
   oset_len   number;        -- Length of IN_TXT from PTR to OSET,
                             --   including PTR but excluding OSET
begin
   orig_len := DBMS_LOB.GETLENGTH(in_txt);
   oset := 0;
   loop
      -- Update PTR
      ptr     := oset + 1;
      ptr_len := orig_len - ptr + 1;
      -- Find a linefeed.
      oset := instr(in_txt, LF, ptr);
      -- Exit if no more LF and line is small enough.
      -- To process all LF, don't exit loop until here.
      exit when oset = 0 and ptr_len <= in_max_len;
      -- oset_len does not include LF
      oset_len := oset - ptr;
      -- Allow for empty line
      if oset_len between 0 and in_max_len
      then
         -- Small enough
         if substr(in_txt, oset-1, 1) = CRTN
         then
            -- Remove the CRTN and the LF.
            script_put_line(in_fh, substr(in_txt, ptr, oset_len-1));
         else
            script_put_line(in_fh, substr(in_txt, ptr, oset_len));
         end if;
      else
         -- Cut-off the line
         oset := in_max_len + ptr - 1;
         script_put_line(in_fh, substr(in_txt, ptr, in_max_len));
         script_put_line(in_fh, '---------- The previous line was cut-off at ' ||
                                in_max_len || ' characters.  ----------' );
         --raise_application_error
         --   (-20000, substr('Line too long, exceeds ' ||
         --                    in_max_len || ' characters at location "' ||
         --                    substr(in_loc, 1, 150) || '"' || LF ||
         --                    substr(in_txt, ptr)
         --                  ,1,2000) );
      end if;
   end loop;
   -- IN_TXT remaining is shorter than IN_MAX_LEN
  script_put_line(in_fh, substr(in_txt, ptr));
end put_big_line;

------------------------------------------------------------
-- Remove STORAGE_CLAUSE_PATTERN
procedure remove_storage_clause
      (in_fh       in out NOCOPY fh2.sf_ptr_type
      ,in_loc      in            varchar2
      ,in_txt      in            CLOB
      ,in_max_len  in            number)
is
   len     number := length(in_txt);
   ptr     number := 1;               -- Current Position in IN_TXT
   oset    number;                    -- Offset from PTR to next LF
begin
   while ptr <= len
   loop
      oset := instr(substr(in_txt, ptr),LF);
      if oset = 0
      then
         put_big_line(in_fh, in_loc, substr(in_txt, ptr), in_max_len);
         ptr := len + 1;
      else
         if substr(in_txt, ptr, oset-1) not like common_util.STORAGE_CLAUSE_PATTERN escape '\'
         then
            put_big_line(in_fh, in_loc, substr(in_txt, ptr, oset-1), in_max_len);
         end if;
      end if;
      ptr := ptr + oset;
   end loop;
end remove_storage_clause;


------------------------------------------------------------
---   PUBLIC API  ---
------------------------------------------------------------


------------------------------------------------------------
-- Write Scripts
procedure write_scripts
      (in_zip_file_name  in varchar2
      ,in_folder_name    in varchar2 default '')
is
   FH_BUFFER_SIZE  CONSTANT pls_integer := 32767;
   fh              UTL_FILE.FILE_TYPE;
   fh_ptr          pls_integer;
   bld_type       varchar2(10);
   bld_ord        pls_integer;
   file_id         pls_integer;
   schema_name     varchar2(128);
   dir_path        varchar2(256);
   filename        varchar2(500);
   root_dir_name   varchar2(128);
   zip_file_size   pls_integer;
   sql_txt         varchar2(4000);
   root_dir_path   varchar2(128);
   buffer_blob     BLOB;
   zipped_blob     BLOB;
begin
   dbms_output.put_line('Running ' || $$PLSQL_UNIT || '.write_scripts' ||
                             '(in_zip_file_name "' || in_zip_file_name ||
                           '", in_folder_name "'   || in_folder_name   || '")' );
   if in_zip_file_name is null
   then
      raise_application_error(-20000, 'No Zip File Specified');
   end if;
   if NOT sf_aa.COUNT > 0
   then
      raise_application_error(-20000, 'No files to write from Buffers: ' || sf_aa.COUNT);
   end if;
   ----------------------------------------------
   -- Write Scripts from sf_aa to ZIP_FILES Table
   -- Build Type Loop
   bld_type := sf_aa.FIRST;
   <<TYPE_LOOP1>>
   loop
      -- ELEMENT SEQ Loop
      bld_ord := sf_aa(bld_type).FIRST;
      <<ORD_LOOP1>>
      loop
         --
         -- File ID Loop
         file_id := sf_aa(bld_type)(bld_ord).FIRST;
         <<FILE_LOOP1>>
         loop
            --
            schema_name := sf_aa(bld_type)(bld_ord)(file_id).schema_name;
            dir_path    := bld_type;
            if schema_name is not null
            then
               dir_path := dir_path || '/' || schema_name;
            end if;
            filename    := sf_aa(bld_type)(bld_ord)(file_id).filename;
            if sf_aa(bld_type)(bld_ord)(file_id).is_open != 'N'
            then
               DBMS_OUTPUT.PUT_LINE('WARNING: ' || dir_path ||
                                            '/' || filename || ' was not closed');
            end if;
            --
            dbms_output.put(dir_path || '/' || filename ||
                           ' total_bytes: ' || sf_aa(bld_type)(bld_ord)(file_id).total_bytes);
            DBMS_LOB.CREATETEMPORARY(buffer_blob, FALSE);
            --
            -- BUFFER_LOOP
            for i in 1 .. sf_aa(bld_type)(bld_ord)(file_id).num_buffers
            loop
               DBMS_LOB.APPEND(buffer_blob
                              ,UTL_RAW.CAST_TO_RAW(sf_aa(bld_type)(bld_ord)(file_id).buffer_aa(i).buffer));
               dbms_output.put(', ' || i || ':' || sf_aa(bld_type)(bld_ord)(file_id).buffer_aa(i).len);
            end loop;  --BUFFER_LOOP
            dbms_output.put_line('.');
            --
            --  There should not be any leading "/" in "dir_path"
            --     ("bld_type" cannot be NULL because Associative Array Indexes cannot be NULL)
            zip_util_pkg.add_file(zipped_blob
                                 ,dir_path || '/' || filename
                                 ,buffer_blob);
            DBMS_LOB.TRIM(buffer_blob, 0);
            --
            exit FILE_LOOP1 when file_id = sf_aa(bld_type)(bld_ord).LAST;
            file_id := sf_aa(bld_type)(bld_ord).NEXT(file_id);
         end loop;  --FILE_LOOP1
         --
         exit ORD_LOOP1 when bld_ord = sf_aa(bld_type).LAST;
         bld_ord := sf_aa(bld_type).NEXT(bld_ord);
      end loop;  --ORD_LOOP1
      --
      exit TYPE_LOOP1 when bld_type = sf_aa.LAST;
      bld_type := sf_aa.NEXT(bld_type);
   end loop;  --TYPE_LOOP1
   --
   zip_util_pkg.finish_zip(zipped_blob);
   insert into zip_files
         (file_name
         ,file_size
         ,file_blob)
      values
         (in_zip_file_name
         ,DBMS_LOB.GETLENGTH(zipped_blob)
         ,zipped_blob);
   commit;
   if length(in_folder_name) > 0
   then
      ---------------------------------------
      -- Write Zip File to UTL_FILE
      select zf.file_size
       into  zip_file_size
       from  zip_files  zf
       where zf.file_name = in_zip_file_name;
      begin
         select dir.directory_name, dir.directory_path
          into      root_dir_name ,     root_dir_path
          from  dba_directories  dir
          where dir.directory_path = in_folder_name;
      exception
         when NO_DATA_FOUND
         then
            root_dir_name := 'GRAB_SCRIPTS_DIR';
            root_dir_path := in_folder_name;
            execute immediate 'create directory "' || root_dir_name ||
                              '" as ''' || root_dir_path || '''';
         when others
         then
            raise_application_error(-20000, 'Error with DIRECTORY_PATH: ' ||
                                            in_folder_name || '. ' || SQLERRM);
            DBMS_LOB.TRIM(zipped_blob, 0);
      end;
      dbms_output.put_line('Writing file "' || in_zip_file_name ||
                            '" to folder "' || root_dir_path    || '"');
      fh := utl_file.fopen(location     => root_dir_name
                          ,filename     => in_zip_file_name
                          ,open_mode    => 'wb'
                          ,max_linesize => FH_BUFFER_SIZE);
      fh_ptr := 1;
      while fh_ptr <= zip_file_size
      loop
         utl_file.put_raw(fh, dbms_lob.substr(zipped_blob, FH_BUFFER_SIZE, fh_ptr), TRUE);
         fh_ptr := fh_ptr + FH_BUFFER_SIZE;
      end loop;
      utl_file.fflush(fh);
      utl_file.fclose(fh);
   end if;
   --
   DBMS_LOB.TRIM(zipped_blob, 0);
end write_scripts;


------------------------------------------------------------
-- Report File Contents from Memory Array
procedure show_file
      (in_bld_type  in  varchar2
      ,in_element   in  varchar2)
is
   bld_ord        pls_integer;
   file_id         pls_integer;
begin
   select element_seq into bld_ord from element_conf
    where element_name = in_element;
   file_id := sf_aa(in_bld_type)(bld_ord).FIRST;
   dbms_output.put_line('FNAME: ' || sf_aa(in_bld_type)(bld_ord)(file_id).filename);
   loop
      for i in 1 .. sf_aa(in_bld_type)(bld_ord)(file_id).num_buffers
      loop
         dbms_output.put_line(sf_aa(in_bld_type)(bld_ord)(file_id).buffer_aa(i).buffer);
      end loop;
      exit when file_id = sf_aa(in_bld_type)(bld_ord).LAST;
      file_id := sf_aa(in_bld_type)(bld_ord).NEXT(file_id);
   end loop;
end show_file;


------------------------------------------------------------
-- Clear Buffers
procedure clear_buffers
      (in_build_type  in varchar2 default null)
is
begin
   if in_build_type is null
   then
      sf_aa.DELETE;
   else
      sf_aa(in_build_type).DELETE;
   end if;
end clear_buffers;


end fh2;
/

set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/GRAB_SCRIPTS.pkbsql
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.GRAB_SCRIPTS Package Body
--

set define off


--DBMS_METADATA:ODBCAPTURE.GRAB_SCRIPTS

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "ODBCAPTURE"."GRAB_SCRIPTS" 
as

--
-- Table of Functions/Procedures
--
-- Script Generating Procedures
--  -) procedure grb_object_grants       - Create Object Based Grant
--  -) procedure grb_future_sys_grants   - Create "Delayed" 'SYS' Object Grants
--  -) procedure grb_future_grants       - Create Future Grants
--  -) procedure grb_object_synonyms     - Create Object Based Synonym
--  -) procedure grb_future_synonyms     - Create Future Synonym
--  -) procedure grb_advanced_queues     - Create Advanced Queue
--  -) procedure grb_aq_tables           - Create Advanced Queue Table
--  -) procedure grb_application_context - Create Context
--  -) procedure grb_ras_acls            - Create Real Application Security ACLs
--  -) procedure grb_host_acls           - Create Host ACLs
--  -) procedure grb_wallet_acls         - Create Wallet ACLs
--  -) procedure grb_common
--     -) Create FUNCTION
--     -) Create PACKAGE_BODY
--     -) Create PACKAGE_SPEC
--     -) Create PROCEDURE
--     -) Create SCHEDULER_JOB
--     -) Create SCHEDULER_PROGRAM
--     -) Create SCHEDULER_SCHEDULE
--     -) Create SEQUENCE
--     -) Create TYPE_BODY
--     -) Create TYPE_SPEC
--  -) procedure grb_comp_data_loader    - Create Comprehensive Data Loader
--  -) procedure grb_database_links      - Create Database Link
--  -) procedure grb_database_triggers   - Create Database Trigger
--  -) procedure grb_directories         - Create Directory
--  -) procedure grb_foreign_keys        - Create Foreign Key
--  -) procedure grb_indexes             - Create Index
--  -) procedure grb_install_master      - Create Master Call Script
--  -) procedure grb_install_schemas     - Create Schema/Owner Call Script
--  -) procedure grb_install_sys         - Create SYS Call Script
--  -) procedure grb_install_system      - Create SYSTEM Call Script
--  -) procedure grb_materialized_views  - Create Materialized View
--  -) procedure grb_plsql_java          - Create PL/SQL Java Source
--  -) procedure grb_roles               - Create Role and 'SYS' Object Grants
--  -) procedure grb_tables              - Create Table
--  -) procedure grb_triggers            - Create Table/View Trigger
--  -) procedure grb_users               - Create User and 'SYS' Object Grants
--  -) procedure grb_user_triggers     - Create Schema Trigger
--  -) procedure grb_views               - Create View
-- Setup and Main Control
--  -) procedure initialize
--  -) procedure set_schema_name
--  -) procedure gen_installs
--  -) procedure gen_schemas
-- PUBLIC API
--  -) procedure all_scripts
--  -) function get_version
--


------------------------------------------------------------
---   Script Generating Procedures  ---
------------------------------------------------------------


------------------------------------------------------------
-- Get Object Grants for CURRENT, FUTURE is handled in grb_grnt
procedure grb_object_grants
      (in_fh           in out NOCOPY fh2.sf_ptr_type
      ,in_object_name  in            varchar2
      ,in_object_type  in            varchar2)
is
   --
   -- Oracle Database 12c Release 1 Database SQL Language Reference
   -- "on_object_clause"
   -- Users, directory schema objects, editions, data mining models, Java
   --   source and resource schema objects, and SQL translation profiles
   --   are identified separately because they reside in separate namespaces.
   --
   --  See Also: http://docs.oracle.com/database/121/SQLRF/sql_elements008.htm#SQLRF51129
   --
   --  "USER" Object Type not yet implemented.
   --
   sql_txt   varchar2(32767);
begin
   fh2.script_put_line(in_fh, '');
   fh2.script_put_line(in_fh, '--  Grants');
--   DBMS_METADATA.get_dependent_dll('OBJECT_GRANT') is VERY SLOW
--   fh2.script_put_line(in_fh, '--DBMS_METADATA:' || g_schema_name ||
--                                             '.' || in_object_name );
--   fh2.put_big_line(in_fh, dbms_metadata.get_dependent_ddl(object_type        => 'OBJECT_GRANT'
--                                                          ,base_object_name   => in_object_name
--                                                          ,base_object_schema => g_schema_name)  );
--   Note: EXECPTION BLOCK BELOW
   for buff in (select grantee
                      ,privilege
                      ,object_type
                      ,max(grantable)               GRANTABLE
                 from  priv_obj_install_vw   -- Includes PUBLIC Grantee, Does not Include SYS Owned Objects
                 where build_type   = g_build_type
                  and  build_timing = 'CURRENT'     -- Grantee installed before this Object
                  and  object_owner = g_schema_name
                  and  object_name  = in_object_name
                  and  object_type  = in_object_type
                 group by grantee
                      ,privilege
                      ,object_type
                 order by grantee
                      ,privilege
                      ,object_type)
   loop
      -- Directories are handled by "grb_directories"
      --when 'DIRECTORY'               then 'DIRECTORY '
      -- Grants are not implemented in ELEMENT_CONF
      -- https://docs.oracle.com/database/121/SQLRF/statements_9014.htm#SQLRF01603
      --when '(Data Mining) MODEL'     then 'MINING MODEL '
      --when 'SQL TRANSLATION PROFILE' then 'SQL TRANSLATION PROFILE '
      sql_txt := 'grant ' || buff.privilege ||     -- Taken from DBA_TAB_PRIVS SQL definition
                   ' on ' || case buff.object_type when 'JAVA CLASS'    then 'JAVA SOURCE "'   || g_schema_name  || '"."'
                                                   when 'JAVA SOURCE'   then 'JAVA SOURCE "'   || g_schema_name  || '"."'
                                                   when 'JAVA RESOURCE' then 'JAVA RESOURCE "' || g_schema_name  || '"."'
                                                   when 'EDITION'       then 'EDITION "'
                                                   when 'USER'          then 'USER "'
                                                                        else '"'               || g_schema_name  || '"."'
                             end                                                               || in_object_name ||
                 '" to "' || buff.grantee   || '"';
      -- Missing "with hierarchy option"...
      if buff.grantable = 'YES'
      then
         sql_txt := sql_txt || ' with grant option';
      end if;
     fh2.script_put_line(in_fh, sql_txt || ';');
   end loop;
   fh2.script_put_line(in_fh, '');
--exception
--   when DBMS_METADATA.object_not_found2
--   then
--      fh2.script_put_line(in_fh, '');
end grb_object_grants;

------------------------------------------------------------
-- Create Future SYS Grants
procedure grb_future_sys_grants
is
   ELMNT            CONSTANT varchar2(100) := 'SYS_GRANT';
   fh               fh2.sf_ptr_type;           -- object script file handle
   header_printed   boolean;
   sql_txt          varchar2(32767);
begin
   for buf1 in (with q1 as (
                select username                        GRANTEE
                      ,'_usr.'                         FILE_SUFFIX
                 from  schema_conf
                 where oracle_provided = 'N'
                UNION ALL
                select rolename                        GRANTEE
                      ,'_rol.'                         FILE_SUFFIX
                 from  role_conf
                       join element_conf  ec
                            on  ec.element_name = ELMNT
                 where oracle_provided = 'N'
                )
                select q1.grantee
                      ,replace(replace(q1.grantee,'$','_'),'%','_') ||
                       q1.file_suffix || ec.file_ext1  FILE_NAME
                 from  q1
                       join element_conf  ec
                            on  ec.element_name = ELMNT
                 order by q1.grantee)
   loop
      header_printed := FALSE;
      for buf2 in (select p1.object_owner
                         ,p1.object_name
                         ,p1.object_type
                         ,p1.privilege
                         ,max(p1.grantable)              GRANTABLE
                    from  priv_sysobj_privileges_view  p1
                    where p1.build_type   = g_build_type
                     and  p1.grantee      = buf1.grantee
                     and  p1.build_timing = 'FUTURE'
                     and  p1.object_type != 'DIRECTORY' -- All directories are owned by SYS
                          -- Keep LCR$ Logical Change Record
                          -- Keep AQ$ Queue Tables and Views
                          -- SYS_PLSQL Pipelined Type Objects are recreated automatically
                     and  p1.object_name  not like common_util.SYS_PIPELINE_PATTERN   escape '\'
                          -- Skip QT*_BUFFER Queue Views here. Grant Views with Advanced Queue
                          --   https://blogs.oracle.com/db/entry/oracle_support_master_note_for_troubleshooting_advanced_queuing_and_oracle_streams_propagation_issue
                          --   "Note that when queue table is created, a view called QT<nnn>_BUFFER is created in the SYS schema, and the queue table owner is given
                          --    SELECT privileges on it. The <nnn> corresponds to the object_id of the associated queue table"
                     and  p1.object_name  not like common_util.ADV_QUEUE_VIEW_PATTERN escape '\'
                    group by p1.object_owner
                         ,p1.object_name
                         ,p1.object_type
                         ,p1.privilege
                    order by p1.object_owner
                         ,p1.object_name
                         ,p1.object_type
                         ,p1.privilege)
      loop
         if NOT fh2.script_is_open(fh)
         then
            fh := fh2.script_open(in_filename     => buf1.file_name
                                 ,in_elmnt        => ELMNT
                                 ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
            common_util.add_sysgrants_file_header(fh);
         end if;
         if NOT header_printed
         then
            header_printed := TRUE;
            fh2.script_put_line(fh, '');
            fh2.script_put_line(fh, '');
            fh2.script_put_line(fh, '--  "SYS" Object Grants');
            fh2.script_put_line(fh, '');
         end if;
         -- No appropriate DBMS_METADATA. Manually create the SQL.
         --
         --  These "types" don't require a grant quailifier:
         --    -) FUNCTION
         --    -) INDEXTYPE
         --    -) LIBRARY
         --    -) MATERIALIZED VIEW
         --    -) OPERATOR
         --    -) PACKAGE
         --    -) PROCEDURE
         --    -) SEQUENCE
         --    -) TABLE
         --    -) TYPE
         --    -) VIEW
         --
         --  Other forms (and "types") include:
         --    -) ON DIRECTORY (DIRECTORY)         - Handled in "grb_directories"
         --    -) ON USER (USER)                   - Handled HERE and in "grb_object_grants"
         --    -) ON EDITION (EDITION)             - Handled HERE and in "grb_object_grants"
         --    -) ON JAVA SOURCE (JAVA CLASS)      - Handled HERE and in "grb_object_grants" and "grb_plsql_java"
         --    -) ON JAVA RESOURCE (JAVA RESOURCE) - Handled HERE and in "grb_object_grants"
         --    -) ON MINING MODEL (MLE LANGUAGE?)  - Not Handled
         --    -) ON SQL TRANSLATION PROFILE (???) - Not Handled
         --
         sql_txt := 'grant ' || buf2.privilege ||
                      ' on ' || case buf2.object_type when 'JAVA CLASS'    then 'JAVA SOURCE "'   || buf2.object_owner || '"."'
                                                      when 'JAVA SOURCE'   then 'JAVA SOURCE "'   || buf2.object_owner || '"."'
                                                      when 'JAVA RESOURCE' then 'JAVA RESOURCE "' || buf2.object_owner || '"."'
                                                      when 'EDITION'       then 'EDITION "'
                                                      when 'USER'          then 'USER "'
                                                                           else '"'               || buf2.object_owner || '"."'
                                end                                                               || buf2.object_name  ||
                    '" to "' || buf1.grantee || '"';
         -- Missing "with hierarchy option" ...
         if buf2.grantable = 'YES'
         then
            sql_txt := sql_txt || ' with grant option';
         end if;
         fh2.put_big_line(fh, buf2.object_owner || '"."' || buf2.object_name ||
                         ' Grant', sql_txt || ';'
                         ,common_util.MAXIMUM_SQL_LENGTH);
      end loop;
      --
      if installed_types_aa.EXISTS('grbjava')
      then
         sql_txt := 'begin GRAB_JAVA.GRB_SYSGRNT(:1, ''' || buf1.grantee   ||
                                               ''', ''' || buf1.file_name ||
                                               ''', ''' || ELMNT          ||
                                               ''', ''FUTURE''); end;';
         begin
            execute immediate sql_txt using in out fh;
         exception when others then
            if NOT regexp_like (SQLERRM, 'PLS-00201: identifier ''GRAB_JAVA.GRB_SYSGRNT'' must be declared')
            then
               raise_application_error(-20000, 'Execute Immediate ERROR' || CHR(10) ||
                                                SQL_TXT                  || CHR(10) ||
                                                SQLERRM                  || CHR(10) ||
                                                dbms_utility.format_error_backtrace );
            end if;
         end;
      end if;
      --
      if fh2.script_is_open(fh)
      then
         fh2.script_put_line(fh, '');
         fh2.script_put_line(fh, '');
         fh2.script_put_line(fh, 'set define on');
         fh2.script_put_line(fh, '');
         fh2.script_close(fh);
      end if;
   end loop;
end grb_future_sys_grants;

------------------------------------------------------------
-- Create FUTURE Grants
procedure grb_future_grants
is
   ELMNT                  CONSTANT varchar2(100) := 'GRANT';
   fh                     fh2.sf_ptr_type;  -- object script file handle
   sql_txt                varchar2(32767);
   default_build_type   build_conf.build_type%TYPE;
   header_printed   boolean;
begin
   for gtee in (with q1 as (
                select username                        GRANTEE
                      ,'_usr.'                         FILE_SUFFIX
                 from  schema_conf
                 where oracle_provided = 'N'
                UNION ALL
                select rolename                        GRANTEE
                      ,'_rol.'                         FILE_SUFFIX
                 from  role_conf
                       join element_conf  ec
                            on  ec.element_name = ELMNT
                 where oracle_provided = 'N'
                )
                select q1.grantee
                      ,replace(replace(q1.grantee,'$','_'),'%','_') ||
                       q1.file_suffix || ec.file_ext1  FILE_NAME
                 from  q1
                       join element_conf  ec
                            on  ec.element_name = ELMNT
                 order by q1.grantee)
   loop
      header_printed := FALSE;
      -- Cant use DBMS_METADATA because some Privileges may be delayed
      --script_put_line(fh, '--DBMS_METADATA:' || gtee.grantee);
      --BEGIN
      --   fh2.put_big_line(fh, ELMNT || ' ' || gtee.grantee || ' FUTURE Grants'
      --                   ,dbms_metadata.get_granted_ddl(object_type => 'SYSTEM_GRANT'
      --                                                 ,grantee     => gtee.grantee)
      --                   ,common_util.MAXIMUM_SQL_LENGTH);
      --EXCEPTION
      --   WHEN DBMS_METADATA.object_not_found2
      --   THEN
      --      null;
      --END;
      for syspriv in (select system_privilege_name
                       from  priv_system_privileges_view
                       where build_type = g_build_type
                     -- Either CURRENT or FUTURE is OK for non-object privileges
                     -- and  build_timing in ('CURRENT','FUTURE')
                        and  grantee    = gtee.grantee
                       order by system_privilege_name)
      loop
         if NOT fh2.script_is_open(fh)
         then
            fh := fh2.script_open(in_filename     => gtee.file_name
                                 ,in_elmnt        => ELMNT
                                 ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
            common_util.add_grants_file_header(fh         => fh
                                              ,in_grantee => gtee.grantee);
         end if;
         if NOT header_printed
         then
            header_printed := TRUE;
            fh2.script_put_line(fh, '');
            fh2.script_put_line(fh, '');
            fh2.script_put_line(fh, '--  Database System Privileges');
            fh2.script_put_line(fh, '');
         end if;
         fh2.script_put_line(fh, 'grant ' || syspriv.system_privilege_name || ' to "' || gtee.grantee || '";');
      end loop;
      header_printed := FALSE;
      --  DBMS_METADATA grants all roles.
      --script_put_line(fh, '--DBMS_METADATA:' || gtee.grantee);
      --fh2.put_big_line(fh, ELMNT || ' ' || gtee.grantee || ' FUTURE Grants'
      --                ,dbms_metadata.get_granted_ddl(object_type => 'ROLE_GRANT'
      --                                              ,grantee     => gtee.grantee));
      for rol in (select rolename
                        ,delegate_option
                        ,admin_option
                   from  priv_role_privileges_view
                   where build_type = g_build_type
                 -- Either CURRENT or FUTURE is OK for non-object privileges
                 -- and  build_timing in ('CURRENT','FUTURE')
                    and  grantee    = gtee.grantee
                   order by rolename)
      loop
         if NOT fh2.script_is_open(fh)
         then
            fh := fh2.script_open(in_filename     => gtee.file_name
                                 ,in_elmnt        => ELMNT
                                 ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
            common_util.add_grants_file_header(fh         => fh
                                              ,in_grantee => gtee.grantee);
         end if;
         if NOT header_printed
         then
            header_printed := TRUE;
            fh2.script_put_line(fh, '');
            fh2.script_put_line(fh, '');
            fh2.script_put_line(fh, '--  "sys" BUILD_TYPE Role Grants');
            fh2.script_put_line(fh, '--  "GRANTEE" (delayed) Role Grants');
            fh2.script_put_line(fh, '--  Note: "OBJECT" Schema Object Grants are given during Role creation');
            fh2.script_put_line(fh, '');
         end if;
         -- Missing "with hierarchy option" ...
         case
            when rol.admin_option = 'YES'
            then
               fh2.script_put_line(fh, 'grant "' || rol.rolename || '" to "' || gtee.grantee || '" with admin option;');
            when rol.delegate_option = 'YES'
            then
               fh2.script_put_line(fh, 'grant "' || rol.rolename || '" to "' || gtee.grantee || '" with delegate option;');
            else
               fh2.script_put_line(fh, 'grant "' || rol.rolename || '" to "' || gtee.grantee || '";');
         end case;
      end loop;
      header_printed := FALSE;
      for sobj in (select object_owner                TABLE_OWNER
                         ,object_name                 TABLE_NAME
                         ,privilege
                         ,max(grantable)              GRANTABLE
                    from  priv_obj_install_vw   -- Includes PUBLIC Grantee, Does not Include SYS Owned Objects
                    where object_build_type = g_build_type
                     and  build_timing      = 'FUTURE'  -- Grant delayed for this Grantee
                     and  grantee           = gtee.grantee
                     and  privilege    not in ('ENQUEUE','DEQUEUE')
                    group by object_owner
                         ,object_name
                         ,privilege
                    order by object_owner
                         ,object_name
                         ,privilege)
      loop
         if NOT fh2.script_is_open(fh)
         then
            fh := fh2.script_open(in_filename     => gtee.file_name
                                 ,in_elmnt        => ELMNT
                                 ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
            common_util.add_grants_file_header(fh         => fh
                                              ,in_grantee => gtee.grantee);
         end if;
         if NOT header_printed
         then
            header_printed := TRUE;
            fh2.script_put_line(fh, '');
            fh2.script_put_line(fh, '');
            fh2.script_put_line(fh, '--  "sys" BUILD_TYPE Schema Object Grants, excluding SYS objects');
            fh2.script_put_line(fh, '--  "GRANTEE" (delayed) Schema Object Grants');
            fh2.script_put_line(fh, '--  Note: "OBJECT" Schema Object Grants are given during object creation');
            fh2.script_put_line(fh, '');
         end if;
         -- No appropriate DBMS_METADATA.  Manually create the SQL.
         sql_txt := 'grant ' || sobj.privilege   ||
                     ' on "' || sobj.table_owner || '"."' || sobj.table_name || '"' ||
                     ' to "' || gtee.grantee     || '"';
         -- Missing "with hierarchy option" ...
         if sobj.grantable = 'YES'
         then
            sql_txt := sql_txt || ' with grant option';
         end if;
         fh2.script_put_line(fh, sql_txt || ';');
      end loop;
      header_printed := FALSE;
      for qspv in (select grant_name                  DBMS_AQ_PRIV
                    from  priv_queue_sysprivs_view
                    where build_type = g_build_type
                  -- Either CURRENT or FUTURE is OK for non-object privileges
                  -- and  build_timing in ('CURRENT','FUTURE')
                     and  grantee    = gtee.grantee
                    order by dbms_aq_priv)
      loop
         if NOT fh2.script_is_open(fh)
         then
            fh := fh2.script_open(in_filename     => gtee.file_name
                                 ,in_elmnt        => ELMNT
                                 ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
            common_util.add_grants_file_header(fh         => fh
                                              ,in_grantee => gtee.grantee);
         end if;
         if NOT header_printed
         then
            header_printed := TRUE;
            fh2.script_put_line(fh, '');
            fh2.script_put_line(fh, '');
            fh2.script_put_line(fh, '--  Advanced Queue System Privileges');
            fh2.script_put_line(fh, '');
         end if;
         fh2.script_put_line(fh, 'begin');
         fh2.script_put_line(fh, '   dbms_aqadm.grant_system_privilege(');
         fh2.script_put_line(fh, '      privilege    => ''' || qspv.DBMS_AQ_PRIV || ''', ');
         fh2.script_put_line(fh, '      grantee      => ''' || gtee.grantee      || ''', ');
         fh2.script_put_line(fh, '      admin_option =>  FALSE);');
         fh2.script_put_line(fh, 'end;');
         fh2.script_put_line(fh, '/');
      end loop;
      header_printed := FALSE;
      for cque in (select queue_owner
                         ,queue_name
                         ,privilege
                         ,max(grantable)              GRANTABLE
                    from  priv_obj_queue_view
                    where build_type   = g_build_type
                     and  build_timing = 'FUTURE'   -- Grant delayed for this Grantee
                     and  grantee      = gtee.grantee
                    group by queue_owner
                         ,queue_name
                         ,privilege)
      loop
         if NOT fh2.script_is_open(fh)
         then
            fh := fh2.script_open(in_filename     => gtee.file_name
                                 ,in_elmnt        => ELMNT
                                 ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
            common_util.add_grants_file_header(fh         => fh
                                              ,in_grantee => gtee.grantee);
         end if;
         if NOT header_printed
         then
            header_printed := TRUE;
            fh2.script_put_line(fh, '');
            fh2.script_put_line(fh, '');
            fh2.script_put_line(fh, '--  Advanced Queue Grants');
            fh2.script_put_line(fh, '--  "GRANTEE" (Delayed) Advanced Queue Grants');
            fh2.script_put_line(fh, '--  Note: "QUEUE" Advanced Queue Grants are given during object creation');
            fh2.script_put_line(fh, '');
         end if;
         fh2.script_put_line(fh, 'begin');
         fh2.script_put_line(fh, '   dbms_aqadm.grant_queue_privilege');
         fh2.script_put_line(fh, '      (privilege    => '''  || cque.privilege    || ''''  );
         fh2.script_put_line(fh, '      ,queue_name   => ''"' || cque.queue_owner || '"."' ||
                                                                 cque.queue_name  || '"''' );
         fh2.script_put_line(fh, '      ,grantee      => '''  || gtee.grantee      || ''''  );
         if cque.grantable = 'YES'
         then
            fh2.script_put_line(fh, '      ,grant_option => TRUE);');
         else
            fh2.script_put_line(fh, '      ,grant_option => FALSE);');
         end if;
         fh2.script_put_line(fh, 'end;');
         fh2.script_put_line(fh, '/');
      end loop;
      header_printed := FALSE;
      for pqsv in (
         select queue_owner     -- Owner of the queue
               ,queue_name      -- Name of the queue
               ,consumer_name   -- Name of the subscriber
               ,address         -- Address of the subscriber
               ,protocol        -- Protocol of the subscriber
               ,rule            -- Rule condition for the subscriber
               ,transformation  -- Transformation for the subscriber
               ,queue_to_queue  -- Is subscriber is a queue-to-queue subscriber?
               ,delivery_mode   -- Message delivery mode: PERSISTENT, BUFFERED, or PERSISTENT_OR_BUFFERED
          from  priv_queue_subscribe_view
          where build_type          = g_build_type
           and  build_type_selector = 'GRANTEE'
           and  consumer_name       = gtee.grantee
          order by queue_owner
               ,queue_name
               ,consumer_name)
      loop
         if NOT fh2.script_is_open(fh)
         then
            fh := fh2.script_open(in_filename     => gtee.file_name
                                 ,in_elmnt        => ELMNT
                                 ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
            common_util.add_grants_file_header(fh         => fh
                                              ,in_grantee => gtee.grantee);
         end if;
         if NOT header_printed
         then
            header_printed := TRUE;
            fh2.script_put_line(fh, '');
            fh2.script_put_line(fh, '');
            fh2.script_put_line(fh, '--  Advanced Queue Subscriptions');
            fh2.script_put_line(fh, '--  "GRANTEE" (Delayed) Advanced Queue Subscription');
            fh2.script_put_line(fh, '--  Note: "QUEUE" Advanced Queue Subscriptions are given during object creation');
            fh2.script_put_line(fh, '');
         end if;
         fh2.script_put_line(fh, 'begin');
         fh2.script_put_line(fh, '   dbms_aqadm.add_subscriber');
         fh2.script_put_line(fh, '      (queue_name     => ''' || pqsv.queue_owner ||
                                                           '.' || pqsv.queue_name  || '''');
         fh2.script_put_line(fh, '      ,subscriber     => sys.aq$_agent');
         fh2.script_put_line(fh, '                            (name     => ''' || pqsv.consumer_name || '''');
         fh2.script_put_line(fh, '                            ,address  => ''' || pqsv.address       || '''');
         fh2.script_put_line(fh, '                            ,protocol => '   || pqsv.protocol      || ')');
         fh2.script_put_line(fh, '      ,rule           => ''' || pqsv.rule           || '''');
         fh2.script_put_line(fh, '      ,transformation => ''' || pqsv.transformation || '''');
         fh2.script_put_line(fh, '      ,queue_to_queue => '   || pqsv.queue_to_queue );
         fh2.script_put_line(fh, '      ,delivery_mode  => DBMS_AQADM.' || pqsv.delivery_mode || ');');
         fh2.script_put_line(fh, 'end;');
         fh2.script_put_line(fh, '/');
         fh2.script_put_line(fh, '');
      end loop;
      if installed_types_aa.EXISTS('grbjava')
      then
         sql_txt := 'begin GRAB_JAVA.GRB_GRNT(:1, ''' || gtee.grantee   ||
                                            ''', ''' || gtee.file_name ||
                                            ''', ''' || ELMNT          ||
                                            '''); end;';
         begin
            execute immediate sql_txt using in out fh;
         exception when others then
            if NOT regexp_like (SQLERRM, 'PLS-00201: identifier ''GRAB_JAVA.GRB_GRNT'' must be declared')
            then
               raise_application_error(-20000, 'Execute Immediate ERROR' || CHR(10) ||
                                                SQL_TXT                  || CHR(10) ||
                                                SQLERRM                  || CHR(10) ||
                                                dbms_utility.format_error_backtrace );
            end if;
         end;
      end if;
      if fh2.script_is_open(fh)
      then
         fh2.script_put_line(fh, '');
         fh2.script_put_line(fh, '');
         fh2.script_put_line(fh, 'set define on');
         fh2.script_put_line(fh, '');
         fh2.script_close(fh);
      end if;
   END LOOP;
end grb_future_grants;

------------------------------------------------------------
-- Get CURRENT synonyms. FUTURE synonyms are handled in grb_future_synonyms
procedure grb_object_synonyms
      (in_fh             in out NOCOPY fh2.sf_ptr_type
      ,in_object_name    in            varchar2
      ,in_object_type    in            varchar2
      ,in_max_len        in            number)
is
begin
   fh2.script_put_line(in_fh, '');
   fh2.script_put_line(in_fh, '--  Synonyms');
   for buff in (select synonym_owner, synonym_name
                 from  obj_install_synonym_tab
                 where build_type          = g_build_type
                  and  build_type_selector = 'SYNONYM'       -- Target installed before this Synonym
                  and  target_owner        = g_schema_name
                  and  target_name         = in_object_name
                  and  target_type         = in_object_type
                 order by synonym_owner, synonym_name)
   loop
      fh2.script_put_line(in_fh, '');
      fh2.script_put_line(in_fh, '--DBMS_METADATA:' || buff.synonym_owner ||
                                                '.' || buff.synonym_name );
      -- Includes DB_LINK in Synonym
      fh2.put_big_line(in_fh, buff.synonym_owner || '.' || buff.synonym_name || ' Synonym'
                      ,dbms_metadata.get_ddl(object_type => 'SYNONYM'
                                            ,name        => buff.synonym_name
                                            ,schema      => buff.synonym_owner)
                      ,in_max_len);
   end loop;
   fh2.script_put_line(in_fh, '');
end grb_object_synonyms;

------------------------------------------------------------
-- Create Synonym
procedure grb_future_synonyms
is
   ELMNT    CONSTANT varchar2(100) := 'SYNONYM';
   fh       fh2.sf_ptr_type;  -- object script file handle
begin
   for buf1 in
      (select synonym_name
             ,file_ext1
        from  obj_install_synonym_tab
        where build_type          = g_build_type
         and  build_type_selector = 'TARGET'      -- Synonym install delayed for this Target
         and  synonym_owner       = g_schema_name
        group by synonym_name, file_ext1
        order by synonym_name )
   loop
      if NOT fh2.script_is_open(fh)
      then
         fh := fh2.script_open(in_filename     => replace(replace(g_schema_name,'$','_'),'%','_') || '.' || buf1.file_ext1
                              ,in_elmnt        => ELMNT
                              ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
         fh2.script_put_line(fh, '');
         fh2.script_put_line(fh, '--');
         fh2.script_put_line(fh, '--  Create ' || g_schema_name || ' Synonyms');
         fh2.script_put_line(fh, '--');
         fh2.script_put_line(fh, '--  Synonyms from objects owned by "sys" Build Type Schema');
         fh2.script_put_line(fh, '--  Also, synonyms delayed waiting for target installation.');
         fh2.script_put_line(fh, '--');
         fh2.script_put_line(fh, '');
         fh2.script_put_line(fh, 'set define off');
         fh2.script_put_line(fh, '');
      end if;
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--DBMS_METADATA:' || g_schema_name ||
                                             '.' || buf1.synonym_name);
      -- Includes DB_LINK in Synonym
      fh2.put_big_line(fh, g_schema_name || '.' || buf1.synonym_name || ' Synonym'
                      ,dbms_metadata.get_ddl(object_type => 'SYNONYM'
                                            ,name        => buf1.synonym_name
                                            ,schema      => g_schema_name)
                      ,common_util.MAXIMUM_SQL_LENGTH);
   end loop;
   if fh2.script_is_open(fh)
   then
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, 'set define on');
      fh2.script_close(fh);
   end if;
end grb_future_synonyms;

------------------------------------------------------------
-- Create Advanced Queues
procedure grb_advanced_queues
is
   --
   --  AQ Notifications (Subscribers)
   --
   --TYPE aq$_agent AS OBJECT
   --( name          varchar2(30),    -- M_IDEN, name of a message producer or consumer
   --  address       varchar2(1024),  -- address where message must be sent
   --  protocol      number)          -- protocol for communication, must be 0
   --
   --TYPE aq$_reg_info AS OBJECT (
   --        name                  VARCHAR2(128),  -- name of the subscription
   --        namespace             NUMBER,         -- namespace of the subscription
   --        callback              VARCHAR2(4000), -- callback function
   --        context               RAW(2000),      -- context for the callback func.
   --   ***  anyctx  ***           SYS.ANYDATA,    -- anydata ctx for callback func
   --        ctxtype               NUMBER,         -- raw/anydata context
   --        qosflags              NUMBER,         -- QOS flags
   --        payloadcbk            VARCHAR2(4000), -- payload callback
   --        timeout               NUMBER,         -- registration expiration
   --        ntfn_grouping_class        NUMBER,    -- ntfn grouping class
   --        ntfn_grouping_value        NUMBER,    -- ntfn grouping value
   --        ntfn_grouping_type         NUMBER,    -- ntfn grouping type
   --        ntfn_grouping_start_time   TIMESTAMP WITH TIME ZONE, -- grp start time
   --        ntfn_grouping_repeat_count NUMBER)    -- ntfn grp repeat count
   --
   --Not Implementing "anyctx", "anyctx" is for Streams Only:
   --https://docs.oracle.com/database/121/REFRN/GUID-0976B325-BCA0-4205-9E3A-0E9D88BA1FDD.htm#REFRN23657
   --  Streams is Deprecated:
   --https://docs.oracle.com/database/121/UPGRD/deprecated.htm#UPGRD60159
   -- ' ,anyctx => ''' || case sys.ANYDATA.gettypename(any_context)
   --                     when  null
   --                     then 'NULL'
   --                     when 'NUMBER'
   --                     then 'ConvertNumber(num => to_number(''' ||
   --                           to_char(sys.ANYDATA.AccessNumber(any_context)) || '''))'
   --                     when 'DATE'
   --                     then 'ConvertDate(dat => to_date('''    ||
   --                           to_char(sys.ANYDATA.AccessDate(any_context)
   --                                  ,'DD-MON-YYYY HH24:MI:SS') ||
   --                              ''',''DD-MON-YYYY HH24:MI:SS''))'
   --                     when 'CHAR'
   --                     then 'ConvertChar(c => CAST(''' ||
   --                           sys.ANYDATA.AccessChar(any_context) || ''' as CHAR))'
   --                     when 'VARCHAR'
   --                     then 'ConvertVarchar(c => CAST(''' ||
   --                           sys.ANYDATA.AccessVarchar(any_context) || ''' as VARCHAR))'
   --                     when 'VARCHAR2'
   --                     then 'ConvertVarchar2(c => CAST(''' ||
   --                           sys.ANYDATA.AccessVarchar2(any_context) || ''' as VARCHAR2))'
   --                     when 'RAW'
   --                     then 'ConvertRaw(r => hextoraw(''' ||
   --                           rawtohex(sys.ANYDATA.AccessRaw(any_context)) || '''))'
   --                     when 'BLOB'
   --                     then 'ConvertBlob(b => to_blob(hextoraw(''' ||
   --                           dbms_lob.substr(sys.ANYDATA.AccessBlob(any_context)
   --                                          ,32767,1) || ''')))'
   --                     when 'CLOB'
   --                     then 'ConvertClob(c => to_clob(''' ||
   --                           dbms_lob.substr(sys.ANYDATA.AccessClob(any_context)
   --                                          ,32767,1) || '''))'
   --                     when 'TIMESTAMP'
   --                     then 'ConvertTimestamp(ts => to_timestamp(''' ||
   --                           to_char(sys.ANYDATA.AccessTimestamp(any_context)
   --                                  ,'DD-MON-YYYY HH24:MI:SS.FF9')   ||
   --                              ''',''DD-MON-YYYY HH24:MI:SS.FF9''))'
   --                     when 'TIMESTAMP WITH TIME ZONE'
   --                     then 'ConvertTimestampTZ(ts => to_timestamp_tz(''' ||
   --                           to_char(sys.ANYDATA.AccessTimestampTZ(any_context)
   --                                  ,'DD-MON-YYYY HH24:MI:SS.FF9 TH:TM')  ||
   --                              ''',''DD-MON-YYYY HH24:MI:SS.FF9 TH:TM''))'
   --                     when 'TIMESTAMP WITH LOCAL TIME ZONE'
   --                     then 'ConvertTimestampLTZ(ts => CAST(to_timestamp_tz(''' ||
   --                           to_timestamp_tz(sys.ANYDATA.AccessTimestampLTZ(any_context)
   --                                  ,'DD-MON-YYYY HH24:MI:SS.FF9 TH:TM')   ||
   --                              ''',''DD-MON-YYYY HH24:MI:SS.FF9 TH:TM'')' ||
   --                                                    ' as timestamp with local time zone))'
   --                     when 'INTERVAL YEAR TO MONTH'
   --                     then 'ConvertIntervalYM(inv => INTERVAL ''' ||
   --                           to_char(sys.ANYDATA.AccessIntervalYM(any_context)) ||
   --                                  ' YEAR TO MONTH)'
   --                     when 'INTERVAL DAY TO SECOND'
   --                     then 'ConvertIntervalDS(inv => INTERVAL ''' ||
   --                           to_char(sys.ANYDATA.AccessIntervalDS(any_context)
   --                                  ,'DD HH24:MI:SS.FF') ||
   --                                  ' DAY TO SECOND)'
   --                     when 'BINARY_FLOAT'
   --                     then 'ConvertBFloat(fl => CAST(to_number(''' ||
   --                           sys.ANYDATA.AccessBFloat(any_context) || ''') as BINARY_FLOAT))'
   --                     when 'BINARY_DOUBLE'
   --                     then 'ConvertBFloat(dbl => CAST(to_number(''' ||
   --                          sys.ANYDATA.AccessBDouble(any_context) || ''') as BINARY_DOUBLE))'
   --                     when 'ROWID'
   --                     then 'ConvertURowid(rid => CHARTOROWID(''' ||
   --                           ROWIDTOCHAR(sys.ANYDATA.AccessURowid(any_context)) || '''))'
   --                     --  BFILE Conversion not Implemented
   --                     --when 'BFILE'
   --                     --then 'ConvertBfile(b => BFILENAME ''' ||
   --                     --      sys.ANYDATA.AccessBfile(any_context) || ''')'
   --                     --  Not Implemented
   --                     --when 'NCHAR'
   --                     --then 'ConvertNchar(nc => to_nchar(''' ||
   --                     --      sys.ANYDATA.AccessNchar(any_context) || '''))'
   --                     --  Not Implemented
   --                     --when 'NVARCHAR2'
   --                     --then 'ConvertNVarchar2(nc => to_nchar(''' ||
   --                     --      sys.ANYDATA.AccessNVarchar2(any_context) || '''))'
   --                     --  Not Implemented
   --                     --when 'NCLOB'
   --                     --then 'ConvertNClob(nc => to_nclob(''' ||
   --                     --      sys.ANYDATA.AccessNClob(any_context) || '''))'
   --                     --  Also Not Implemented:
   --                     --ConvertObject(obj => "<ADT_1>")
   --                     --ConvertObject(obj => "<OPAQUE_1>")
   --                     --ConvertRef(rf => REF "<ADT_1>")
   --                     --ConvertCollection(col => "<COLLECTION_1>")
   --                     else 'ERROR: Unknown Datatype "' || context_type || '"'
   --                     end                                              || LF ||
   --
   ELMNT      CONSTANT varchar2(100) := 'QUEUE';
   fh         fh2.sf_ptr_type;  -- object script file handle
begin
   for buf1 in (select obj.object_name                          QUEUE_NAME
                      ,replace(replace(obj.object_name,'$','_'),'%','_') || '.' || obj.file_ext1
                                                                FILE_NAME
                      ,obj.build_timing
                 from  obj_install_object_tab  obj
                       join dba_queues  aq
                            on  aq.owner = obj.object_owner
                            and aq.name  = obj.object_name
                            and (   aq.queue_type is null
                                 or aq.queue_type != 'EXCEPTION_QUEUE')
                 where obj.build_type   = g_build_type
                  and  obj.object_owner = g_schema_name
                  and  obj.object_type  = ELMNT
                 order by obj.object_name
                      ,obj.file_ext1
                      ,obj.build_timing)
   loop
      fh := fh2.script_open(in_filename     => buf1.file_name
                           ,in_elmnt        => ELMNT
                           ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--');
      fh2.script_put_line(fh, '--  Create ' || g_schema_name || '.' || buf1.queue_name || ' Queue');
      fh2.script_put_line(fh, '--');
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, 'set define off');
      fh2.script_put_line(fh, '');
      if buf1.build_timing != 'CURRENT'
      then
         fh2.script_put_line(fh, '');
         fh2.script_put_line(fh, '--  NOTE: This is a "' || buf1.build_timing || '" Queue');
      end if;
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--DBMS_METADATA:' || g_schema_name   ||
                                             '.' || buf1.queue_name );
      fh2.put_big_line(fh, g_schema_name || '.' || buf1.queue_name || ' Queue'
                      ,dbms_metadata.get_ddl(object_type => 'AQ_QUEUE'
                                            ,name        => buf1.queue_name
                                            ,schema      => g_schema_name)
                      ,common_util.MAXIMUM_SQL_LENGTH);
      fh2.script_put_line(fh, '/');
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--  Grants');
      -- Grant syntax does not support Advanced Queues
      --grb_object_grants(fh, buf1.queue_name, 'QUEUE');
      fh2.script_put_line(fh, '');
      for buf2 in (select grantee                 GRANTEE
                         ,privilege
                         ,max(grantable)          GRANTABLE
                    from  priv_obj_queue_view
                    where build_type   = g_build_type
                     and  build_timing = 'CURRENT'     -- Grantee is installed before Queue
                     and  queue_owner  = g_schema_name
                     and  queue_name   = buf1.queue_name
                    group by grantee
                         ,privilege
                    order by grantee
                         ,privilege)
      loop
         fh2.script_put_line(fh, 'begin');
         fh2.script_put_line(fh, '   dbms_aqadm.grant_queue_privilege');
         fh2.script_put_line(fh, '      (privilege    => '''  || buf2.privilege  || ''''  );
         fh2.script_put_line(fh, '      ,queue_name   => ''"' || g_schema_name   || '"."' ||
                                                                 buf1.queue_name || '"''' );
         fh2.script_put_line(fh, '      ,grantee      => '''  || buf2.grantee    || ''''  );
         if buf2.grantable = 'YES'
         then
            fh2.script_put_line(fh, '      ,grant_option => TRUE);');
         else
            fh2.script_put_line(fh, '      ,grant_option => FALSE);');
         end if;
         fh2.script_put_line(fh, 'end;');
         fh2.script_put_line(fh, '/');
      end loop;
      grb_object_synonyms(fh, buf1.queue_name, 'QUEUE', common_util.MAXIMUM_SQL_LENGTH);
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--  Subscribe');
      fh2.script_put_line(fh, '');
      for buf3 in (
         select queue_owner     -- Owner of the queue
               ,queue_name      -- Name of the queue
               ,consumer_name   -- Name of the subscriber
               ,address         -- Address of the subscriber
               ,protocol        -- Protocol of the subscriber
               ,rule            -- Rule condition for the subscriber
               ,transformation  -- Transformation for the subscriber
               ,queue_to_queue  -- Is subscriber is a queue-to-queue subscriber?
               ,delivery_mode   -- Message delivery mode: PERSISTENT, BUFFERED, or PERSISTENT_OR_BUFFERED
               ,build_type_selector
          from  priv_queue_subscribe_view
          where build_type          = g_build_type
           and  build_type_selector = 'QUEUE'
           and  queue_owner         = g_schema_name
           and  queue_name          = buf1.queue_name
          order by queue_owner
               ,queue_name
               ,consumer_name)
      loop
         fh2.script_put_line(fh, '-- This is a "' || buf3.build_type_selector || '" Queue Subscription');
         fh2.script_put_line(fh, 'begin');
         fh2.script_put_line(fh, '   dbms_aqadm.add_subscriber');
         fh2.script_put_line(fh, '      (queue_name     => ''' || buf3.queue_owner ||
                                                           '.' || buf3.queue_name  || '''');
         fh2.script_put_line(fh, '      ,subscriber     => sys.aq$_agent');
         fh2.script_put_line(fh, '                            (name     => ''' || buf3.consumer_name || '''');
         fh2.script_put_line(fh, '                            ,address  => ''' || buf3.address       || '''');
         fh2.script_put_line(fh, '                            ,protocol => '   || buf3.protocol      || ')');
         fh2.script_put_line(fh, '      ,rule           => ''' || buf3.rule           || '''');
         fh2.script_put_line(fh, '      ,transformation => ''' || buf3.transformation || '''');
         fh2.script_put_line(fh, '      ,queue_to_queue => '   || buf3.queue_to_queue );
         fh2.script_put_line(fh, '      ,delivery_mode  => DBMS_AQADM.' || buf3.delivery_mode || ');');
         fh2.script_put_line(fh, 'end;');
         fh2.script_put_line(fh, '/');
         fh2.script_put_line(fh, '');
      end loop;
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--  Register');
      fh2.script_put_line(fh, '');
      -- https://docs.oracle.com/database/121/REFRN/GUID-0976B325-BCA0-4205-9E3A-0E9D88BA1FDD.htm#REFRN23657
      for buf4 in (
         select subscription_name          -- Name of the subscription registration of the form schema.queue:consumer_name
               ,namespace                  -- Namespace of the subscription registration: ANONYMOUS, AQ, or DBCHANGE
               ,location_name              -- Location endpoint of the registration
               ,user_context               -- Context the user provided during registration of PL/SQL registrations
               ,qosflags                   -- Quality of service of the registration: RELIABLE, PAYLOAD, or PURGE_ON_NTFN
               ,timeout                    -- Registration timeout
               ,ntfn_grouping_class        -- Notification grouping class
               ,ntfn_grouping_value        -- Notification grouping value
               ,ntfn_grouping_type         -- Notification grouping type: SUMMARY or LAST
               ,ntfn_grouping_start_time   -- Notification grouping start time
               ,ntfn_grouping_repeat_count -- Notification grouping repeat count, or FOREVER
               ,context_size               -- Size of the context
          from  priv_queue_register_view    -- grant SELECT on "SYS"."DBA_SUBSCR_REGISTRATIONS" to "ODBCAPTURE";
          where queue_build_type = g_build_type
           and  regexp_like (subscription_name, '^["]{0,1}'           ||   -- Zero or One Double Quotes at the begining
                                                g_schema_name         ||
                                                '["]{0,1}[.]["]{0,1}' ||   -- Zero or One Double Quotes, a Period, and Zero or One Double Quotes
                                                buf1.queue_name        )
          order by subscription_name
               ,namespace)
      loop
         -- Advanced Queue Registrations are "QUEUE" only.
         fh2.script_put_line(fh, 'begin');
         fh2.script_put_line(fh, '   dbms_aq.register');
         fh2.script_put_line(fh, '      (reg_list => sys.aq$_reg_info_list');
         fh2.script_put_line(fh, '                      (sys.aq$_reg_info');
         fh2.script_put_line(fh, '                         (name                       => ''' || buf4.subscription_name                    || '''');
         fh2.script_put_line(fh, '                         ,namespace                  => DBMS_AQ.NAMESPACE_' || to_char(buf4.namespace));
         fh2.script_put_line(fh, '                         ,callback                   => ''' || buf4.location_name                     || '''');
         fh2.script_put_line(fh, '                         ,context                    => hextoraw(''' || rawtohex(buf4.user_context)      || ''')');
         if    buf4.qosflags is not null
           AND buf4.timeout  is not null
         then
            fh2.script_put_line(fh, '                         ,qosflags                   => ' || to_char(buf4.qosflags));
            fh2.script_put_line(fh, '                         ,timeout                    => ' || to_char(buf4.timeout));
            if     buf4.ntfn_grouping_class        is not null
               AND buf4.ntfn_grouping_value        is not null
               AND buf4.ntfn_grouping_type         is not null
               AND buf4.ntfn_grouping_start_time   is not null
               AND buf4.ntfn_grouping_repeat_count is not null
            then
               fh2.script_put_line(fh, '                         ,ntfn_grouping_class        => ' || to_char(buf4.ntfn_grouping_class));
               fh2.script_put_line(fh, '                         ,ntfn_grouping_value        => ' || to_char(buf4.ntfn_grouping_value));
               fh2.script_put_line(fh, '                         ,ntfn_grouping_type         => ' || to_char(buf4.ntfn_grouping_type));
               fh2.script_put_line(fh, '                         ,ntfn_grouping_start_time   => ' || 'to_timstamp_tz(' ||
                                                                                                      to_char(buf4.ntfn_grouping_start_time
                                                                                                             ,'DD-MON-YYYY HH24:MI:SS.FF9 TH:TM') ||
                                                                                                           ',''DD-MON-YYYY HH24:MI:SS.FF9 TH:TM'')' || ' )');
               fh2.script_put_line(fh, '                         ,ntfn_grouping_repeat_count => ' || to_char(buf4.ntfn_grouping_repeat_count));
            end if;
         end if;
         fh2.script_put_line(fh, '                      )  )');
         fh2.script_put_line(fh, '      ,reg_count => ' || nvl(to_char(buf4.context_size),'NULL') || ' );');
         fh2.script_put_line(fh, 'end;');
         fh2.script_put_line(fh, '/');
         fh2.script_put_line(fh, '');
      end loop;
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--  Schedule');
      fh2.script_put_line(fh, '');
      -- https://docs.oracle.com/database/121/REFRN/GUID-65C3B9EB-BFD5-4BAB-A810-D0B705E92DCA.htm
      for buf5 in (
         select schema              -- Source queue owner
               ,qname               -- Source queue name
               ,destination         -- Destination name, currently limited to be a DBLINK name
               ,start_date          -- Date at which to start propagation
               ,propagation_window  -- Duration for the propagation window (in seconds)
               ,next_time           -- Function to compute the start of the next propagation window
               ,latency             -- Maximum wait time to propagate a message during the propagation window
          from  dba_queue_schedules
          where schema = g_schema_name
           and  qname  = buf1.queue_name
          order by schema
               ,qname)
      loop
         fh2.script_put_line(fh, 'begin');
         fh2.script_put_line(fh, '   dbms_aqadm.schedule_propagation');
         fh2.script_put_line(fh, '      (queue_name         => ''"' || buf5.schema      || '"."' ||
                                                                       buf5.qname       || '"''' );
         fh2.script_put_line(fh, '      ,destination        => '''  || buf5.destination || ''''  );
         fh2.script_put_line(fh, '      ,start_time         => to_date(''' || to_char(buf5.start_date
                                                                                     ,'DD-MON-YYYY HH24:MI:SS')  ||
                                                                                ''', ''DD-MON-YYYY HH24:MI:SS'')');
         fh2.script_put_line(fh, '      ,duration           =>   '  || buf5.propagation_window   );
         fh2.script_put_line(fh, '      ,next_time          => '''  || buf5.next_time   || ''''  );
         fh2.script_put_line(fh, '      ,latency            =>   '  || buf5.latency);
         fh2.script_put_line(fh, '      ,destination_queue  => NULL);');
         fh2.script_put_line(fh, 'end;');
         fh2.script_put_line(fh, '/');
         fh2.script_put_line(fh, '');
      end loop;
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, 'set define on');
      fh2.script_close(fh);
   end loop;
end grb_advanced_queues;

------------------------------------------------------------
-- Create Advanced Queue Tables
procedure grb_aq_tables
is
   ELMNT      CONSTANT varchar2(100) := 'QUEUE_TABLE';
   fh         fh2.sf_ptr_type;  -- object script file handle
   gsm_save   varchar2(128);
begin
   for buff in (select aqt.queue_table
                      ,replace(replace(aqt.queue_table,'$','_'),'%','_') || '.' || elem.file_ext1
                                                           FILE_NAME
                      ,obj.object_name
                      ,obj.object_type
                      ,obj.build_timing
                 from  dba_queue_tables  aqt
                       join element_conf  elem
                            on  elem.element_name = ELMNT
                       join obj_install_object_tab  obj
                            on  obj.build_type = g_build_type
                            and obj.object_owner = aqt.owner
                            and obj.object_name  = aqt.queue_table
                            and obj.object_type  in ('TABLE','VIEW')
                 where aqt.owner = g_schema_name
                 order by aqt.queue_table)
   loop
      fh := fh2.script_open(in_filename     => buff.file_name
                           ,in_elmnt        => ELMNT
                           ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--');
      fh2.script_put_line(fh, '--  Create ' || g_schema_name || '.' || buff.queue_table ||' Queue Table');
      fh2.script_put_line(fh, '--');
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, 'set define off');
      fh2.script_put_line(fh, '');
      if buff.build_timing != 'CURRENT'
      then
         fh2.script_put_line(fh, '');
         fh2.script_put_line(fh, '-- NOTE: This is a "' || buff.build_timing || '" Queue Table');
      end if;
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--DBMS_METADATA:' || g_schema_name ||
                                             '.' || buff.queue_table);
      -- DBMS_METADATA throws an error when LOB_STORAGE is set to DEFAULT or BASICFILE for AQ_QUEUE_TABLE
      fh2.remove_storage_clause(fh, g_schema_name || '.' || buff.queue_table || ' Table'
                               ,dbms_metadata.get_ddl(object_type => 'AQ_QUEUE_TABLE'
                                                     ,name        => buff.queue_table
                                                     ,schema      => g_schema_name)
                               ,common_util.MAXIMUM_SQL_LENGTH);
      fh2.script_put_line(fh, '/');
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--');
      fh2.script_put_line(fh, '-- https://docs.oracle.com/en/database/oracle/oracle-database/23/adque/managing-aq.html');
      fh2.script_put_line(fh, '-- The queue table owner must be granted EXECUTE privileges on the');
      fh2.script_put_line(fh, '--  DBMS_AQADM package. Otherwise, the Oracle Database snapshot');
      fh2.script_put_line(fh, '--  processes do not propagate, but generates trace files with the');
      fh2.script_put_line(fh, '--  error identifier SYS.DBMS_AQADM not defined');
      fh2.script_put_line(fh, '--');
      grb_object_grants(fh, buff.queue_table, buff.object_type);
      grb_object_synonyms(fh, buff.queue_table, buff.object_type, common_util.MAXIMUM_SQL_LENGTH);
      for buf2 in (
          select obj.object_name,
                 obj.object_type
           from  dba_objects_tab  obj
           where obj.object_owner = g_schema_name
            and  obj.object_type in ('TABLE','VIEW')
            and  regexp_like(obj.object_name, common_util.ADV_QUEUE_PREFIX_REGEXP || buff.queue_table || common_util.ADV_QUEUE_SUFFIX_REGEXP)
           order by obj.object_name,
                 obj.object_type)
      loop
         fh2.script_put_line(fh, '');
         fh2.script_put_line(fh, ' -- ' || buf2.object_name || ' ' || buf2.object_type);
         fh2.script_put_line(fh, '');
         grb_object_grants(fh, buf2.object_name, buf2.object_type);
         grb_object_synonyms(fh, buf2.object_name, buf2.object_type, common_util.MAXIMUM_SQL_LENGTH);
      end loop;
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, 'set define on');
      fh2.script_close(fh);
   end loop;
end grb_aq_tables;

------------------------------------------------------------
-- Create Application Context object script
PROCEDURE grb_application_context
IS
   ELMNT      CONSTANT varchar2(100) := 'CONTEXT';
   fh         fh2.sf_ptr_type;  -- object script file handle
   sql_txt    varchar2(32767);
begin
   for buf1 in (select obj.context_owner
                      ,obj.context_name
                      ,obj.context_type
                      ,replace(replace(obj.context_name,'$','_'),'%','_') || '.' || obj.file_ext1
                                                             FILE_NAME
                      ,obj.package_owner
                      ,obj.package_name
                      ,obj.build_timing
                 from  obj_install_context_tab  obj
                 where obj.build_type    = g_build_type
                  and  obj.context_owner = g_schema_name
                  and  obj.element_name = ELMNT
                 order by obj.context_name
                      ,obj.context_owner
                      ,obj.package_name)
   loop
      fh := fh2.script_open(in_filename     => buf1.file_name
                           ,in_elmnt        => ELMNT
                           ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--');
      fh2.script_put_line(fh, '--  Create '  || buf1.context_name ||' Context');
      fh2.script_put_line(fh, '--');
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, 'set define off');
      fh2.script_put_line(fh, '');
      if buf1.build_timing != 'CURRENT'
      then
         fh2.script_put_line(fh, '');
         fh2.script_put_line(fh, '-- Note: This is a "' || buf1.build_timing || '" Context');
      end if;
      fh2.script_put_line(fh, '');
      sql_txt := 'create or replace context "' || buf1.context_name  ||
                                         '"."' || buf1.context_name  ||
                                   '" using "' || buf1.package_owner ||
                                         '"."' || buf1.package_name  ||
                                         '"  ' || buf1.context_type  ;
      fh2.put_big_line(fh, buf1.package_owner || '.' || buf1.context_name || ' Context'
                      ,sql_txt || ';'
                      ,common_util.MAXIMUM_SQL_LENGTH);
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, 'set define on');
      fh2.script_close(fh);
   END LOOP;
end grb_application_context;

------------------------------------------------------------
-- Create Real Application Security
procedure grb_ras_acls
is
   SQL_TXT   constant varchar2(1000) := 'begin GRAB_RAS.GRB_RACL; end;';
begin
   if NOT installed_types_aa.EXISTS('grbras') then return; end if;
   execute immediate SQL_TXT;
exception when others then
   if NOT regexp_like (SQLERRM, 'PLS-00201: identifier ''GRAB_RAS.GRB_RACL'' must be declared')
   then
      raise_application_error(-20000, 'Execute Immediate ERROR' || CHR(10) ||
                                       SQL_TXT                  || CHR(10) ||
                                       SQLERRM                  || CHR(10) ||
                                       dbms_utility.format_error_backtrace );
   end if;
end grb_ras_acls;

------------------------------------------------------------
-- Create Host Access Control Lists
procedure grb_host_acls
is
   --
   -- Oracle Database Security Guide Release 21
   -- F31285-17, April 2024
   -- Chapter 8 Managing Fine-Grained Access in PL/SQL Packages and Types
   -- 8.5 Configuring Access Control for External Network Services
   -- https://docs.oracle.com/en/database/oracle/oracle-database/21/dbseg/managing-fine-grained-access-in-pl-sql-packages-and-types.html#GUID-9C14581A-163F-48ED-98CC-790E6B8D20D6
   --
   -- privilege_list: Enter one or more of the following privileges, which
   --   are case insensitive. Enclose each privilege with single quotation
   --   marks and separate each with a comma (for example, 'http', 'http_proxy').
   -- For tighter access control, grant only the http, http_proxy, or smtp
   --   privilege instead of the connect privilege if the user uses the
   --   UTL_HTTP, HttpUriType, UTL_SMTP, or UTL_MAIL only.
   --   -) http: Makes an HTTP request to a host through the UTL_HTTP package and the HttpUriType type
   --   -) http_proxy: Makes an HTTP request through a proxy through the UTL_HTTP package and the HttpUriType type. You must include http_proxy in conjunction to the http privilege if the user makes the HTTP request through a proxy.
   --   -) smtp: Sends SMTP to a host through the UTL_SMTP and UTL_MAIL packages
   --   -) resolve: Resolves a network host name or IP address through the UTL_INADDR package
   --   -) connect: Grants the user permission to connect to a network service at a host through the UTL_TCP, UTL_SMTP, UTL_MAIL, UTL_HTTP, and DBMS_LDAP packages, or the HttpUriType type
   --   -) jdwp: Used for Java Debug Wire Protocol debugging operations for Java or PL/SQL stored procedures.
   --
   --  This was implemented in Real Application Security:
   --DECLARE
   -- ace_list      XS$ACE_LIST;
   --BEGIN
   -- ace_list := XS$ACE_LIST(
   --   XS$ACE_TYPE(
   --     privilege_list => XS$NAME_LIST('"CONNECT"'),
   --     principal_name=>'"APP_OWNER"',
   --     principal_type=>XS_ACL.PTYPE_DB,
   --     start_date => to_timestamp_tz('16-SEP-16 09.42.47.423377 PM',
   --          'DD-MON-YY HH.MI.SS.FF PM TZH:TZM')),
   --   XS$ACE_TYPE(
   --     privilege_list => XS$NAME_LIST('"CONNECT"'),
   --     principal_name=>'"APP_OWNER"',
   --     principal_type=>XS_ACL.PTYPE_DB));
   --
   -- xs_acl.create_acl(
   --     name=>'"SYS"."NETWORK_ACL_3CA7D022F7DCA526E054A0369FA25254"',
   --     ace_list=>ace_list,
   --     sec_class=>'"SYS"."NETWORK_SC"',
   --     description=>'ACL for Application');
   --END;
   --/
   --
   ELMNT        CONSTANT varchar2(100) := 'HOST_ACL';
   fh           fh2.sf_ptr_type;  -- object script file handle
   old_file     varchar2(1000) := 'This is not a real file name !@#$%^';
   ----------------------------------------
begin
   --dbms_output.put_line('ELMNT: ' || ELMNT || ', g_build_type: ' || g_build_type ||
   --                     ', g_schema_name: ' || g_schema_name || ', ' || ELMNT);
   for buff in (select replace(replace(replace(host,'*','_'),'$','_'),'%','_') || '.' || file_ext1
                                                              FILE_NAME
                      ,host
                      ,object_name_regexp
                      ,lower_port
                      ,upper_port
                      ,host || ' from port ' || lower_port || ' to ' || upper_port
                                                              HOST_PORT_RANGE
                      ,grantee                                PRINCIPAL
                      ,privilege
                      ,build_type_selector
                 from  priv_obj_hacl_view
                 where build_type         = g_build_type
                  and  principal_type     = 'DATABASE'       -- xs_acl.ptype_db
                  and  grant_type         = 'GRANT'
                  and  inverted_principal = 'NO'
                  and  privilege         is not null
                 group by replace(replace(replace(host,'*','_'),'$','_'),'%','_') || '.' || file_ext1
                      ,host
                      ,object_name_regexp
                      ,lower_port
                      ,upper_port
                      ,grantee
                      ,privilege
                      ,build_type_selector
                 order by replace(replace(replace(host,'*','_'),'$','_'),'%','_') || '.' || file_ext1
                      ,host
                      ,object_name_regexp
                      ,lower_port
                      ,upper_port
                      ,grantee
                      ,privilege
                      ,build_type_selector)
   loop
      if old_file != buff.file_name
      then
         old_file := buff.file_name;
         if fh2.script_is_open(fh)
         then
            fh2.script_put_line(fh, 'set define on');
            fh2.script_close(fh);
         end if;
         fh := fh2.script_open(in_filename     => buff.file_name
                              ,in_elmnt        => ELMNT
                              ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
         fh2.script_put_line(fh, '');
         fh2.script_put_line(fh, '--');
         fh2.script_put_line(fh, '--  Create Host ACL/ACE');
         fh2.script_put_line(fh, '--');
         fh2.script_put_line(fh, '-- Host ACLs with the following:');
         fh2.script_put_line(fh, '--    PRINCIPAL_TYPE      = ''DATABASE'' (xs_acl.ptype_db)');
         fh2.script_put_line(fh, '--    GRANT_TYPE          = ''GRANT''');
         fh2.script_put_line(fh, '--    INVERTED_PRINICIPAL = ''NO''');
         fh2.script_put_line(fh, '--    PRIVILEGE          is not null');
         fh2.script_put_line(fh, '-- Start Dates and End Dates are ignored (set to NULL).');
         fh2.script_put_line(fh, '--');
         fh2.script_put_line(fh, '');
         fh2.script_put_line(fh, 'set define off');
         fh2.script_put_line(fh, '');
      end if;
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--');
      fh2.script_put_line(fh, '--  Create Host ACL/ACE for ' || buff.host_port_range || ' ');
      fh2.script_put_line(fh, '--  NOTE: This is a "' || buff.build_type_selector || '" Host ACL');
      if buff.object_name_regexp is not null
      then
         fh2.script_put_line(fh, '--   (OBJECT_NAME_REGEXP: ' || buff.object_name_regexp || ')');
      end if;
      fh2.script_put_line(fh, '--');
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, 'begin');
      fh2.script_put_line(fh, '   DBMS_NETWORK_ACL_ADMIN.APPEND_HOST_ACE');
      fh2.script_put_line(fh, '      (host        => ''' || buff.host || '''');
      if upper(buff.privilege) != 'RESOLVE'
      then
         -- Oracle 12c Release 1 Database PL/SQL Packages and Types Reference
         -- 101 DBMS_NETWORK_ACL_ADMIN
         -- An ACE with a "resolve" privilege can be appended only to a host''s ACL without a port range.
         fh2.script_put_line(fh, '      ,lower_port  => ' || nvl(to_char(buff.lower_port),'NULL'));
         fh2.script_put_line(fh, '      ,upper_port  => ' || nvl(to_char(buff.upper_port),'NULL'));
      end if;
      fh2.script_put_line(fh, '      ,ace         => xs$ace_type');
      fh2.script_put_line(fh, '                         (privilege_list   => xs$name_list(''' || buff.privilege || ''')');
      fh2.script_put_line(fh, '                         ,granted          => TRUE');
      fh2.script_put_line(fh, '                         ,inverted         => FALSE');
      fh2.script_put_line(fh, '                         ,principal_name   => ''' || buff.principal || '''');
      fh2.script_put_line(fh, '                         ,principal_type   => xs_acl.ptype_db');
      fh2.script_put_line(fh, '                         ,start_date       => NULL');
      fh2.script_put_line(fh, '                         ,end_date         => NULL));');
      fh2.script_put_line(fh, 'end;');
      fh2.script_put_line(fh, '/');
      fh2.script_put_line(fh, '');
   end loop;
   if fh2.script_is_open(fh)
   then
      fh2.script_put_line(fh, 'set define on');
      fh2.script_close(fh);
   end if;
end grb_host_acls;

------------------------------------------------------------
-- Create Wallet Access Control Lists
procedure grb_wallet_acls
is
   --
   -- Oracle Database Security Guide Release 21
   -- F31285-17, April 2024
   -- Chapter 8 Managing Fine-Grained Access in PL/SQL Packages and Types
   -- 8.5 Configuring Access Control for External Network Services
   -- https://docs.oracle.com/en/database/oracle/oracle-database/21/dbseg/managing-fine-grained-access-in-pl-sql-packages-and-types.html#GUID-561E9D60-1414-4066-8214-8BBB6091956B
   --
   -- In this specification, **PRIVILEGE** must be one of the following when you
   --   enter wallet privileges using xs$ace_type (note the use of underscores
   --   in these privilege names):
   --   -) use_client_certificates
   --   -) use_passwords
   -- Be aware that for wallets, you must specify either the
   --   use_client_certificates or use_passwords privileges.
   --
   ELMNT        CONSTANT varchar2(100) := 'WALLET_ACL';
   fh           fh2.sf_ptr_type;  -- object script file handle
   old_file     varchar2(1000) := 'This is not a real file name !@#$%^';
   ----------------------------------------
begin
   --dbms_output.put_line('ELMNT: ' || ELMNT || ', g_build_type: ' || g_build_type ||
   --                     ', g_schema_name: ' || g_schema_name || ', ' || ELMNT);
   for buff in (select replace(replace(wacl_name,'$','_'),'%','_') || '.' || file_ext1
                                                                    FILE_NAME
                      ,wallet_path
                      ,object_name_regexp
                      ,grantee                                      PRINCIPAL
                      ,privilege
                      ,build_type_selector
                 from  priv_obj_wacl_view
                 where build_type         = g_build_type
                  and  principal_type     = 'DATABASE'       -- xs_acl.ptype_db
                  and  grant_type         = 'GRANT'
                  and  inverted_principal = 'NO'
                  and  privilege         is not null
                 group by replace(replace(wacl_name,'$','_'),'%','_') || '.' || file_ext1
                      ,wallet_path
                      ,object_name_regexp
                      ,grantee
                      ,privilege
                      ,build_type_selector
                 order by replace(replace(wacl_name,'$','_'),'%','_') || '.' || file_ext1
                      ,wallet_path
                      ,object_name_regexp
                      ,grantee
                      ,privilege
                      ,build_type_selector)
   loop
      if old_file != buff.file_name
      then
         old_file := buff.file_name;
         if fh2.script_is_open(fh)
         then
            fh2.script_put_line(fh, 'set define on');
            fh2.script_close(fh);
         end if;
         fh := fh2.script_open(in_filename     => replace(replace(buff.file_name,'/','_'),'\','_')
                              ,in_elmnt        => ELMNT
                              ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
         fh2.script_put_line(fh, '');
         fh2.script_put_line(fh, '--');
         fh2.script_put_line(fh, '--  Create Wallet ACL/ACE');
         fh2.script_put_line(fh, '--');
         fh2.script_put_line(fh, '-- Wallet ACLs with the following:');
         fh2.script_put_line(fh, '--    PRINCIPAL_TYPE      = ''DATABASE'' (xs_acl.ptype_db)');
         fh2.script_put_line(fh, '--    GRANT_TYPE          = ''GRANT''');
         fh2.script_put_line(fh, '--    INVERTED_PRINICIPAL = ''NO''');
         fh2.script_put_line(fh, '--    PRIVILEGE          is not null');
         fh2.script_put_line(fh, '-- Start Dates and End Dates are ignored (set to NULL).');
         fh2.script_put_line(fh, '--');
         fh2.script_put_line(fh, '');
         fh2.script_put_line(fh, 'set define off');
         fh2.script_put_line(fh, '');
      end if;
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--');
      fh2.script_put_line(fh, '--  NOTE: This is a "' || buff.build_type_selector || '" Wallet ACL');
      if buff.object_name_regexp is not null
      then
         fh2.script_put_line(fh, '--   (OBJECT_NAME_REGEXP: ' || buff.object_name_regexp || ')');
      end if;
      fh2.script_put_line(fh, '--');
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, 'begin');
      fh2.script_put_line(fh, '   DBMS_NETWORK_ACL_ADMIN.APPEND_WALLET_ACE');
      fh2.script_put_line(fh, '      (wallet_path => ''' || buff.wallet_path || '''');
      fh2.script_put_line(fh, '      ,ace         => xs$ace_type');
      fh2.script_put_line(fh, '                         (privilege_list   => xs$name_list(''' || buff.privilege || ''')');
      fh2.script_put_line(fh, '                         ,granted          => TRUE');
      fh2.script_put_line(fh, '                         ,inverted         => FALSE');
      fh2.script_put_line(fh, '                         ,principal_name   => ''' || buff.principal || '''');
      fh2.script_put_line(fh, '                         ,principal_type   => xs_acl.ptype_db');
      fh2.script_put_line(fh, '                         ,start_date       => NULL');
      fh2.script_put_line(fh, '                         ,end_date         => NULL));');
      fh2.script_put_line(fh, 'end;');
      fh2.script_put_line(fh, '/');
      fh2.script_put_line(fh, '');
   end loop;
   if fh2.script_is_open(fh)
   then
      fh2.script_put_line(fh, 'set define on');
      fh2.script_close(fh);
   end if;
end grb_wallet_acls;

------------------------------------------------------------
-- Common Create Procedure.  Only used for:
--   -) FUNCTION
--   -) PACKAGE_BODY
--   -) PACKAGE_SPEC
--   -) PROCEDURE
--   -) SCHEDULER_JOB
--   -) SCHEDULER_PROGRAM
--   -) SCHEDULER_SCHEDULE
--   -) SEQUENCE
--   -) TYPE_BODY
--   -) TYPE_SPEC
procedure grb_common
      (in_ELMNT      in varchar2
      ,in_type_name  in varchar2)
is
   fh         fh2.sf_ptr_type;  -- object script file handle
begin
   for buff in (select obj.object_name                      OBJECT_NAME
                      ,replace(replace(obj.object_name,'$','_'),'%','_') || '.' || obj.file_ext1
                                                            FILE_NAME
                      ,obj.build_timing
                      ,obj.object_type
                 from  obj_install_object_tab  obj
                 where obj.build_type   = g_build_type
                  and  obj.object_owner = g_schema_name
                  and  obj.element_name = in_ELMNT
                  and  (   obj.element_name != 'SCHEDULER_JOB'
                           -- Skip MV Scheduler Jobs, create with Materialized Views
                        or (    obj.object_name not like   'MV\_RF$J\_%' escape '\'
                            AND obj.object_name not like 'DBMS\_JOB$\_%' escape '\'
                       )   )
                  and  (   obj.element_name != 'SEQUENCE'
                        or (    -- Skip Queue Sequences, create with Advanced Queues
                                not exists (select 'x' from dba_queue_tables qt
                                             where qt.owner = g_schema_name
                                              and  regexp_like(obj.object_name,common_util.ADV_QUEUE_PREFIX_REGEXP ||
                                                                               qt.queue_table                       ||
                                                                               common_util.ADV_QUEUE_SUFFIX_REGEXP
                                           )                  )
                                -- Identity Sequences: Auto-created with Tables
                            and obj.object_name not in (select dti.sequence_name from dba_tab_identity_cols dti
                                                         where dti.owner = obj.object_owner
                                                       )
                                -- Ignore Spatial Data Object Supplemental Sequences
                            and not regexp_like(obj.object_name, common_util.SDO_TABLE_REGEXP)
                       )   )
                  and  (   obj.element_name not in ('TYPE_BODY', 'TYPE_SPEC')
                        or (    -- Skip Pipelined Type Objects, create with pipelined package/function
                                obj.object_name not like common_util.SYS_PIPELINE_PATTERN escape '\'
                                -- Unknown type specifications, table of numbers, no dependencies
                            and obj.object_name not like common_util.SYS_TYPE_REGEXP escape '\'
                       )   )
                 order by object_name)
   loop
      fh := fh2.script_open(in_filename     => buff.file_name
                           ,in_elmnt        => in_ELMNT
                           ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--');
      fh2.script_put_line(fh, '--  Create ' || g_schema_name || '.' || buff.OBJECT_NAME ||' ' || in_type_name);
      fh2.script_put_line(fh, '--');
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, 'set define off');
      fh2.script_put_line(fh, '');
      if buff.build_timing != 'CURRENT'
      then
         fh2.script_put_line(fh, '');
         fh2.script_put_line(fh, '-- Note: This is a "' || buff.build_timing || '" ' || buff.object_type);
      end if;
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--DBMS_METADATA:' || g_schema_name ||
                                             '.' || buff.OBJECT_NAME);
      fh2.put_big_line(fh, g_schema_name || '.' || buff.OBJECT_NAME || ' ' || in_type_name
                      ,COMMON_UTIL.escape_at_sign
                         (dbms_metadata.get_ddl
                            (object_type => case in_ELMNT
                                               -- https://logbuffer.wordpress.com/2014/03/13/oracle-getting-the-ddl-for-scheduler-jobs
                                               when 'SCHEDULER_JOB'      then 'PROCOBJ'
                                               when 'SCHEDULER_PROGRAM'  then 'PROCOBJ'
                                               when 'SCHEDULER_SCHEDULE' then 'PROCOBJ'
                                                                         else in_ELMNT
                                            end
                            ,name        => buff.OBJECT_NAME
                            ,schema      => g_schema_name) )
                      ,common_util.MAXIMUM_SQL_LENGTH);
      if buff.object_type not in ('PACKAGE BODY', 'TYPE BODY')
      then
         fh2.script_put_line(fh, '');
         grb_object_grants(fh, buff.OBJECT_NAME, buff.object_type);
         grb_object_synonyms(fh, buff.OBJECT_NAME, buff.object_type, common_util.MAXIMUM_SQL_LENGTH);
      end if;
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, 'set define on');
      fh2.script_close(fh);
   end loop;
end grb_common;

------------------------------------------------------------
-- Create Comprehensive Data Loader
procedure grb_comp_data_loader
is
   ELMNT       CONSTANT varchar2(100) := 'DATA_LOAD';
   F_DATE      CONSTANT varchar2(100) := 'DD-MON-YYYY HH24:MI:SS';
   F_TSTTZ     CONSTANT varchar2(100) := 'DD-MON-YYYY HH24:MI:SS.FF TZH:TZM';
   F_TST       CONSTANT varchar2(100) := 'DD-MON-YYYY HH24:MI:SS.FF';
   F_IDTOS     CONSTANT varchar2(100) := 'DD HH24:MI:SS.FF';
   fh          fh2.sf_ptr_type;  -- object script file handle
   lc          varchar2(100);  -- Lead characters
   sql_txt     varchar2(32767);
   desc_tab    dbms_sql.desc_tab3;
   dyn_curs    integer;
   dyn_stat    integer;
   num_cols    number := 0;
   col_err     number;
   col_len     integer;
   junk        integer;
   --
   --  SYS.DBMS_SQL Package Specification, Named Datatype CONSTANTS
   --
   --  User_Defined_Type is Data Type ID 109. Requires col_type_name
   --    and col_type_name_len from DBMS_SQL.DESC_REC3 Record Type
   --
   --  Ref_Type is Data Type ID 111. Requires a declared "object type".
   --
   vc2_buff          varchar2(32767);                    -- Data Type ID   1
   char_buff         char(32767);                        -- Data Type ID  96
   --
   num_buff          number;                             -- Data Type ID   2
   --bfloat_buff       binary_double;                      -- Data Type ID 101
   --float_buff        binary_float;                       -- Data Type ID 100
   --
   date_buff         date;                               -- Data Type ID  12
   tstmp_buff        timestamp(9);                       -- Data Type ID 180
   tstmptz_buff      timestamp(9) with time zone;        -- Data Type ID 181
   tstmpltz_buff     timestamp(9) with local time zone;  -- Data Type ID 231
   intvlds_buff      interval day(9) to second(9);       -- Data Type ID 183
   --intvlym_buff      interval year to month;             -- Data Type ID 182
   --
   clob_buff         clob;                               -- Data Type ID 112
   xml_buff          xmltype;                            -- Data Type ID 109, Also for SDO Types and User Types
   blob_buff         blob;                               -- Data Type ID 113
   --bfile_buff        bfile;                              -- Data Type ID 114
$IF DBMS_DB_VERSION.VERSION > 19
$THEN
   json_buff         json;                               -- Data Type ID 119;
$END
   --long_buff         long;                               -- Data Type ID   8
   --lraw_buff         long raw;                           -- Data Type ID  24
   --
   --mlslbl_buff       mlslabel;                           -- Data Type ID 106
   raw_buff          raw(32767);                         -- Data Type ID  23
   --rowid_buff        rowid;                              -- Data Type ID  11
   --urowid_buff       urowid;                             -- Data Type ID 208
   --
   procedure show_col_err
         (in_table_name  in  varchar2
         ,in_col_type    in  varchar2
         ,in_i           in  number)
   is
   begin
      -- 1405 is zero length value retrieved?
      if nvl(col_err,0) not in (0, 1405)
      then
         dbms_output.put_line('COL_ERR is not 0 or 5 in' ||
                             ' BUILD_TYPE ' || g_build_type          ||
                                   ', table ' || g_schema_name           ||
                                          '.' || in_table_name           ||
                                         ', ' || in_col_type             ||
                                   ' column ' || desc_tab(in_i).col_name ||
                                  ', length ' || col_len                 ||
                                         ': ' || col_err                 );
      end if;
   end show_col_err;
   --
   procedure utf_put_clob
   is
      ptr     integer := 1;
      loc     integer;
   begin
      loop
         -- Find a linefeed
         loc := instr(clob_buff, LF, ptr);
         exit when loc = 0;
         if substr(clob_buff, loc-1, 1) = CRTN
         then
            fh2.script_put(fh, substr(clob_buff, ptr, loc-ptr));
         else
            fh2.script_put(fh, substr(clob_buff, ptr, loc-ptr+1));
         end if;
         ptr := loc+1;
      end loop;
      -- Need Double Quote at end of clob_buff.
      fh2.script_put(fh, substr(clob_buff, ptr));
   end utf_put_clob;
   --
   procedure disable_ras_policy (in_table in varchar2) is
      SQL_TXT   constant varchar2(1000) := 'begin GRAB_RAS.DISABLE_POLICY(:1, :2); end;';
   begin
      if NOT installed_types_aa.EXISTS('grbras') then return; end if;
      execute immediate SQL_TXT using in g_schema_name, in_table;
   exception when others then
      if NOT regexp_like (SQLERRM, 'PLS-00201: identifier ''GRAB_RAS.DISABLE_POLICY'' must be declared')
      then
         raise_application_error(-20000, 'Execute Immediate ERROR' || CHR(10) ||
                                          SQL_TXT                  || CHR(10) ||
                                          '  :1 ' || g_schema_name || CHR(10) ||
                                          '  :2 ' || in_table      || CHR(10) ||
                                          SQLERRM                  || CHR(10) ||
                                         dbms_utility.format_error_backtrace );
      end if;
   end disable_ras_policy;
   --
   procedure enable_ras_policy (in_table in varchar2) is
      SQL_TXT   constant varchar2(1000) := 'begin GRAB_RAS.ENABLE_POLICY(:1, :2); end;';
   begin
      if NOT installed_types_aa.EXISTS('grbras') then return; end if;
      execute immediate SQL_TXT using in g_schema_name, in_table;
   exception when others then
      if NOT regexp_like (SQLERRM, 'PLS-00201: identifier ''GRAB_RAS.ENABLE_POLICY'' must be declared')
      then
         raise_application_error(-20000, 'Execute Immediate ERROR' || CHR(10) ||
                                          SQL_TXT                  || CHR(10) ||
                                          '  :1 ' || g_schema_name || CHR(10) ||
                                          '  :2 ' || in_table      || CHR(10) ||
                                          SQLERRM                  || CHR(10) ||
                                         dbms_utility.format_error_backtrace );
      end if;
   end enable_ras_policy;
   --
begin
   --
   for tabs in
      (select table_name                                                        TABLE_NAME
             ,replace(replace(table_name,'$','_'),'%','_') || '.' || file_ext1  FILE_NAME
             ,replace(replace(table_name,'$','_'),'%','_') || '.' || file_ext2  CTL_FILE
             ,replace(replace(table_name,'$','_'),'%','_') || '.' || file_ext3  DAT_FILE
             ,replace(replace(table_name,'$','_'),'%','_') || '.log'            LOG_FILE
             ,before_select_sql
             ,columns_removed
             ,where_clause
             ,order_by_columns
             ,after_order_by_sql
             ,build_timing
        from  obj_install_data_load_tab  sdvw
        where build_type    = g_build_type
         and  table_owner   = g_schema_name
         and  element_name = ELMNT
        order by table_name)
   loop
      --
      -- DBMS_SQL Open, Parse, Describe
      if tabs.before_select_sql is not null
      then
         sql_txt := tabs.before_select_sql || LF;
      else
         sql_txt := '';
      end if;
      --
      sql_txt := sql_txt || 'select ';
      for cols in (select dc.column_name from dba_tab_columns  dc
                    where dc.owner      = g_schema_name
                     and  dc.table_name = tabs.table_name
                     and (                                   tabs.columns_removed is null
                          OR NOT regexp_like(dc.column_name, tabs.columns_removed)    )
                    order by dc.column_id)
      loop
         sql_txt := sql_txt || '"' || cols.column_name || '",';
      end loop;
      sql_txt := substr(sql_txt, 1, length(sql_txt)-1);
      sql_txt := sql_txt || ' from "' || g_schema_name   || '"' ||
                                 '."' || tabs.table_name || '"' ;
      --
      if tabs.where_clause is not null
      then
         sql_txt := sql_txt || LF || 'where ' || tabs.where_clause;
      end if;
      -- ORDER_BY_COLUMNS is required
      sql_txt := sql_txt || LF || 'order by ' || tabs.order_by_columns;
      --
      if tabs.after_order_by_sql is not null
      then
         sql_txt := sql_txt || LF || tabs.after_order_by_sql;
      end if;
      --
      dyn_curs := dbms_sql.open_cursor;
      begin
         dbms_sql.parse(c             => dyn_curs
                       ,statement     => sql_txt
                       ,language_flag => dbms_sql.native );
      exception when others then
         raise_application_error(-20000, 'DBMS_SQL Parse Error: ' || SQLERRM || CHR(10) ||
                                         sql_txt || ';' ||  CHR(10) || CHR(10) );
      end;
      dbms_sql.describe_columns3(c        => dyn_curs
                                ,col_cnt  => num_cols
                                ,desc_t   => desc_tab );
      ----------------------------
      -- Setup the Control File --
      ----------------------------
      fh := fh2.script_open(in_filename     => tabs.ctl_file
                           ,in_elmnt        => ELMNT
                           ,in_max_linesize => common_util.MAXIMUM_LOADER_LENGTH);
      fh2.script_put_line(fh, 'OPTIONS (SKIP=1)');
      fh2.script_put_line(fh, 'LOAD DATA');
      fh2.script_put_line(fh, 'APPEND INTO TABLE "' || g_schema_name || '"."' || tabs.table_name || '"');
      fh2.script_put_line(fh, 'FIELDS CSV WITH EMBEDDED');
      fh2.script_put_line(fh, 'TRAILING NULLCOLS');
      --
      -- Add Column Spec and Bind Variable to Dynamic Cursor
      lc := '   (';
      for i in 1 .. num_cols
      loop
         grb_cldr_array_lvl := 0;
         case
         when desc_tab(i).col_type = DBMS_SQL.VARCHAR2_TYPE
         then
            fh2.script_put_line(fh, lc || common_util.old_rpad(desc_tab(i).col_name,30) ||
                              ' CHAR(' || desc_tab(i).col_max_len       || ')');
            dbms_sql.define_column(c            => dyn_curs
                                  ,position     => i
                                  ,column       => vc2_buff
                                  ,column_size  => desc_tab(i).col_max_len);
            --
         when desc_tab(i).col_type = DBMS_SQL.CHAR_TYPE
         then
            fh2.script_put_line(fh, lc || common_util.old_rpad(desc_tab(i).col_name,30) ||
                              ' CHAR(' || desc_tab(i).col_max_len       || ')');
            dbms_sql.define_column_char(c            => dyn_curs
                                       ,position     => i
                                       ,column       => char_buff
                                       ,column_size  => desc_tab(i).col_max_len);
            --
         when desc_tab(i).col_type = DBMS_SQL.NUMBER_TYPE
         then
            fh2.script_put_line(fh, lc || common_util.old_rpad(desc_tab(i).col_name,30) ||
                                    ' FLOAT EXTERNAL' );
            dbms_sql.define_column(c         => dyn_curs
                                  ,position  => i
                                  ,column    => num_buff);
            --
         when desc_tab(i).col_type = DBMS_SQL.DATE_TYPE
         then
            fh2.script_put_line(fh, lc || common_util.old_rpad(desc_tab(i).col_name,30) ||
                            ' DATE ''' || F_DATE                        || '''');
            dbms_sql.define_column(c         => dyn_curs
                                  ,position  => i
                                  ,column    => date_buff);
            --
         when desc_tab(i).col_type = DBMS_SQL.TIMESTAMP_TYPE
         then
            fh2.script_put_line(fh, lc || common_util.old_rpad(desc_tab(i).col_name,30) ||
                       ' TIMESTAMP ''' || F_TST                         || '''');
            dbms_sql.define_column(c         => dyn_curs
                                  ,position  => i
                                  ,column    => tstmp_buff);
            --
         when desc_tab(i).col_type = DBMS_SQL.TIMESTAMP_WITH_TZ_TYPE
         then
            fh2.script_put_line(fh, lc || common_util.old_rpad(desc_tab(i).col_name,30) ||
    ' TIMESTAMP WITH TIME ZONE ''' || F_TSTTZ                       || '''');
            dbms_sql.define_column(c         => dyn_curs
                                  ,position  => i
                                  ,column    => tstmptz_buff);
            --
         when desc_tab(i).col_type = DBMS_SQL.TIMESTAMP_WITH_LOCAL_TZ_TYPE
         then
            fh2.script_put_line(fh, lc || common_util.old_rpad(desc_tab(i).col_name,30) ||
' TIMESTAMP WITH LOCAL TIME ZONE ''' || F_TST                         || '''');
            dbms_sql.define_column(c         => dyn_curs
                                  ,position  => i
                                  ,column    => tstmpltz_buff);
            --
         when desc_tab(i).col_type = DBMS_SQL.INTERVAL_DAY_TO_SECOND_TYPE
         then
           fh2.script_put_line (fh, lc || common_util.old_rpad(desc_tab(i).col_name,30) ||
         ' INTERVAL DAY TO SECOND' ); -- Don't use F_IDTOS
            dbms_sql.define_column(c         => dyn_curs
                                  ,position  => i
                                  ,column    => intvlds_buff);
            --
         when desc_tab(i).col_type = DBMS_SQL.BLOB_TYPE
         then
            fh2.script_put_line(fh, '      -- BLOB data must be decoded from Base64 after loading');
            fh2.script_put_line(fh, lc || common_util.old_rpad(desc_tab(i).col_name,30) ||
                  ' CHAR(1572864)' );  -- 1048576 * 1.5
            dbms_sql.define_column(c         => dyn_curs
                                  ,position  => i
                                  ,column    => blob_buff);
            --
$IF DBMS_DB_VERSION.VERSION > 19
$THEN
         when desc_tab(i).col_type = DBMS_SQL.JSON_TYPE
         then
            fh2.script_put_line(fh, lc || common_util.old_rpad(desc_tab(i).col_name,30) ||
                  ' CHAR(1048576)' );
            dbms_sql.define_column(c         => dyn_curs
                                  ,position  => i
                                  ,column    => json_buff);
$END
            --
         when desc_tab(i).col_type = DBMS_SQL.CLOB_TYPE
         then
            fh2.script_put_line(fh, lc || common_util.old_rpad(desc_tab(i).col_name,30) ||
                  ' CHAR(1048576)' );
            dbms_sql.define_column(c         => dyn_curs
                                  ,position  => i
                                  ,column    => clob_buff);
            --
         when     desc_tab(i).col_type      = DBMS_SQL.USER_DEFINED_TYPE
              and desc_tab(i).col_type_name = 'XMLTYPE'
         then
            fh2.script_put_line(fh, lc || common_util.old_rpad(desc_tab(i).col_name,30) ||
                  ' CHAR(1048576)' );
            dbms_sql.define_column(c         => dyn_curs
                                  ,position  => i
                                  ,column    => xml_buff);
            --
         when desc_tab(i).col_type = DBMS_SQL.RAW_TYPE
         then
            fh2.script_put_line(fh, lc || common_util.old_rpad(desc_tab(i).col_name,30) ||
                    ' CHAR(32767)' );
            dbms_sql.define_column_raw(c            => dyn_curs
                                      ,position     => i
                                      ,column       => raw_buff
                                      ,column_size  => desc_tab(i).col_max_len);
            --
         when desc_tab(i).col_type_name in ('SDO_ELEM_INFO_ARRAY', 'SDO_GEOMETRY', 'SDO_ORDINATE_ARRAY', 'SDO_POINT_TYPE', 'ST_GEOMETRY')
         then
            if installed_types_aa.EXISTS('grbsdo')
            then
               sql_txt := 'begin GRAB_SDO.GRB_CLDR_DEFINE(' || dyn_curs || ', ' || i || ', :1, :2, :3); end;';
               begin
                  execute immediate sql_txt using in out lc, in out fh, in out desc_tab;
               exception when others then
                  if NOT regexp_like (SQLERRM, 'PLS-00201: identifier ''GRAB_SDO.GRB_CLDR_DEFINE'' must be declared')
                  then
                     raise_application_error(-20000, 'Execute Immediate ERROR' || CHR(10) ||
                                                      SQL_TXT                  || CHR(10) ||
                                                      SQLERRM                  || CHR(10) ||
                                                      dbms_utility.format_error_backtrace );
                  end if;
               end;
            end if;
            --
         else
            raise_application_error(-20000, 'Unknown DBMS_SQL DESC_TAB3 col_type ' || desc_tab(i).col_type ||
                                          ', col_type_name ' || desc_tab(i).col_type_name ||
                                           ' for column ' || desc_tab(i).col_name ||
                                           ' in table ' || g_schema_name || '.' || tabs.table_name);
            --
         end case;
         lc := '   ,';
      end loop;
      --
      fh2.script_put_line(fh, '   )');
      fh2.script_close(fh);
      -------------------------
      -- Setup the Data File --
      -------------------------
      fh := fh2.script_open(in_filename     => tabs.dat_file
                           ,in_elmnt        => ELMNT
                           ,in_max_linesize => common_util.MAXIMUM_LOADER_LENGTH);
      disable_ras_policy(tabs.table_name);
      --
      -- Write the column header
      lc := '';
      for i in 1 .. num_cols
      loop
         -- List of column names
         fh2.script_put(fh, lc || '"' || desc_tab(i).col_name || '"');
         lc := ',';
      end loop;
      fh2.script_new_line(fh);
      --
      -- Fetch the Records
      -- The return from execute is undefined for queries
      junk := dbms_sql.execute(dyn_curs);
      while dbms_sql.fetch_rows(dyn_curs) > 0
      loop
         --
         -- Add the data
         lc := '';
         for i in 1 .. num_cols
         loop
            grb_cldr_array_lvl := 0;
            case
            when desc_tab(i).col_type = DBMS_SQL.VARCHAR2_TYPE
            then
               dbms_sql.column_value(c              => dyn_curs
                                    ,position       => i
                                    ,value          => vc2_buff
                                    ,column_error   => col_err
                                    ,actual_length  => col_len);
               -- VARCHAR2, CHAR, and CLOB use the same format
               show_col_err(tabs.table_name, 'VARCHAR2', i);
               fh2.script_put(fh, lc);
               if vc2_buff is not null
               then
                  clob_buff := '"' || replace(vc2_buff,'"','""')  || '"';
                  utf_put_clob;
               end if;
               --
            when desc_tab(i).col_type = DBMS_SQL.CHAR_TYPE
            then
               dbms_sql.column_value_char(c              => dyn_curs
                                         ,position       => i
                                         ,value          => char_buff
                                         ,column_error   => col_err
                                         ,actual_length  => col_len);
               -- VARCHAR2, CHAR, and CLOB use the same fh2.script_put format
               show_col_err(tabs.table_name, 'CHAR', i);
               fh2.script_put(fh, lc);
               if char_buff is not null
               then
                  clob_buff := '"' || replace(substr(char_buff, 1, col_len)
                                             ,'"','""')           || '"';
                  utf_put_clob;
               end if;
               --
            when desc_tab(i).col_type = DBMS_SQL.CLOB_TYPE
            then
               dbms_sql.column_value(c         => dyn_curs
                                    ,position  => i
                                    ,value     => clob_buff);
               -- VARCHAR2, CHAR, and CLOB use the same fh2.script_put format
               fh2.script_put(fh, lc);
               if clob_buff is not null
               then
                  clob_buff := '"' || replace(clob_buff,'"','""') || '"';
                  utf_put_clob;
               end if;
               --
            when desc_tab(i).col_type = DBMS_SQL.NUMBER_TYPE
            then
               dbms_sql.column_value(c              => dyn_curs
                                    ,position       => i
                                    ,value          => num_buff
                                    ,column_error   => col_err
                                    ,actual_length  => col_len);
               show_col_err(tabs.table_name, 'NUMBER', i);
               fh2.script_put(fh, lc || to_char(num_buff));
               --
            when desc_tab(i).col_type = DBMS_SQL.DATE_TYPE
            then
               dbms_sql.column_value(c              => dyn_curs
                                    ,position       => i
                                    ,value          => date_buff
                                    ,column_error   => col_err
                                    ,actual_length  => col_len);
               show_col_err(tabs.table_name, 'DATE', i);
               fh2.script_put(fh, lc);
               if date_buff is not null
               then
                  fh2.script_put(fh, '"' || to_char(date_buff, F_DATE) || '"');
               end if;
               --
            when desc_tab(i).col_type = DBMS_SQL.TIMESTAMP_TYPE
            then
               dbms_sql.column_value(c         => dyn_curs
                                    ,position  => i
                                    ,value     => tstmp_buff);
               fh2.script_put(fh, lc);
               if tstmp_buff is not null
               then
                  fh2.script_put(fh, '"' || to_char(tstmp_buff,  F_TST) || '"');
               end if;
               --
            when desc_tab(i).col_type = DBMS_SQL.TIMESTAMP_WITH_TZ_TYPE
            then
               dbms_sql.column_value(c         => dyn_curs
                                    ,position  => i
                                    ,value     => tstmptz_buff);
               fh2.script_put(fh, lc);
               if tstmptz_buff is not null
               then
                  fh2.script_put(fh, '"' || to_char(tstmptz_buff,  F_TSTTZ) || '"');
               end if;
               --
            when desc_tab(i).col_type = DBMS_SQL.TIMESTAMP_WITH_LOCAL_TZ_TYPE
            then
               dbms_sql.column_value(c          => dyn_curs
                                     ,position  => i
                                     ,value     => tstmpltz_buff);
               fh2.script_put(fh, lc);
               if tstmpltz_buff is not null
               then
                  fh2.script_put(fh, '"' || to_char(tstmpltz_buff,  F_TST) || '"');
               end if;
               --
            when desc_tab(i).col_type = DBMS_SQL.INTERVAL_DAY_TO_SECOND_TYPE
            then
               dbms_sql.column_value(c          => dyn_curs
                                     ,position  => i
                                     ,value     => intvlds_buff);
               fh2.script_put(fh, lc);
               if intvlds_buff is not null
               then
                  fh2.script_put(fh, '"' || to_char(intvlds_buff,  F_IDTOS) || '"');
               end if;
               --
            when     desc_tab(i).col_type      = DBMS_SQL.USER_DEFINED_TYPE
                 and desc_tab(i).col_type_name = 'XMLTYPE'
            then
               dbms_sql.column_value(c         => dyn_curs
                                    ,position  => i
                                    ,value     => xml_buff);
               fh2.script_put(fh, lc);
               if xml_buff is not null
               then
                  if nvl(DBMS_LOB.GETLENGTH(xmltype.getClobVal(xml_buff)),0) <= 0
                  then
                     clob_buff := '';
                  else
                     -- This avoids a ORA-22275 "invalid LOB locator specified"
                     --DBMS_LOB.CREATETEMPORARY(lob_loc => clob_buff
                     --                        ,cache   => TRUE
                     --                        ,dur     => DBMS_LOB.CALL);
                     -- ORA-03001 from SUBSTR on output from getclobval from a binary XML (Doc ID 2016996.1)
                     --   The LOB returned by getClobVal() is an abstract CSX LOB
                     DBMS_LOB.COPY (dest_lob    => clob_buff
                                   ,src_lob     => xmltype.getClobVal(xml_buff)
                                   ,amount      => 2147483647   -- 2Gb - 1
                                   ,dest_offset => 1
                                   ,src_offset  => 1);
                     clob_buff := '"' || replace(clob_buff, '"', '""') || '"';
                  end if;
                  utf_put_clob;
               end if;
               --
            when desc_tab(i).col_type = DBMS_SQL.BLOB_TYPE
            then
               dbms_sql.column_value(c          => dyn_curs
                                     ,position  => i
                                     ,value     => blob_buff);
               fh2.script_put(fh, lc);
               if blob_buff is not null
               then
                  -- Note: b64_encode inserts Line Feeds in the data
                  clob_buff := '"' || COMMON_UTIL.b64_encode(blob_buff, TRUE) || '"';
                  utf_put_clob;
               end if;
               --
$IF DBMS_DB_VERSION.VERSION > 19
$THEN
            when desc_tab(i).col_type = DBMS_SQL.JSON_TYPE
            then
               dbms_sql.column_value(c         => dyn_curs
                                    ,position  => i
                                    ,value     => json_buff);
               -- VARCHAR2, CHAR, and CLOB use the same fh2.script_put format
               fh2.script_put(fh, lc);
               if json_buff is not null
               then
                  clob_buff := '"' || replace(json_serialize(json_buff returning clob pretty ascii)
                                             ,'"','""') || '"';
                  utf_put_clob;
               end if;
$END
               --
            when desc_tab(i).col_type = DBMS_SQL.RAW_TYPE
            then
               dbms_sql.column_value_raw(c              => dyn_curs
                                        ,position       => i
                                        ,value          => raw_buff
                                        ,column_error   => col_err
                                        ,actual_length  => col_len);
               show_col_err(tabs.table_name, 'RAW', i);
               fh2.script_put(fh, lc);
               if raw_buff is not null
               then
                  -- Note: b64_encode inserts Line Feeds in the data
                  clob_buff := '"' || COMMON_UTIL.b64_encode(raw_buff, TRUE) || '"';
                  utf_put_clob;
               end if;
               --
            when desc_tab(i).col_type_name in ('SDO_ELEM_INFO_ARRAY', 'SDO_GEOMETRY', 'SDO_ORDINATE_ARRAY', 'SDO_POINT_TYPE', 'ST_GEOMETRY')
            then
               if installed_types_aa.EXISTS('grbsdo')
               then
                  sql_txt := 'begin GRAB_SDO.GRB_CLDR_VALUE(' || dyn_curs || ', ' || i || ', :1, :2, :3); end;';
                  begin
                     execute immediate sql_txt using in out lc, in out fh, in out desc_tab;
                  exception when others then
                     if NOT regexp_like (SQLERRM, 'PLS-00201: identifier ''GRAB_SDO.GRB_CLDR_VALUE'' must be declared')
                     then
                        raise_application_error(-20000, 'Execute Immediate ERROR' || CHR(10) ||
                                                         SQL_TXT                  || CHR(10) ||
                                                         SQLERRM                  || CHR(10) ||
                                                         dbms_utility.format_error_backtrace );
                     end if;
                 end;
               end if;
               --
            else
               raise_application_error(-20000, 'Unknown DBMS_SQL DESC_TAB3 col_type ' || desc_tab(i).col_type ||
                                            ', col_type_name ' || desc_tab(i).col_type_name ||
                                             ' for column ' || desc_tab(i).col_name ||
                                             ' in table ' || g_schema_name || '.' || tabs.table_name);
               --
            end case;
            lc := ',';  -- Add comma after the first column
         end loop;
         --
         fh2.script_new_line(fh);
         --
      end loop;
      --
      enable_ras_policy(tabs.table_name);
      fh2.script_close(fh);
      -------------------------------
      -- Setup the SQL Script File --
      -------------------------------
      fh := fh2.script_open(in_filename     => tabs.file_name
                           ,in_elmnt        => ELMNT
                           ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--');
      fh2.script_put_line(fh, '--  Comprehensive Data Loader script for ' || g_schema_name   ||
                                                                      '.' || tabs.table_name || ' data');
      fh2.script_put_line(fh, '--');
      fh2.script_put_line(fh, '-- Command Line Parameters:');
      fh2.script_put_line(fh, '--   1 - SYSTEM/password@TNSALIAS');
      fh2.script_put_line(fh, '--       i.e. pass the username and password for the SYSTEM user');
      fh2.script_put_line(fh, '--            and the TNSALIAS for the connection to the database.');
      fh2.script_put_line(fh, '--       The Data Load installation requires this connection information.');
      fh2.script_put_line(fh, '--');
      if tabs.build_timing != 'CURRENT'
      then
         fh2.script_put_line(fh, '');
         fh2.script_put_line(fh, '-- Note: This is a "' || tabs.build_timing || '" Comprehensive Data Loader');
      end if;
      --
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, 'prompt');
      fh2.script_put_line(fh, 'prompt Disable Triggers and Foreign Keys');
      fh2.script_put_line(fh, 'declare');
      fh2.script_put_line(fh, '   procedure run_sql (in_sql in varchar2) is begin');
      fh2.script_put_line(fh, '      dbms_output.put_line(in_sql || '';'');');
      fh2.script_put_line(fh, '      execute immediate in_sql;');
      fh2.script_put_line(fh, '   exception when others then');
      fh2.script_put_line(fh, '      dbms_output.put_line(''-- '' || SQLERRM || CHR(10));');
      fh2.script_put_line(fh, '   end run_sql;');
      fh2.script_put_line(fh, 'begin');
      fh2.script_put_line(fh, '   for buff in (select owner, trigger_name');
      fh2.script_put_line(fh, '                 from  dba_triggers');
      fh2.script_put_line(fh, '                 where table_owner = ''' || g_schema_name || '''');
      fh2.script_put_line(fh, '                  and  table_name = ''' || tabs.table_name || '''');
      fh2.script_put_line(fh, '                 order by owner, trigger_name)');
      fh2.script_put_line(fh, '   loop');
      fh2.script_put_line(fh, '      run_sql(''alter trigger "'' || buff.owner        || ''"'' ||');
      fh2.script_put_line(fh, '                           ''."'' || buff.trigger_name || ''" DISABLE'');');
      fh2.script_put_line(fh, '   end loop;');
      fh2.script_put_line(fh, '   for buff in (select constraint_name');
      fh2.script_put_line(fh, '                 from  dba_constraints');
      fh2.script_put_line(fh, '                 where constraint_type = ''R''');
      fh2.script_put_line(fh, '                  and  owner = ''' || g_schema_name || '''');
      fh2.script_put_line(fh, '                  and  table_name = ''' || tabs.table_name || '''');
      fh2.script_put_line(fh, '                 order by constraint_name)');
      fh2.script_put_line(fh, '   loop');
      fh2.script_put_line(fh, '      run_sql(''alter table "' || g_schema_name || '"."' || tabs.table_name || '"'' ||');
      fh2.script_put_line(fh, '              '' DISABLE constraint "'' || buff.constraint_name || ''"'');');
      fh2.script_put_line(fh, '   end loop;');
      fh2.script_put_line(fh, '   for buff in (select owner, index_name');
      fh2.script_put_line(fh, '                 from  dba_indexes');
      fh2.script_put_line(fh, '                 where index_type = ''DOMAIN''');
      fh2.script_put_line(fh, '                  and  table_owner = ''' || g_schema_name || '''');
      fh2.script_put_line(fh, '                  and  table_name = ''' || tabs.table_name || '''');
      fh2.script_put_line(fh, '                 order by owner, index_name)');
      fh2.script_put_line(fh, '   loop');
      fh2.script_put_line(fh, '      run_sql(''alter index "'' || buff.owner || ''"."'' || buff.index_name || ''"'' ||');
      fh2.script_put_line(fh, '              '' DISABLE'');');
      fh2.script_put_line(fh, '   end loop;');
      fh2.script_put_line(fh, 'end;');
      fh2.script_put_line(fh, '/');
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '-- Additional file extensions');
      fh2.script_put_line(fh, '--   .bad - Bad Records');
      fh2.script_put_line(fh, '--   .dsc - Discard Records');
      fh2.script_put_line(fh, '--   .log - Log File');
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, 'prompt');
      fh2.script_put_line(fh, 'prompt sqlldr_control=' || g_schema_name || '/' || tabs.ctl_file);
      fh2.script_put_line(fh, 'host sqlldr ''&1.'' control=' || g_schema_name || '/' || tabs.ctl_file ||
                                                    ' data=' || g_schema_name || '/' || tabs.dat_file ||
                                                     ' log=' || g_schema_name || '/' || tabs.log_file ||
                                                    ' silent=HEADER,FEEDBACK' );
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, 'begin');
      fh2.script_put_line(fh, '   if ''&_RC.'' != ''0'' then');
      fh2.script_put_line(fh, '      raise_application_error(-20000, ''Control file "' || g_schema_name || '/' || tabs.ctl_file ||
                                                                    '" returned error: &_RC.'');' );
      fh2.script_put_line(fh, '   end if;');
      fh2.script_put_line(fh, 'end;');
      fh2.script_put_line(fh, '/');
      fh2.script_put_line(fh, '');
      --
      for i in 1 .. num_cols
      loop
         if desc_tab(i).col_type in (DBMS_SQL.BLOB_TYPE, DBMS_SQL.RAW_TYPE)
         then
            fh2.script_put_line(fh, 'declare');
            fh2.script_put_line(fh, '   l_blob          blob;');
            fh2.script_put_line(fh, '   the_blob        blob;');
            fh2.script_put_line(fh, '   procedure b64_decode');
            fh2.script_put_line(fh, '         (in_blob  in BLOB)');
            fh2.script_put_line(fh, '   is');
            fh2.script_put_line(fh, '      BASE64_ENCODE_HEADER      constant varchar2(30) := ''' || common_util.BASE64_ENCODE_HEADER || ''';');
            fh2.script_put_line(fh, '      SPLIT_LEN              constant pls_integer  := 32764;    -- Must be divisible by 4');
            fh2.script_put_line(fh, '      header_txt    varchar2(128);');
            fh2.script_put_line(fh, '      len_blob      pls_integer;');
            fh2.script_put_line(fh, '      ptr           pls_integer;');
            fh2.script_put_line(fh, '   begin');
            fh2.script_put_line(fh, '      dbms_lob.trim(l_blob, 0);');
            fh2.script_put_line(fh, '      dbms_lob.trim(the_blob, 0);');
            fh2.script_put_line(fh, '      ----------------------------------------');
            fh2.script_put_line(fh, '      -- Check incoming BLOB sizes (and return if needed)');
            fh2.script_put_line(fh, '      if in_blob is null then return; end if;');
            fh2.script_put_line(fh, '      len_blob := length(in_blob);');
            fh2.script_put_line(fh, '      if len_blob = 0 then return; end if;');
            fh2.script_put_line(fh, '      ----------------------------------------');
            fh2.script_put_line(fh, '      -- Check for BASE64_ENCODE_HEADER in in_BLOB');
            fh2.script_put_line(fh, '      header_txt := utl_raw.cast_to_varchar2(dbms_lob.substr(in_blob');
            fh2.script_put_line(fh, '                                                            ,length(BASE64_ENCODE_HEADER)');
            fh2.script_put_line(fh, '                                                            ,1)                       );');
            fh2.script_put_line(fh, '      if header_txt != BASE64_ENCODE_HEADER');
            fh2.script_put_line(fh, '      then');
            fh2.script_put_line(fh, '         raise_application_error(-20000, ''BASE64_ENCODE_HEADER missing from data: '' || header_txt);');
            fh2.script_put_line(fh, '      end if;');
            fh2.script_put_line(fh, '      ----------------------------------------');
            fh2.script_put_line(fh, '      -- Create "L_BLOB" after removing BASE64_ENCODE_HEADER, Carriage Returns, and Line Feeds');
            fh2.script_put_line(fh, '      ptr := 1 + length(BASE64_ENCODE_HEADER);  -- Skip over the header');
            fh2.script_put_line(fh, '      while ptr <= len_blob');
            fh2.script_put_line(fh, '      loop');
            fh2.script_put_line(fh, '         dbms_lob.append(l_blob');
            fh2.script_put_line(fh, '                        ,utl_raw.translate(dbms_lob.substr(in_blob');
            fh2.script_put_line(fh, '                                                          ,SPLIT_LEN');
            fh2.script_put_line(fh, '                                                          ,ptr)');
            fh2.script_put_line(fh, '                                          ,hextoraw(''000D0A'')       -- NULL, Carriage Return, Line Feed');
            fh2.script_put_line(fh, '                                          ,hextoraw(''00'')   )   );  -- NULL');
            fh2.script_put_line(fh, '         ptr := ptr + SPLIT_LEN;');
            fh2.script_put_line(fh, '      end loop;');
            fh2.script_put_line(fh, '      len_blob := length(l_blob);');
            fh2.script_put_line(fh, '      ----------------------------------------');
            fh2.script_put_line(fh, '      --  Create "THE_BLOB" after Base64 Decoding');
            fh2.script_put_line(fh, '      ptr := 1;');
            fh2.script_put_line(fh, '      while ptr <= len_blob');
            fh2.script_put_line(fh, '      loop');
            fh2.script_put_line(fh, '         dbms_lob.append(the_blob');
            fh2.script_put_line(fh, '                        ,UTL_ENCODE.BASE64_DECODE(dbms_lob.substr(l_blob');
            fh2.script_put_line(fh, '                                                                 ,SPLIT_LEN');
            fh2.script_put_line(fh, '                                                                 ,ptr)   )   );');
            fh2.script_put_line(fh, '         ptr := ptr + SPLIT_LEN;');
            fh2.script_put_line(fh, '      end loop;');
            fh2.script_put_line(fh, '   end b64_decode;');
            fh2.script_put_line(fh, 'begin');
            fh2.script_put_line(fh, '   dbms_lob.createtemporary(l_blob, true);');
            fh2.script_put_line(fh, '   dbms_lob.createtemporary(the_blob, true);');
            fh2.script_put_line(fh, '   for buff in (select ROWID RID, "' || desc_tab(i).col_name || '"');
            fh2.script_put_line(fh, '                 from  "' || g_schema_name || '"."' || tabs.table_name || '"');
            fh2.script_put_line(fh, '                 for update of "' || desc_tab(i).col_name || '")');
            fh2.script_put_line(fh, '   loop');
            fh2.script_put_line(fh, '      b64_decode(buff."' || desc_tab(i).col_name || '");');
            fh2.script_put_line(fh, '      -- This overwrites the Base64 Encoded String with the original binary data');
            fh2.script_put_line(fh, '      update "' || g_schema_name || '"."' || tabs.table_name || '"');
            fh2.script_put_line(fh, '        set  "' || desc_tab(i).col_name || '" = the_blob');
            fh2.script_put_line(fh, '       where rowid = buff.rid;');
            fh2.script_put_line(fh, '   end loop;');
            fh2.script_put_line(fh, '   dbms_lob.freetemporary(l_blob);');
            fh2.script_put_line(fh, '   dbms_lob.freetemporary(the_blob);');
            fh2.script_put_line(fh, 'end;');
            fh2.script_put_line(fh, '/');
            fh2.script_put_line(fh, '');
            fh2.script_put_line(fh, 'commit;');
            fh2.script_put_line(fh, '');
         end if;
      end loop;
      --
      fh2.script_close(fh);
      --
      dbms_sql.close_cursor(dyn_curs);
      --
   end loop;
   --
end grb_comp_data_loader;

------------------------------------------------------------
-- Create Database Link
procedure grb_database_links
is
   ELMNT      CONSTANT varchar2(100) := 'DB_LINK';
   fh         fh2.sf_ptr_type;  -- object script file handle
begin
   for buf1 in (select obj.object_name                      DB_LINK_NAME
                      ,replace(replace(obj.object_name,'$','_'),'%','_') || '.' || obj.file_ext1
                                                            FILE_NAME
                      ,obj.object_owner                     USERNAME
                      ,lnk.host
                      ,obj.build_timing
                 from  obj_install_object_tab  obj
                       join dba_db_links  lnk
                            on  lnk.owner   = obj.object_owner
                            and lnk.db_link = obj.object_name
                 where obj.build_type    = g_build_type
                  and  obj.object_owner  = g_schema_name
                  and  obj.element_name   = ELMNT
                 order by obj.object_name)
   loop
      fh := fh2.script_open(in_filename     => buf1.file_name
                           ,in_elmnt        => ELMNT
                           ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--');
      fh2.script_put_line(fh, '--  Create ' || g_schema_name || '.' || buf1.db_link_name ||' Database Link');
      fh2.script_put_line(fh, '--');
      fh2.script_put_line(fh, '-- Public Database Links can be captured in OBJECT_CONF');
      fh2.script_put_line(fh, '--   -) USERNAME:     PUBLIC');
      fh2.script_put_line(fh, '--   -) ELEMENT_NAME: DB_LINK');
      fh2.script_put_line(fh, '--   Sripts will be created in SYSTEM folder.');
      fh2.script_put_line(fh, '--');
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, 'set define off');
      fh2.script_put_line(fh, '');
      if buf1.build_timing != 'CURRENT'
      then
         fh2.script_put_line(fh, '');
         fh2.script_put_line(fh, '-- Note: This is a "' || buf1.build_timing || '" Database Link');
      end if;
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, 'begin');
      fh2.script_put_line(fh, '  for buff in (select db_link from dba_db_links');
      fh2.script_put_line(fh, '                where owner   = ''' || g_schema_name || '''');
      fh2.script_put_line(fh, '                 and  db_link like ''' || buf1.db_link_name || '%'')');
      fh2.script_put_line(fh, '  loop');
      fh2.script_put_line(fh, '     execute immediate ''drop database link '' || buff.db_link;');
      fh2.script_put_line(fh, '  end loop;');
      fh2.script_put_line(fh, 'end;');
      fh2.script_put_line(fh, '/');
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '-- DBMS_METADATA will not create clear text passwords');
      fh2.script_put_line(fh, '--DBMS_METADATA:' || g_schema_name || '.' || buf1.db_link_name);
      fh2.put_big_line(fh, g_schema_name || '.' || buf1.db_link_name || ' DB Link'
                      ,dbms_metadata.get_ddl(object_type => 'DB_LINK'
                                            ,name        => buf1.db_link_name
                                            ,schema      => g_schema_name)
                      ,common_util.MAXIMUM_SQL_LENGTH);
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '-- No grants on Database Links');
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--  Synonyms - Non-unique Database Link name causes problems');
      fh2.script_put_line(fh, '--  because DBA_SYNONYMS does not display database link owner.');
      for buf2 in (select target_owner                 OWNER
                         ,synonym_name
                         ,build_type_selector
                    from  obj_install_synonym_tab
                    where build_type    = g_build_type
                     and  synonym_owner = g_schema_name
                     and  db_link       = buf1.db_link_name
                     and  element_name   = 'SYNONYM'
                    order by target_owner
                         ,synonym_name)
      loop
         fh2.script_put_line(fh, '');
         dbms_output.put_line('-- ' || buf2.build_type_selector || ' found.' || LF ||
                              '--   buf1.FILE_NAME = '    || buf1.file_name    || LF ||
                              '--   buf1.DB_LINK_NAME = ' || buf1.db_link_name || LF ||
                              '--   buf2.SYNONYM_NAME = ' || buf2.synonym_name || LF ||
                              '--   g_schema_name = '     || g_schema_name     || LF ||
                              '--   g_build_type = '    || g_build_type    );
         fh2.script_put_line(fh, '--DBMS_METADATA:' || buf2.owner ||
                                                '.' || buf2.synonym_name);
         fh2.put_big_line(fh, buf2.owner || '.' || buf2.synonym_name || ' Synonym'
                         ,dbms_metadata.get_ddl(object_type => 'SYNONYM'
                                               ,name        => buf2.synonym_name
                                               ,schema      => buf2.owner)
                         ,common_util.MAXIMUM_SQL_LENGTH);
      end loop;
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, 'set define on');
      fh2.script_close(fh);
   end loop;
end grb_database_links;

------------------------------------------------------------
-- Create Database Trigger
--   There are no PUBLIC Database Triggers
--   https://docs.oracle.com/en/database/oracle/oracle-database/21/lnpls/CREATE-TRIGGER-statement.html
procedure grb_database_triggers
is
   ELMNT      CONSTANT varchar2(100) := 'DATABASE_TRIGGER';
   fh         fh2.sf_ptr_type;  -- object script file handle
begin
   for buff in (select object_name              TRIGGER_NAME
                      ,file_ext1
                      ,build_timing
                 from  obj_install_object_tab
                 where build_type    = g_build_type
                  and  object_owner  = g_schema_name
                  and  element_name   = ELMNT
                 order by trigger_name
                      ,file_ext1
                      ,build_timing)
   loop
      if NOT fh2.script_is_open(fh)
      then
         fh := fh2.script_open(in_filename     => replace(replace(g_schema_name,'$','_'),'%','_') || '.' || buff.file_ext1
                              ,in_elmnt        => ELMNT
                              ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
         fh2.script_put_line(fh, '');
         fh2.script_put_line(fh, '--');
         fh2.script_put_line(fh, '--  Create Database Triggers for ' || g_build_type);
         fh2.script_put_line(fh, '--');
         fh2.script_put_line(fh, '');
         fh2.script_put_line(fh, 'set define off');
         fh2.script_put_line(fh, '');
      end if;
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--  NOTE: This is a "' || buff.build_timing || '" Trigger');
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--DBMS_METADATA:' || g_schema_name      ||
                                             '.' || buff.trigger_name  );
      fh2.put_big_line(fh, g_schema_name || '.' || buff.trigger_name || ' Trigger'
                      ,COMMON_UTIL.escape_at_sign
                         (dbms_metadata.get_ddl
                            (object_type => 'TRIGGER'
                            ,name        => buff.trigger_name
                            ,schema      => g_schema_name) )
                      ,common_util.MAXIMUM_SQL_LENGTH);
   end loop;
   if fh2.script_is_open(fh)
   then
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, 'set define on');
      fh2.script_close(fh);
   end if;
end grb_database_triggers;

------------------------------------------------------------
-- Create Database Directory
procedure grb_directories
is
   TYPE dir_aa_type is table of varchar2(1)
        index by dba_directories.directory_path%TYPE;
   dir_aa     dir_aa_type;
   dbuff      dba_directories.directory_path%TYPE;
   --  "create directory" should only be run by SYSTEM
   ELMNT      CONSTANT varchar2(100) := 'DIRECTORY';
   fh         fh2.sf_ptr_type;  -- object script file handle
   old_dir    dba_directories.directory_name%TYPE;
   sql_txt    varchar2(32767);
begin
   for buf1 in(select directory_name
                     ,grantee                   GRANTEE
                     ,privilege
                     ,max(grantable)            GRANTABLE
                     ,directory_path
                     ,replace(replace(directory_name,'$','_'),'%','_') || '.' || file_ext1
                                                FILE_NAME
                     --,replace(replace(directory_name,'$','_'),'%','_') || '.' || file_ext2
                     --                           BASH_NAME
                     --,replace(replace(directory_name,'$','_'),'%','_') || '.' || file_ext3
                     --                           BATCH_NAME
                     ,build_timing
                from  priv_obj_dir_view
                where build_type       = g_build_type
                 and  directory_owner  = 'SYS'
                 and  element_name      = ELMNT
                group by directory_name
                     ,grantee
                     ,privilege
                     ,directory_path
                     ,replace(replace(directory_name,'$','_'),'%','_') || '.' || file_ext1
                     --,replace(replace(directory_name,'$','_'),'%','_') || '.' || file_ext2
                     --,replace(replace(directory_name,'$','_'),'%','_') || '.' || file_ext3
                     ,build_timing
                order by directory_name
                     ,grantee
                     ,privilege)
   loop
      if buf1.directory_name != nvl(old_dir,'###BOGUS###')
      then
         if old_dir is not null
         then
            fh2.script_put_line(fh, 'set define on');
            fh2.script_close(fh);
         end if;
         old_dir := buf1.directory_name;
         fh := fh2.script_open(in_filename     => buf1.file_name
                              ,in_elmnt        => ELMNT
                              ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
         fh2.script_put_line(fh, '');
         fh2.script_put_line(fh, '--');
         fh2.script_put_line(fh, '--  Create ' || buf1.directory_name ||' Database Directory');
         fh2.script_put_line(fh, '--');
         fh2.script_put_line(fh, '--   Duplicate CREATE DIRECTORY scripts will be created');
         fh2.script_put_line(fh, '--      in different build types because directories are');
         fh2.script_put_line(fh, '--      created based on permissions, not owners.');
         fh2.script_put_line(fh, '--');
         fh2.script_put_line(fh, '');
         fh2.script_put_line(fh, 'set define off');
         fh2.script_put_line(fh, '');
         fh2.script_put_line(fh, '');
         -- If this is run by a DBA other than SYS, DBMS_METADATA
         --    will only return directories granted with GRANT option
         sql_txt := 'create or replace directory "' || buf1.directory_name || '"' || LF ||
                                         '   as ''' || buf1.directory_path || '''';
         fh2.put_big_line(fh, buf1.directory_name || ' Directory', sql_txt || ';', common_util.MAXIMUM_SQL_LENGTH);
         dir_aa(buf1.directory_path) := 'X';
         fh2.script_put_line(fh, '');
         fh2.script_put_line(fh, '');
         fh2.script_put_line(fh, '--  Grants');
         fh2.script_put_line(fh, '');
         for buf2 in (select directory_name
                            ,grantee                  GRANTEE
                            ,privilege
                       from  priv_obj_dir_view
                       where build_type      = 'pub'
                        --and  build_timing  = 'CURRENT'  All Public Directories are CURRENT
                        and  directory_owner = 'SYS'
                        and  element_name     = ELMNT
                       group by directory_name
                            ,grantee
                            ,privilege
                       order by directory_name
                            ,grantee
                            ,privilege)
         loop
            if buf2.directory_name = buf1.directory_name
            then
               fh2.script_put_line(fh, 'grant ' || buf2.privilege ||
                                       ' on directory "'  || buf1.directory_name ||
                                       '" to "' || buf2.grantee || '";');
            end if;
         end loop;
      end if;
      if buf1.build_timing != 'CURRENT'
      then
         fh2.script_put_line(fh, '-- Note: This is a "' || buf1.build_timing || '" Directory Grant');
      end if;
      -- Oracle Database 12c Release 1 Database SQL Language Reference
      -- "on_object_clause"
      -- Users, directory schema objects, editions, data mining models, Java
      --   source and resource schema objects, and SQL translation profiles
      --   are identified separately because they reside in separate namespaces.
      -- If this is run by a DBA other than SYS, DBMS_METADATA
      --    will only return directories granted with GRANT option
      sql_txt := 'grant ' || buf1.privilege ||
                  ' on directory "'  || buf1.directory_name ||
                  '" to "' || buf1.grantee || '"';
      -- Missing "with hierarchy option" ...
      if buf1.grantable = 'YES'
      then
         sql_txt := sql_txt || ' with grant option';
      end if;
      fh2.script_put_line(fh, sql_txt || ';');
      fh2.script_put_line(fh, '');
   end loop;
   if old_dir is not null
   then
      fh2.script_put_line(fh, 'set define on');
      fh2.script_close(fh);
      --dbms_output.put_line('buf1.bash_name = ' || buf1.bash_name);
      fh := fh2.script_open(in_filename     =>  'create_directories.sh'
                           ,in_elmnt        => ELMNT
                           ,in_max_linesize => common_util.MAXIMUM_BASH_LENGTH);
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '#');
      fh2.script_put_line(fh, '#  Create Directories for Linux');
      fh2.script_put_line(fh, '#');
      fh2.script_put_line(fh, '');
      dbuff := dir_aa.FIRST;
      loop
         fh2.script_put_line(fh, 'mkdir -p '  || replace(dbuff,'\','/'));
         exit when dbuff = dir_aa.LAST;
         dbuff := dir_aa.NEXT(dbuff);
      end loop;
      fh2.script_put_line(fh, '');
      dbuff := dir_aa.FIRST;
      loop
         fh2.script_put_line(fh, 'chmod 777 ' || replace(dbuff,'\','/'));
         exit when dbuff = dir_aa.LAST;
         dbuff := dir_aa.NEXT(dbuff);
      end loop;
      fh2.script_put_line(fh, '');
      fh2.script_close(fh);
      --dbms_output.put_line('buf1.bash_name = ' || buf1.batch_name);
      fh := fh2.script_open(in_filename     => 'create_directories.bat'
                           ,in_elmnt        => ELMNT
                           ,in_max_linesize => common_util.MAXIMUM_CMD_LENGTH);
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, 'REM');
      fh2.script_put_line(fh, 'REM  Create Directories for Windows');
      fh2.script_put_line(fh, 'REM');
      fh2.script_put_line(fh, '');
      dbuff := dir_aa.FIRST;
      loop
         fh2.script_put_line(fh, 'md '  || replace(dbuff,'/','\'));
         exit when dbuff = dir_aa.LAST;
         dbuff := dir_aa.NEXT(dbuff);
      end loop;
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, 'REM set db_owner=oracle');
      fh2.script_put_line(fh, '');
      dbuff := dir_aa.FIRST;
      loop
         fh2.script_put_line(fh, 'REM icacls '|| replace(dbuff,'/','\') || ' /grant %db_owner%:F /T');
         exit when dbuff = dir_aa.LAST;
         dbuff := dir_aa.NEXT(dbuff);
      end loop;
      fh2.script_put_line(fh, '');
      fh2.script_close(fh);
   end if;
end grb_directories;

------------------------------------------------------------
-- Create Foreign Keys
procedure grb_foreign_keys
      (in_elmnt  in varchar2)
is
   fh         fh2.sf_ptr_type;  -- object script file handle
   old_tab    varchar2(1000);
   fname      varchar2(1000);
begin
   old_tab := 'This is not a Table Name.';
   for buff in (select fk.base_table_name                   TABLE_NAME
                      ,replace(replace(fk.base_table_name,'$','_'),'%','_') || '.' || fk.file_ext1
                                                            FILE_NAME
                      ,fk.base_table_type
                      ,fk.foreign_key_name
                      ,fk.build_type_selector
                 from  obj_install_fkey_tab  fk
                 where fk.base_table_owner = g_schema_name  --Doesn't work with Views
                  and  fk.element_name      = in_elmnt
                  and  fk.build_type       = g_build_type
                 order by fk.base_table_name
                      ,fk.foreign_key_name  )
   loop
      if buff.table_name != old_tab
      then
         if fh2.script_is_open(fh)
         then
            fh2.script_put_line(fh, '');
            fh2.script_put_line(fh, 'set define on');
            fh2.script_close(fh);
         end if;
         old_tab := buff.table_name;
         fh := fh2.script_open(in_filename     => buff.file_name
                              ,in_elmnt        => in_elmnt
                              ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
         fh2.script_put_line(fh, '');
         fh2.script_put_line(fh, '--');
         fh2.script_put_line(fh, '--  Create Foreign Keys for ' || g_schema_name   ||
                                                            '.' || buff.table_name ||
                                                            ' ' || buff.base_table_type);
         fh2.script_put_line(fh, '--');
         fh2.script_put_line(fh, '');
         fh2.script_put_line(fh, 'set define off');
         fh2.script_put_line(fh, '');
      end if;
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--  NOTE: This is a "' || buff.build_type_selector || '" Foreign Key');
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--DBMS_METADATA:' || g_schema_name        ||
                                             '.' || buff.foreign_key_name );
      fh2.put_big_line(fh, g_schema_name || '.' || buff.table_name || ' Ref Constraint'
                      ,dbms_metadata.get_ddl(object_type  => 'REF_CONSTRAINT'
                                            ,name         => buff.foreign_key_name
                                            ,schema       => g_schema_name)
                      ,common_util.MAXIMUM_SQL_LENGTH);
   end loop;
   if fh2.script_is_open(fh)
   then
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, 'set define on');
      fh2.script_close(fh);
   end if;
end grb_foreign_keys;

------------------------------------------------------------
-- Create Index Scripts
procedure grb_indexes
      (in_elmnt  in VARCHAR2)
is
   fh                fh2.sf_ptr_type;  -- object script file handle
   old_own           varchar2(1000);
   old_tab           varchar2(1000);
   fname             varchar2(1000);
   sql_txt           varchar2(1000);
begin
   old_own := 'This is not an Owner Name.';
   old_tab := 'This is not a Table name.';
   for buff in (select ind.table_owner
                      ,ind.table_name
                      ,replace(replace(ind.table_name,'$','_'),'%','_') || '.' || ind.file_ext1
                                                          FILE_NAME
                      ,ind.table_type
                      ,ind.index_owner
                      ,ind.index_name
                      ,ind.file_ext1                      INDEX_EXT
                      ,ind.index_type
                      ,ind.ityp_owner
                      ,ind.ityp_name
                      ,ind.build_type_selector
                 from  obj_install_index_tab  ind
                 where ind.build_type     = g_build_type
                  and  ind.index_owner    = g_schema_name
                  and  ind.element_name    = in_elmnt
                  and  ind.index_type    != 'LOB'    -- LOB Indexes are auto-created
                  and  (ind.table_owner, ind.table_name) not in (
                       select xt.owner, xt.table_name
                        from  dba_xml_tables  xt)      -- XMLTable Indexes are auto-created
                  and  not exists (
                       -- Primary Key and Unique Key Indexes are auto-created
                       select 'x' from dba_constraints cons
                        where cons.constraint_type in ('P','U')
                         and  cons.owner       = ind.table_owner
                         and  cons.table_name  = ind.table_name
                         and  cons.index_owner = ind.index_owner
                         and  cons.index_name  = ind.index_name)
                  and  NOT regexp_like(ind.index_name, common_util.ORACLE_TEXT_TABLE_REGEXP)
                  and  ind.index_name not like common_util.RECYCLE_BIN_PATTERN escape '\'
                  and  ind.index_name != common_util.MVIEW_AUTO_INDEX_PREFIX || ind.table_name
                 order by ind.table_owner
                      ,ind.table_name
                      ,ind.index_owner
                      ,ind.index_name)
   loop
      if    buff.table_owner != old_own
         or buff.table_name  != old_tab
      then
         if fh2.script_is_open(fh)
         then
            fh2.script_put_line(fh, '');
            fh2.script_put_line(fh, 'set define on');
            fh2.script_close(fh);
         end if;
         old_own := buff.table_owner;
         old_tab := buff.table_name;
         if buff.table_owner = g_schema_name
         then
            fname := buff.file_name;
         else
            fname := buff.table_owner || '.' || buff.file_name;
         end if;
         fh := fh2.script_open(in_filename     => fname --buff.file_name
                              ,in_elmnt        => in_elmnt
                              ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
         fh2.script_put_line(fh, '');
         fh2.script_put_line(fh, '--');
         fh2.script_put_line(fh, '--  Create Indexes for ' || buff.table_owner ||
                                                       '.' || buff.table_name  ||
                                                       ' ' || buff.table_type  );
         fh2.script_put_line(fh, '--');
         fh2.script_put_line(fh, '');
         fh2.script_put_line(fh, 'set define off');
         fh2.script_put_line(fh, '');
      end if;
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--  NOTE: This is a "' || buff.build_type_selector || '" Index');
      fh2.script_put_line(fh, '');
      if     buff.index_type = 'DOMAIN'
         AND buff.ityp_owner = 'MDSYS'
         AND installed_types_aa.EXISTS('grbsdo')
      then
         fh2.script_put_line(fh, '-- The MDSYS Domain Index "' || buff.index_owner ||
                                                         '"."' || buff.index_name  || CHR(10) ||
                                 '--   installation script is located in the "root" folder because' || CHR(10) ||
                                 '--   it must be executed using the "' || buff.index_owner || '" database login.');
         fh2.script_put_line(fh, '');
         --
         sql_txt := 'begin GRAB_SDO.GRB_IND(:1, :2, :3, :4, :5, :6, :7, :8); end;';
         begin
            execute immediate sql_txt using buff.table_owner, buff.table_name, buff.table_type,
                                            buff.index_owner, buff.index_name, buff.index_ext,
                                            buff.ityp_owner,  buff.ityp_name;
         exception when others then
            if NOT regexp_like (SQLERRM, 'PLS-00201: identifier ''GRAB_SDO.GRB_IND'' must be declared')
            then
               raise_application_error(-20000, 'Execute Immediate ERROR' || CHR(10) ||
                                                SQL_TXT                  || CHR(10) ||
                                                SQLERRM                  || CHR(10) ||
                                                dbms_utility.format_error_backtrace );
            end if;
         end;
      else
         fh2.script_put_line(fh, '--DBMS_METADATA:' || buff.index_owner ||
                                                '.' || buff.index_name  );
         fh2.put_big_line(fh, g_schema_name || '.' || buff.table_name || ' ' || buff.table_type
                         ,dbms_metadata.get_ddl(object_type => 'INDEX'
                                               ,name        => buff.index_name
                                               ,schema      => buff.index_owner)
                         ,common_util.MAXIMUM_SQL_LENGTH);
      end if;
   end loop;
   if fh2.script_is_open(fh)
   then
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, 'set define on');
      fh2.script_close(fh);
   end if;
end grb_indexes;

------------------------------------------------------------
-- Create Master Installation Script
procedure grb_install_master
is
   fh         fh2.sf_ptr_type;  -- object script file handle
   fname      varchar2(1000) := 'install.sql';
   l_loc      varchar2(256)  := 'grb_install_master';
begin
   --
   fh := fh2.script_open(in_filename     => fname
                        ,in_elmnt        => 'INSTALL_SCRIPT'
                        ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
   fh2.script_put_line(fh, '');
   fh2.script_put_line(fh, '--');
   fh2.script_put_line(fh, '--  Master Installation Script');
   fh2.script_put_line(fh, '--    All scripts created by "https://ODBCapture.org", Version ' || get_version);
   fh2.script_put_line(fh, '--');
   fh2.script_put_line(fh, '--  Must be run as SYS');
   fh2.script_put_line(fh, '--');
   fh2.script_put_line(fh, '-- Command Line Parameters:');
   fh2.script_put_line(fh, '--   1 - TO_PDB_SYSTEM: SYSTEM/password@TNSALIAS');
   fh2.script_put_line(fh, '--       i.e. pass the username and password for the SYSTEM user');
   fh2.script_put_line(fh, '--            and the TNSALIAS for the connection to the pluggable database.');
   fh2.script_put_line(fh, '--       The Data Load installation requires this connection information.');
   fh2.script_put_line(fh, '--');
   fh2.script_put_line(fh, '');
   fh2.script_put_line(fh, '--  NOTE: If running in a Linux based Docker Container from a Windows FileSystem Mount, run this first:');
   fh2.script_put_line(fh, '--    dos2unix -f -o ../install/*/*.csv ../install/*/*/*.csv');
   fh2.script_put_line(fh, '');
   fh2.script_put_line(fh, 'define TOP_PDB_SYSTEM="&1."');
   fh2.script_put_line(fh, 'set serveroutput on size unlimited format wrapped');
   fh2.script_put_line(fh, '');
   fh2.script_put_line(fh, '----------------------------------------');
   fh2.script_put_line(fh, 'prompt Identify this Module in V$SESSION');
   fh2.script_put_line(fh, 'set appinfo "' || g_build_type || ' Installation"');
   fh2.script_put_line(fh, '');
   fh2.script_put_line(fh, '----------------------------------------');
   fh2.script_put_line(fh, 'prompt Setup Abort on Error');
   fh2.script_put_line(fh, 'WHENEVER SQLERROR EXIT SQL.SQLCODE');
   fh2.script_put_line(fh, 'WHENEVER OSERROR EXIT');
   fh2.script_put_line(fh, '');
   fh2.script_put_line(fh, '----------------------------------------');
   fh2.script_put_line(fh, 'prompt');
   fh2.script_put_line(fh, 'prompt **************************');
   fh2.script_put_line(fh, 'prompt *  Run SYS Installation  *');
   fh2.script_put_line(fh, 'prompt **************************');
   fh2.script_put_line(fh, 'prompt');
   fh2.script_put_line(fh, '@install_sys.sql "" "" ""');
   fh2.script_put_line(fh, '');
   fh2.script_put_line(fh, '----------------------------------------');
   fh2.script_put_line(fh, 'prompt Setup Continue on Error');
   fh2.script_put_line(fh, 'WHENEVER SQLERROR CONTINUE');
   fh2.script_put_line(fh, 'WHENEVER OSERROR CONTINUE');
   fh2.script_put_line(fh, '');
   fh2.script_put_line(fh, '----------------------------------------');
   fh2.script_put_line(fh, 'prompt');
   fh2.script_put_line(fh, 'prompt *****************************');
   fh2.script_put_line(fh, 'prompt *  Run SYSTEM Installation  *');
   fh2.script_put_line(fh, 'prompt *****************************');
   fh2.script_put_line(fh, 'prompt');
   fh2.script_put_line(fh, 'connect &TOP_PDB_SYSTEM.');
   fh2.script_put_line(fh, 'set serveroutput on size unlimited format wrapped');
   fh2.script_put_line(fh, '@install_system.sql "" "" ""');
   fh2.script_put_line(fh, '');
   fh2.script_put_line(fh, '----------------------------------------');
   fh2.script_put_line(fh, 'prompt');
   fh2.script_put_line(fh, 'prompt *************************');
   fh2.script_put_line(fh, 'prompt *  Install Application  *');
   fh2.script_put_line(fh, 'prompt *************************');
   fh2.script_put_line(fh, 'prompt');
   fh2.script_put_line(fh, '@install_' || g_build_type || '.sql "&TOP_PDB_SYSTEM." "" ""');
   fh2.script_put_line(fh, '');
   fh2.script_put_line(fh, '----------------------------------------');
   fh2.script_put_line(fh, 'set appinfo "Null"');
   fh2.script_put_line(fh, 'set appinfo off');
   fh2.script_put_line(fh, 'prompt');
   fh2.script_put_line(fh, 'prompt "' || g_build_type || '" Installation is Done.');
   fh2.script_put_line(fh, '');
   fh2.script_close(fh);
   --
   fh := fh2.script_open(in_filename     => 'dbi.sql'
                        ,in_elmnt        => 'INSTALL_SCRIPT'
                        ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
   fh2.put_big_line(in_fh      => fh
                   ,in_loc     => l_loc
                   ,in_txt     => root_scripts.dbi_sql(g_build_type)
                   ,in_max_len => common_util.MAXIMUM_SQL_LENGTH);
   fh2.script_close(fh);
   --
   fh := fh2.script_open(in_filename     => 'installation_finalize.sql'
                        ,in_elmnt        => 'INSTALL_SCRIPT'
                        ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
   fh2.put_big_line(in_fh      => fh
                   ,in_loc     => l_loc
                   ,in_txt     => root_scripts.installation_finalize_sql(g_build_type)
                   ,in_max_len => common_util.MAXIMUM_SQL_LENGTH);
   fh2.script_close(fh);
   --
   fh := fh2.script_open(in_filename     => 'installation_prepare.sql'
                        ,in_elmnt        => 'INSTALL_SCRIPT'
                        ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
   fh2.put_big_line(in_fh      => fh
                   ,in_loc     => l_loc
                   ,in_txt     => root_scripts.installation_prepare_sql(g_build_type)
                   ,in_max_len => common_util.MAXIMUM_SQL_LENGTH);
   fh2.script_close(fh);
   --
   fh := fh2.script_open(in_filename     => 'odbcapture_installation_logs.cldr'
                        ,in_elmnt        => 'INSTALL_SCRIPT'
                        ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
   fh2.put_big_line(in_fh      => fh
                   ,in_loc     => l_loc
                   ,in_txt     => root_scripts.odbcapture_installation_logs_cldr(g_build_type)
                   ,in_max_len => common_util.MAXIMUM_SQL_LENGTH);
   fh2.script_close(fh);
   --
   fh := fh2.script_open(in_filename     => 'odbcapture_installation_logs.csv'
                        ,in_elmnt        => 'INSTALL_SCRIPT'
                        ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
   fh2.put_big_line(in_fh      => fh
                   ,in_loc     => l_loc
                   ,in_txt     => root_scripts.odbcapture_installation_logs_csv(g_build_type)
                   ,in_max_len => common_util.MAXIMUM_SQL_LENGTH);
   fh2.script_close(fh);
   --
   fh := fh2.script_open(in_filename     => 'odbcapture_installation_logs.ctl'
                        ,in_elmnt        => 'INSTALL_SCRIPT'
                        ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
   fh2.put_big_line(in_fh      => fh
                   ,in_loc     => l_loc
                   ,in_txt     => root_scripts.odbcapture_installation_logs_ctl(g_build_type)
                   ,in_max_len => common_util.MAXIMUM_SQL_LENGTH);
   fh2.script_close(fh);
   --
   fh := fh2.script_open(in_filename     => 'report_status.sql'
                        ,in_elmnt        => 'INSTALL_SCRIPT'
                        ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
   fh2.put_big_line(in_fh      => fh
                   ,in_loc     => l_loc
                   ,in_txt     => root_scripts.report_status_sql(g_build_type)
                   ,in_max_len => common_util.MAXIMUM_SQL_LENGTH);
   fh2.script_close(fh);
   --
   fh := fh2.script_open(in_filename     => 'list_invalids.csv'
                        ,in_elmnt        => 'INSTALL_SCRIPT'
                        ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
   fh2.put_big_line(in_fh      => fh
                   ,in_loc     => l_loc
                   ,in_txt     => root_scripts.list_invalids_csv(g_build_type)
                   ,in_max_len => common_util.MAXIMUM_SQL_LENGTH);
   fh2.script_close(fh);
   --
   fh := fh2.script_open(in_filename     => 'set_user_authentication.sql'
                        ,in_elmnt        => 'INSTALL_SCRIPT'
                        ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
   fh2.put_big_line(in_fh      => fh
                   ,in_loc     => l_loc
                   ,in_txt     => root_scripts.set_user_authentication_sql(g_build_type)
                   ,in_max_len => common_util.MAXIMUM_SQL_LENGTH);
   fh2.script_close(fh);
   --
   grb_ras_acls;               -- Moved from "gen_schemas"
   --
end grb_install_master;

------------------------------------------------------------
-- Create Schema (Non SYS/SYSTEM) Installation Script
procedure grb_install_schemas
is
   fh             fh2.sf_ptr_type;  -- object script file handle
   fname          varchar2(1000) := 'install_' || replace(replace(g_build_type,'$','_'),'%','_') || '.sql';
   file_id        pls_integer;
begin
   fh := fh2.script_open(in_filename     => fname
                        ,in_elmnt        => 'INSTALL_SCRIPT'
                        ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
   --
   fh2.script_put_line(fh, '');
   fh2.script_put_line(fh, '--');
   fh2.script_put_line(fh, '--  ' || g_build_type || ' Installation Script');
   fh2.script_put_line(fh, '--');
   fh2.script_put_line(fh, '--  Must be run as a SYSTEM User (DBA)');
   fh2.script_put_line(fh, '--');
   fh2.script_put_line(fh, '-- Command Line Parameters:');
   fh2.script_put_line(fh, '--   1 - INSTALL_SYSTEM_CONNECT: SYSTEM/password@TNSALIAS');
   fh2.script_put_line(fh, '--       i.e. pass the username and password for the SYSTEM user');
   fh2.script_put_line(fh, '--            and the TNSALIAS for the connection to the database.');
   fh2.script_put_line(fh, '--       The Data Load installation requires this connection information.');
   fh2.script_put_line(fh, '--');
   fh2.script_put_line(fh, '');
   fh2.script_put_line(fh, 'spool install_' || g_build_type || '.log');
   fh2.script_put_line(fh, '');
   fh2.script_put_line(fh, 'define INSTALL_SYSTEM_CONNECT="&1."');
   fh2.script_put_line(fh, '');
   fh2.script_put_line(fh, '-- For Oracle Change Data Capture (CDC) packages');
   fh2.script_put_line(fh, 'set sqlprefix "~"');
   fh2.script_put_line(fh, '');
   fh2.script_put_line(fh, '-- Escape character: "^P", CHR(16), DLE');
   fh2.script_put_line(fh, 'set escape OFF');
   fh2.script_put_line(fh, 'set escape "' || CHR(16) || '"');
   fh2.script_put_line(fh, '');
   fh2.script_put_line(fh, '----------------------------------------');
   fh2.script_put_line(fh, '--  Prepare for Install');
   fh2.script_put_line(fh, '@dbi.sql "./installation_prepare.sql" "" "&INSTALL_SYSTEM_CONNECT."');
   fh2.script_put_line(fh, '');
   --
   for buff in (select nvl(object_type, element_name)    OBJECT_TYPE
                      ,element_seq, file_ext2, file_ext3
                 from  element_conf
                 where element_seq > 0
                 order by element_seq)
   loop
      if fh2.sf_aa(g_build_type).EXISTS(buff.element_seq)
      then
         fh2.script_put_line(fh, '----------------------------------------');
         fh2.script_put_line(fh, '-- ' || buff.object_type || ' Install');
         fh2.script_put_line(fh, '');
         file_id := fh2.sf_aa(g_build_type)(buff.element_seq).FIRST;
         loop
            -- RegExp: "([.]ctl|[.]csv)$" Any string ending with ".ctl" or ".csv"
            if not regexp_like(fh2.sf_aa(g_build_type)(buff.element_seq)(file_id).filename
                              , '([.]' || buff.file_ext2 ||
                                '|[.]' || buff.file_ext3 || ')$', 'i')
            then
               fh2.script_put_line(fh,
                  '@dbi.sql "' || fh2.sf_aa(g_build_type)(buff.element_seq)(file_id).schema_name ||
                           '/' || fh2.sf_aa(g_build_type)(buff.element_seq)(file_id).filename    ||
                         '" "' || fh2.sf_aa(g_build_type)(buff.element_seq)(file_id).schema_name ||
                         '" "&INSTALL_SYSTEM_CONNECT."'                                          );
            end if;
            exit when file_id = fh2.sf_aa(g_build_type)(buff.element_seq).LAST;
            file_id := fh2.sf_aa(g_build_type)(buff.element_seq).NEXT(file_id);
         end loop;
         fh2.script_put_line(fh, '');
      end if;
   end loop;
   fh2.script_put_line(fh, '----------------------------------------');
   fh2.script_put_line(fh, '-- Finalize Installation (Includes SPOOL OFF)');
   fh2.script_put_line(fh, '@dbi.sql "./installation_finalize.sql" "" "&INSTALL_SYSTEM_CONNECT."');
   fh2.script_put_line(fh, '');
   fh2.script_put_line(fh, 'spool off');
   fh2.script_put_line(fh, '');
   --
   fh2.script_close(fh);
end grb_install_schemas;

------------------------------------------------------------
-- Create SYS Installation Script
procedure grb_install_sys
is
   fh            fh2.sf_ptr_type;  -- object script file handle
   fname         varchar2(1000) := 'install_sys.sql';
   file_id       pls_integer;
begin
   fh := fh2.script_open(in_filename     => fname
                        ,in_elmnt        => 'INSTALL_SCRIPT'
                        ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
   --
   fh2.script_put_line(fh, '');
   fh2.script_put_line(fh, '--');
   fh2.script_put_line(fh, '--  SYS Installation Script');
   fh2.script_put_line(fh, '--');
   fh2.script_put_line(fh, '--  Must be run as SYS');
   fh2.script_put_line(fh, '--');
   fh2.script_put_line(fh, '');
   fh2.script_put_line(fh, 'spool install_sys.log');
   fh2.script_put_line(fh, '');
   fh2.script_put_line(fh, 'set blockterminator off');
   fh2.script_put_line(fh, 'set sqlblanklines on');
   fh2.script_put_line(fh, '');
   --
   for buff in (select nvl(object_type, element_name)    OBJECT_TYPE
                      ,element_seq, file_ext2, file_ext3
                 from  element_conf
                 where element_seq between -199 and -100
                 order by element_seq)
   loop
      if fh2.sf_aa(g_build_type).EXISTS(buff.element_seq)
      then
         fh2.script_put_line(fh, '----------------------------------------');
         fh2.script_put_line(fh, '-- ' || buff.object_type || ' Install');
         fh2.script_put_line(fh, '');
         file_id := fh2.sf_aa(g_build_type)(buff.element_seq).FIRST;
         loop
            -- RegExp: "([.]ctl|[.]csv)$" Any string ending with ".ctl" or ".csv"
            if not regexp_like(fh2.sf_aa(g_build_type)(buff.element_seq)(file_id).filename
                              , '([.]' || buff.file_ext2 ||
                                '|[.]' || buff.file_ext3 || ')$', 'i')
            then
               fh2.script_put_line(fh,
                  '@dbi.sql "' || fh2.sf_aa(g_build_type)(buff.element_seq)(file_id).schema_name ||
                           '/' || fh2.sf_aa(g_build_type)(buff.element_seq)(file_id).filename    ||
                           '" "" ""'                                                             );
            end if;
            exit when file_id = fh2.sf_aa(g_build_type)(buff.element_seq).LAST;
            file_id := fh2.sf_aa(g_build_type)(buff.element_seq).NEXT(file_id);
         end loop;
         fh2.script_put_line(fh, '');
      end if;
   end loop;
   --
   fh2.script_put_line(fh, '----------------------------------------');
   fh2.script_put_line(fh, 'set sqlblanklines off');
   fh2.script_put_line(fh, 'set blockterminator on');
   fh2.script_put_line(fh, '');
   fh2.script_put_line(fh, 'spool off');
   fh2.script_put_line(fh, '');
   --
   fh2.script_close(fh);
end grb_install_sys;

------------------------------------------------------------
-- Create SYSTEM Installation Script
procedure grb_install_system
is
   fh            fh2.sf_ptr_type;  -- object script file handle
   fname         varchar2(1000) := 'install_system.sql';
   file_id       pls_integer;
begin
   fh := fh2.script_open(in_filename     => fname
                        ,in_elmnt        => 'INSTALL_SCRIPT'
                        ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
   --
   fh2.script_put_line(fh, '');
   fh2.script_put_line(fh, '--');
   fh2.script_put_line(fh, '--  SYSTEM Installation Script');
   fh2.script_put_line(fh, '--');
   fh2.script_put_line(fh, '--  Must be run as SYSTEM');
   fh2.script_put_line(fh, '--');
   fh2.script_put_line(fh, '');
   fh2.script_put_line(fh, 'spool install_system.log');
   fh2.script_put_line(fh, '');
   fh2.script_put_line(fh, 'set blockterminator off');
   fh2.script_put_line(fh, 'set sqlblanklines on');
   fh2.script_put_line(fh, '');
   --
   for buff in (select nvl(object_type, element_name)    OBJECT_TYPE
                      ,element_seq, file_ext2, file_ext3
                 from  element_conf
                 where element_seq between -99 and 0
                 order by element_seq)
   loop
      if fh2.sf_aa(g_build_type).EXISTS(buff.element_seq)
      then
         fh2.script_put_line(fh, '----------------------------------------');
         fh2.script_put_line(fh, '-- ' || buff.object_type || ' Install');
         fh2.script_put_line(fh, '');
         file_id := fh2.sf_aa(g_build_type)(buff.element_seq).FIRST;
         loop
            -- RegExp: "([.]ctl|[.]csv)$" Any string ending with ".ctl" or ".csv"
            if not regexp_like(fh2.sf_aa(g_build_type)(buff.element_seq)(file_id).filename
                              , '([.]' || buff.file_ext2 ||
                                '|[.]' || buff.file_ext3 || ')$', 'i')
            then
               fh2.script_put_line(fh,
                  '@dbi.sql "' || fh2.sf_aa(g_build_type)(buff.element_seq)(file_id).schema_name ||
                           '/' || fh2.sf_aa(g_build_type)(buff.element_seq)(file_id).filename    ||
                           '" "" ""'                                                             );
            end if;
            exit when file_id = fh2.sf_aa(g_build_type)(buff.element_seq).LAST;
            file_id := fh2.sf_aa(g_build_type)(buff.element_seq).NEXT(file_id);
         end loop;
         fh2.script_put_line(fh, '');
      end if;
   end loop;
   --
   fh2.script_put_line(fh, '----------------------------------------');
   fh2.script_put_line(fh, 'set sqlblanklines off');
   fh2.script_put_line(fh, 'set blockterminator on');
   fh2.script_put_line(fh, '');
   fh2.script_put_line(fh, 'spool off');
   fh2.script_put_line(fh, '');
   --
   fh2.script_close(fh);
end grb_install_system;

------------------------------------------------------------
-- Create Materialized View Scripts
procedure grb_materialized_views
is
   PELMNT     varchar2(100) := '';
   ELMNT      varchar2(100) := 'MVIEW';
   fh         fh2.sf_ptr_type;  -- object script file handle
begin
   for buf1 in (with qmain as (
                select object_name                  MVIEW_NAME
                      ,replace(replace(object_name,'$','_'),'%','_') || '.' || file_ext1
                                                    FILE_NAME
                      ,build_timing
                 from  obj_install_object_tab
                 where build_type    = g_build_type
                  and  object_owner  = g_schema_name
                  and  element_name   = ELMNT
                 order by object_name
                ), qdep as (  -- Dependencies
                select object_name
                      ,referenced_name
                 from  dba_dependencies_tab
                 where object_owner     = g_schema_name
                  and  object_type      = 'MATERIALIZED VIEW'
                  and  referenced_owner = g_schema_name
                  and  referenced_type  = 'MATERIALIZED VIEW'
                  and  dependency_type  = 'REF'
                ), qroot as (  -- Root nodes have no dependencies
                select 0           LVL
                      ,obj.object_name
                 from  dba_objects_tab  obj
                 where obj.object_owner = g_schema_name
                  and  obj.object_type  = 'MATERIALIZED VIEW'
                  and  obj.object_name not in (select qdep.object_name from qdep)
                ), qlvl as (   -- Levels for all nodes
                select level                 LVL
                      ,qdep.object_name      OBJECT_NAME
                 from  qdep
                 connect by prior qdep.referenced_name = qdep.object_name
                 start with qdep.referenced_name in (select qroot.object_name from qroot)
                ), q_all as (  -- Combine root/dependent nodes
                select lvl, object_name from qroot
                union all
                select max(lvl) lvl, object_name from qlvl
                 group by object_name
                )  -- Main query
                select qmain.mview_name
                      ,ltrim(to_char(nvl(q_all.lvl,-1)+1,'09')) || '_' || qmain.file_name
                                                   FILE_NAME
                      ,qmain.build_timing
                 from  qmain
                  left join q_all
                       on (q_all.object_name = qmain.mview_name)
                order by 1, 2)
   loop
      fh := fh2.script_open(in_filename     => buf1.file_name
                           ,in_elmnt        => ELMNT
                           ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--');
      fh2.script_put_line(fh, '--  Create ' || g_schema_name || '.' || buf1.mview_name || ' Materialized View');
      fh2.script_put_line(fh, '--');
      if buf1.build_timing != 'CURRENT'
      then
         fh2.script_put_line(fh, '');
         fh2.script_put_line(fh, '-- NOTE: This is a "' || buf1.build_timing || '" Materialized View');
      end if;
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, 'set define off');
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--DBMS_METADATA:' || g_schema_name ||
                                             '.' || buf1.mview_name);
      fh2.put_big_line(fh, g_schema_name || '.' || buf1.mview_name || ' Materialized View'
                      ,COMMON_UTIL.split_sql_length
                         (COMMON_UTIL.escape_at_sign
                            (dbms_metadata.get_ddl
                               (object_type => 'MATERIALIZED_VIEW'
                               ,name        => buf1.mview_name
                               ,schema      => g_schema_name) ) )
                      ,common_util.MAXIMUM_SQL_LENGTH);
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--  Comments');
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--DBMS_METADATA:' || g_schema_name ||
                                             '.' || buf1.mview_name);
      BEGIN
         fh2.put_big_line(fh, g_schema_name || '.' || buf1.mview_name || ' Materialized View'
                         ,dbms_metadata.get_dependent_ddl(object_type        => 'COMMENT'
                                                         ,base_object_name   => buf1.mview_name
                                                         ,base_object_schema => g_schema_name)
                         ,common_util.MAXIMUM_SQL_LENGTH);
      EXCEPTION
         WHEN DBMS_METADATA.object_not_found2
         THEN
            null;
      END;
      fh2.script_put_line(fh, '');
      -- Materialized Views are listed as Tables in DBA_TAB_PRIVS
      grb_object_grants(fh, buf1.mview_name, 'TABLE');
      grb_object_synonyms(fh, buf1.mview_name, 'MATERIALIZED VIEW', common_util.MAXIMUM_SQL_LENGTH);
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, 'set define on');
      fh2.script_close(fh);
   end loop;
end grb_materialized_views;

------------------------------------------------------------
-- Create PL/SQL Java Source
procedure grb_plsql_java
is
   SQL_TXT   constant varchar2(1000) := 'begin GRAB_JAVA.GRB_PJAVA; end;';
begin
   if NOT installed_types_aa.EXISTS('grbjava') then return; end if;
   execute immediate SQL_TXT;
exception when others then
   if NOT regexp_like (SQLERRM, 'PLS-00201: identifier ''GRAB_JAVA.GRB_PJAVA'' must be declared')
   then
      raise_application_error(-20000, 'Execute Immediate ERROR' || CHR(10) ||
                                       SQL_TXT                  || CHR(10) ||
                                       SQLERRM                  || CHR(10) ||
                                       dbms_utility.format_error_backtrace );
   end if;
end grb_plsql_java;

------------------------------------------------------------
-- Create Roles and SYS Grants
procedure grb_roles
is
   ELMNT     CONSTANT varchar2(100) := 'ROLE';
   fh        fh2.sf_ptr_type;  -- object script file handle
   sql_txt   varchar2(32767);
begin
   for buf1 in
      (select user_or_role                 ROLENAME
             ,replace(replace(user_or_role,'$','_'),'%','_') || '.' || file_ext1
                                           FILE_NAME
        from  uor_install_view
        where uor_type = 'ROLE'
         and  build_type    = g_build_type
         and  oracle_provided = 'N'
        order by user_or_role)
   loop
      fh := fh2.script_open(in_filename     => buf1.file_name
                           ,in_elmnt        => ELMNT
                           ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
      dbms_output.put_line('buf1.file_name = ' || buf1.file_name);
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--');
      fh2.script_put_line(fh, '--  Create ' || buf1.rolename || ' Role');
      fh2.script_put_line(fh, '--');
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, 'set define off');
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, 'create role ' || buf1.rolename || ';');
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--  Current Grant of YS Objects (but not directories)');
      fh2.script_put_line(fh, '');
      for buf2 in (select object_owner              OWNER
                         ,object_name               TABLE_NAME
                         ,privilege
                         ,max(grantable)            GRANTABLE
                    from  priv_sysobj_privileges_view
                    where grantee      = buf1.rolename
                     and  build_type   = g_build_type
                     and  build_timing = 'CURRENT'
                     and  object_type != 'DIRECTORY' -- All directories are owned by SYS
                          -- Keep LCR$ Logical Change Record
                          -- Keep AQ$ Queue Tables and Views
                          -- SYS_PLSQL Pipelined Type Objects are recreated automatically
                     and  object_name not like common_util.SYS_PIPELINE_PATTERN escape '\'
                          -- Skip QT*_BUFFER Queue Views here. Grant Views with Advanced Queue
                          --   https://blogs.oracle.com/db/entry/oracle_support_master_note_for_troubleshooting_advanced_queuing_and_oracle_streams_propagation_issue
                          --   "Note that when queue table is created, a view called QT<nnn>_BUFFER is created in the SYS schema, and the queue table owner is given
                          --    SELECT privileges on it. The <nnn> corresponds to the object_id of the associated queue table"
                     and  object_name not like common_util.ADV_QUEUE_VIEW_PATTERN escape '\'
                    group by object_owner
                         ,object_name
                         ,grantee
                         ,privilege
                    order by object_owner
                         ,object_name
                         ,grantee
                         ,privilege)
      loop
         -- No appropriate DBMS_METADATA.  Manually create the SQL.
         sql_txt := 'grant ' || buf2.privilege ||
                     ' on "' || buf2.owner || '"."' || buf2.table_name || '"' ||
                     ' to "' || buf1.rolename || '"';
         -- Missing "with hierarchy option" ...
         -- Does not work for ROLES ...
         --if buf2.grantable = 'YES'
         --then
         --   sql_txt := sql_txt || ' with grant option';
         --end if;
         fh2.put_big_line(fh, buf2.owner || '.' || buf2.table_name ||
                         ' Grant', sql_txt || ';'
                         ,common_util.MAXIMUM_SQL_LENGTH);
      END LOOP;
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, 'set define on');
      fh2.script_close(fh);
   end loop;
end grb_roles;

------------------------------------------------------------
-- Create Table Scripts
procedure grb_tables
is
   PELMNT     varchar2(100) := '';
   ELMNT      varchar2(100) := 'TABLE';
   fh         fh2.sf_ptr_type;  -- object script file handle
begin
   for buf1 in (select obj.object_name                      TABLE_NAME
                      ,replace(replace(obj.object_name,'$','_'),'%','_') || '.' || obj.file_ext1
                                                            FILE_NAME
                      ,obj.build_timing
                      ,xt.table_name                        XML_TABLE_NAME
                 from  obj_install_object_tab  obj
                  left join dba_xml_tables  xt
                            on  xt.owner      = obj.object_owner
                            and xt.table_name = obj.object_name
                 where obj.build_type    = g_build_type
                  and  obj.object_owner  = g_schema_name
                  and  obj.element_name   = ELMNT
                       -- Skip Oracle Text Supplemental Tables
                  and  NOT regexp_like(obj.object_name, common_util.ORACLE_TEXT_TABLE_REGEXP)
                       -- Skip Spatial Data Object Supplemental Tables
                  and  NOT regexp_like(obj.object_name, common_util.SDO_TABLE_REGEXP)
                       -- Skip Indexed Organized Overflow Tables
                       -- Skip Indexed Organized Mapping Tables
                  and  not exists (select 'x' from dba_tables tab
                                    where tab.owner      = g_schema_name
                                     and  tab.table_name = obj.object_name
                                     and  tab.iot_type  in ('IOT_OVERFLOW','IOT_MAPPING') )
                       -- Skip Materialized View Tables (not the view itself)
                  and  not exists (select 'x' from dba_mviews mv
                                    where mv.owner      = g_schema_name
                                     and  mv.mview_name = obj.object_name)
                       -- Skip Queue Tables, create with Advanced Queues
                  and  not exists (select 'x' from dba_queue_tables qt
                                    where qt.owner = g_schema_name
                                     and  (   obj.object_name = qt.queue_table
                                           or regexp_like(obj.object_name,common_util.ADV_QUEUE_PREFIX_REGEXP ||
                                                                          qt.queue_table                      ||
                                                                          common_util.ADV_QUEUE_SUFFIX_REGEXP  )  )  )
       order by obj.object_name )
   loop
      fh := fh2.script_open(in_filename     => buf1.file_name
                           ,in_elmnt        => ELMNT
                           ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--');
      fh2.script_put_line(fh, '--  Create ' || g_schema_name || '.' || buf1.table_name || ' Table');
      fh2.script_put_line(fh, '--');
      if buf1.build_timing != 'CURRENT'
      then
         fh2.script_put_line(fh, '');
         fh2.script_put_line(fh, '-- NOTE: This is a "' || buf1.build_timing || '" Table');
      end if;
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, 'set define off');
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '');
--      if buf1.table_type = 'XMLTABLE'
--      then
--         --  DBMS_METADATA incorrectly creates XMLTables with the
--         --  "ALLOW NONSCHEMA DISALLOW ANYSCHEMA" clause, but without the
--         --  "XMLTYPE STORE AS BINARY XML" clause, resulting in an ORA-00922
--         fh2.script_put_line(fh, 'CREATE TABLE "' || g_schema_name   ||
--                                            '"."' || buf1.table_name || '" OF XMLTYPE;');
--      else
        fh2.script_put_line(fh, '--DBMS_METADATA:' || g_schema_name   ||
                                               '.' || buf1.table_name );
         fh2.put_big_line(fh, g_schema_name || '.' || buf1.table_name || ' Table'
                         ,dbms_metadata.get_ddl(object_type => 'TABLE'
                                               ,name        => buf1.table_name
                                               ,schema      => g_schema_name)
                         ,common_util.MAXIMUM_SQL_LENGTH);
--      end if;
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--  Comments');
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--DBMS_METADATA:' || g_schema_name ||
                                             '.' || buf1.table_name);
      BEGIN
         fh2.put_big_line(fh, g_schema_name || '.' || buf1.table_name || ' Table'
                         ,dbms_metadata.get_dependent_ddl(object_type        => 'COMMENT'
                                                         ,base_object_name   => buf1.table_name
                                                         ,base_object_schema => g_schema_name)
                         ,common_util.MAXIMUM_SQL_LENGTH);
      EXCEPTION
         WHEN DBMS_METADATA.object_not_found2
         THEN
            null;
      END;
      fh2.script_put_line(fh, '');
      grb_object_grants(fh, buf1.table_name, 'TABLE');
      grb_object_synonyms(fh, buf1.table_name, 'TABLE', common_util.MAXIMUM_SQL_LENGTH);
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, 'set define on');
      fh2.script_close(fh);
   end loop;
end grb_tables;

------------------------------------------------------------
-- Create Trigger Scripts
procedure grb_triggers
      (in_elmnt   in varchar2)
is
   fh         fh2.sf_ptr_type;  -- object script file handle
   old_own    varchar2(1000);
   old_tab    varchar2(1000);
   fname      varchar2(1000);
begin
   old_own := 'This is not an Owner Name.';
   old_tab := 'This is not a Table name.';
   for buff in (select target_name                 TABLE_NAME
                      ,target_owner                TABLE_OWNER
                      ,replace(replace(target_name,'$','_'),'%','_') || '.' || file_ext1
                                                   FILE_NAME
                      ,target_type
                      ,trigger_name
                      ,build_type_selector
                 from  obj_install_trigger_tab
                 where trigger_owner = g_schema_name
                  and  element_name   = in_elmnt
                  and  build_type    = g_build_type
                 order by target_owner
                      ,target_name
                      ,trigger_name  )
   loop
      if    buff.table_owner != old_own
         or buff.table_name  != old_tab
      then
         if fh2.script_is_open(fh)
         then
            fh2.script_put_line(fh, '');
            fh2.script_put_line(fh, 'set define on');
            fh2.script_close(fh);
         end if;
         old_own := buff.table_owner;
         old_tab := buff.table_name;
         if buff.table_owner = g_schema_name
         then
            fname := buff.file_name;
         else
            fname := buff.table_owner || '.' || buff.file_name;
         end if;
         fh := fh2.script_open(in_filename     => fname    -- buff.file_name
                              ,in_elmnt        => in_elmnt
                              ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
         fh2.script_put_line(fh, '');
         fh2.script_put_line(fh, '--');
         fh2.script_put_line(fh, '--  Create Triggers for ' || buff.table_owner ||
                                                        '.' || buff.table_name  ||
                                                        ' ' || buff.target_type );
         fh2.script_put_line(fh, '--');
         fh2.script_put_line(fh, '');
         fh2.script_put_line(fh, 'set define off');
         fh2.script_put_line(fh, '');
      end if;
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--  NOTE: This is a "' || buff.build_type_selector || '" Trigger');
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--DBMS_METADATA:' || g_schema_name      ||
                                             '.' || buff.trigger_name  );
      fh2.put_big_line(fh, g_schema_name || '.' || buff.trigger_name || ' Trigger'
                      ,COMMON_UTIL.escape_at_sign
                         (dbms_metadata.get_ddl
                            (object_type => 'TRIGGER'
                            ,name        => buff.trigger_name
                            ,schema      => g_schema_name) )
                      ,common_util.MAXIMUM_SQL_LENGTH);
   end loop;
   if fh2.script_is_open(fh)
   then
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, 'set define on');
      fh2.script_close(fh);
   end if;
end grb_triggers;

------------------------------------------------------------
-- Create Users and SYS Grants
procedure grb_users
is
   ELMNT     CONSTANT varchar2(100) := 'USER';
   fh        fh2.sf_ptr_type;  -- object script file handle
   sql_txt   varchar2(32767);
begin
   for buf1 in (select sc.username
                      ,replace(replace(sc.username,'$','_'),'%','_') || '.' || ec.file_ext1
                                                      FILE_NAME
                      ,sc.profile
                      ,sc.temporary_tspace
                      ,sc.default_tspace
                      ,sc.ts_quota
                 from  schema_conf  sc
                       join element_conf  ec
                            on  ec.element_name = ELMNT
                 where sc.build_type      = g_build_type
                  and  sc.oracle_provided = 'N'
                 order by sc.username)
   loop
      fh := fh2.script_open(in_filename     => buf1.file_name
                           ,in_elmnt        => ELMNT
                           ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--');
      fh2.script_put_line(fh, '--  Create ' || buf1.username || ' Schema');
      fh2.script_put_line(fh, '--');
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, 'set define off');
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, 'create user "' || buf1.username || '"');
      fh2.script_put_line(fh, '   no authentication');
      fh2.script_put_line(fh, '   profile ' || nvl(buf1.profile, 'DEFAULT'));
      fh2.script_put_line(fh, '   temporary tablespace ' || nvl(buf1.temporary_tspace, 'TEMP'));
      if buf1.default_tspace is not null
      then
         fh2.script_put_line(fh, '   default tablespace ' || buf1.default_tspace);
         fh2.script_put_line(fh, '   quota ' || nvl(buf1.ts_quota, 'UNLIMITED') ||
                                      ' on ' || buf1.default_tspace);
         for buf2 in (select tspace_name, ts_quota
                       from  tspace_conf
                       where username = buf1.username)
         loop
            fh2.script_put_line(fh, '   quota ' || nvl(buf2.ts_quota, 'UNLIMITED') ||
                                         ' on ' || buf2.tspace_name);
         end loop;
         fh2.script_put_line(fh, '   ;');
      else
         fh2.script_put_line(fh, '   ;');
      end if;
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--  Current Grant of SYS Objects (but not directories)');
      fh2.script_put_line(fh, '');
      for buf2 in (select object_owner
                         ,object_name
                         ,object_type
                         ,privilege
                         ,max(grantable)            GRANTABLE
                    from  priv_sysobj_privileges_view
                    where grantee      = buf1.username
                     and  build_type   = g_build_type
                     and  build_timing = 'CURRENT'
                     and  object_type != 'DIRECTORY' -- All directories are owned by SYS
                          -- Keep LCR$ Logical Change Record
                          -- Keep AQ$ Queue Tables and Views
                          -- SYS_PLSQL Pipelined Type Objects are recreated automatically
                     and  object_name not like common_util.SYS_PIPELINE_PATTERN escape '\'
                          -- Skip QT*_BUFFER Queue Views here. Grant Views with Advanced Queue
                          --   https://blogs.oracle.com/db/entry/oracle_support_master_note_for_troubleshooting_advanced_queuing_and_oracle_streams_propagation_issue
                          --   "Note that when queue table is created, a view called QT<nnn>_BUFFER is created in the SYS schema, and the queue table owner is given
                          --    SELECT privileges on it. The <nnn> corresponds to the object_id of the associated queue table"
                     and  object_name not like common_util.ADV_QUEUE_VIEW_PATTERN escape '\'
                    group by object_owner
                         ,object_name
                         ,object_type
                         ,privilege
                    order by object_owner
                         ,object_name
                         ,object_type
                         ,privilege)
      loop
         -- No appropriate DBMS_METADATA.  Manually create the SQL.
         --
         --  These "types" don't require a grant quailifier:
         --    -) FUNCTION
         --    -) INDEXTYPE
         --    -) LIBRARY
         --    -) MATERIALIZED VIEW
         --    -) OPERATOR
         --    -) PACKAGE
         --    -) PROCEDURE
         --    -) SEQUENCE
         --    -) TABLE
         --    -) TYPE
         --    -) VIEW
         --
         --  Other forms (and "types") include:
         --    -) ON DIRECTORY (DIRECTORY)         - Handled in "grb_directories"
         --    -) ON USER (USER)                   - Handled HERE and in "grb_object_grants"
         --    -) ON EDITION (EDITION)             - Handled HERE and in "grb_object_grants"
         --    -) ON JAVA SOURCE (JAVA CLASS)      - Handled HERE and in "grb_object_grants" and "grb_plsql_java"
         --    -) ON JAVA RESOURCE (JAVA RESOURCE) - Handled HERE and in "grb_object_grants"
         --    -) ON MINING MODEL (MLE LANGUAGE?)  - Not Handled
         --    -) ON SQL TRANSLATION PROFILE (???) - Not Handled
         --
         sql_txt := 'grant ' || buf2.privilege ||
                      ' on ' || case buf2.object_type when 'JAVA CLASS'    then 'JAVA SOURCE "'   || buf2.object_owner || '"."'
                                                      when 'JAVA SOURCE'   then 'JAVA SOURCE "'   || buf2.object_owner || '"."'
                                                      when 'JAVA RESOURCE' then 'JAVA RESOURCE "' || buf2.object_owner || '"."'
                                                      when 'EDITION'       then 'EDITION "'
                                                      when 'USER'          then 'USER "'
                                                                           else '"'               || buf2.object_owner || '"."'
                                end                                                               || buf2.object_name  ||
                    '" to "' || buf1.username || '"';
         -- Missing "with hierarchy option"...
         if buf2.grantable = 'YES'
         then
            sql_txt := sql_txt || ' with grant option';
         end if;
         fh2.put_big_line(fh, buf2.object_owner || '"."' || buf2.object_name ||
                         ' Grant', sql_txt || ';'
                         ,common_util.MAXIMUM_SQL_LENGTH);
      END LOOP;
      --
      if installed_types_aa.EXISTS('grbjava')
      then
         sql_txt := 'begin GRAB_JAVA.GRB_SYSGRNT(:1, ''' || buf1.username  ||
                                               ''', ''' || buf1.file_name ||
                                               ''', ''' || ELMNT          ||
                                               ''', ''CURRENT''); end;';
         begin
            execute immediate sql_txt using in out fh;
         exception when others then
            if NOT regexp_like (SQLERRM, 'PLS-00201: identifier ''GRAB_JAVA.GRB_SYSGRNT'' must be declared')
            then
               raise_application_error(-20000, 'Execute Immediate ERROR' || CHR(10) ||
                                                SQL_TXT                  || CHR(10) ||
                                                SQLERRM                  || CHR(10) ||
                                                dbms_utility.format_error_backtrace );
            end if;
         end;
      end if;
      --
      if installed_types_aa.EXISTS('grbras')
      then
         sql_txt := 'begin GRAB_RAS.GRB_USR(:1, ''' || buf1.username || '''); end;';
         begin
            execute immediate sql_txt using in out fh;
         exception when others then
            if NOT regexp_like (SQLERRM, 'PLS-00201: identifier ''GRAB_RAS.GRB_USR'' must be declared')
            then
               raise_application_error(-20000, 'Execute Immediate ERROR' || CHR(10) ||
                                                SQL_TXT                  || CHR(10) ||
                                                SQLERRM                  || CHR(10) ||
                                                dbms_utility.format_error_backtrace );
            end if;
         end;
      end if;
      --
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, 'set define on');
      fh2.script_close(fh);
   end loop;
end grb_users;

------------------------------------------------------------
-- Create Schema Trigger
--   There are no PUBLIC Schema Triggers
--   https://docs.oracle.com/en/database/oracle/oracle-database/21/lnpls/CREATE-TRIGGER-statement.html
procedure grb_user_triggers
is
   ELMNT      CONSTANT varchar2(100) := 'SCHEMA_TRIGGER';
   fh         fh2.sf_ptr_type;  -- object script file handle
begin
   for buff in (select object_name              TRIGGER_NAME
                      ,file_ext1
                      ,build_timing
                 from  obj_install_object_tab
                 where build_type    = g_build_type
                  and  object_owner  = g_schema_name
                  and  element_name   = ELMNT
                 order by trigger_name
                      ,file_ext1
                      ,build_timing)
   loop
      if NOT fh2.script_is_open(fh)
      then
         fh := fh2.script_open(in_filename     => replace(replace(g_schema_name,'$','_'),'%','_') || '.' || buff.file_ext1
                              ,in_elmnt        => ELMNT
                              ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
         fh2.script_put_line(fh, '');
         fh2.script_put_line(fh, '--');
         fh2.script_put_line(fh, '--  Create Schema Triggers for ' || g_build_type);
         fh2.script_put_line(fh, '--');
         fh2.script_put_line(fh, '');
         fh2.script_put_line(fh, 'set define off');
         fh2.script_put_line(fh, '');
      end if;
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--  NOTE: This is a "' || buff.build_timing || '" Trigger');
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--DBMS_METADATA:' || g_schema_name      ||
                                             '.' || buff.trigger_name  );
      fh2.put_big_line(fh, g_schema_name || '.' || buff.trigger_name || ' Trigger'
                      ,COMMON_UTIL.escape_at_sign
                         (dbms_metadata.get_ddl
                            (object_type => 'TRIGGER'
                            ,name        => buff.trigger_name
                            ,schema      => g_schema_name) )
                      ,common_util.MAXIMUM_SQL_LENGTH);
   end loop;
   if fh2.script_is_open(fh)
   then
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, 'set define on');
      fh2.script_close(fh);
   end if;
end grb_user_triggers;


------------------------------------------------------------
-- Create View Scripts
procedure grb_views
is
   PELMNT     varchar2(100) := '';
   ELMNT      varchar2(100) := 'VIEW';
   fh         fh2.sf_ptr_type;  -- object script file handle
begin
   for buf1 in (select obj.object_name                      VIEW_NAME
                      ,replace(replace(obj.object_name,'$','_'),'%','_') || '.' || obj.file_ext1
                                                            FILE_NAME
                      ,obj.build_timing
                 from  obj_install_object_tab  obj
                  left join dba_xml_tables  xt
                            on  xt.owner      = obj.object_owner
                            and xt.table_name = obj.object_name
                 where obj.build_type    = g_build_type
                  and  obj.object_owner  = g_schema_name
                  and  obj.element_name   = ELMNT
                       -- Skip Queue Table Views, create with Advanced Queue
                  and  not exists (select 'x' from dba_queue_tables qt
                                    where qt.owner = g_schema_name
                                     and  (   obj.object_name = qt.queue_table
                                           or regexp_like(obj.object_name,common_util.ADV_QUEUE_PREFIX_REGEXP ||
                                                                          qt.queue_table                      ||
                                                                          common_util.ADV_QUEUE_SUFFIX_REGEXP  )  )  )
       order by obj.object_name )
   loop
      fh := fh2.script_open(in_filename     => buf1.file_name
                           ,in_elmnt        => ELMNT
                           ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--');
      fh2.script_put_line(fh, '--  Create ' || g_schema_name || '.' || buf1.view_name || ' view');
      fh2.script_put_line(fh, '--');
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, 'set define off');
      fh2.script_put_line(fh, '');
      if buf1.build_timing != 'CURRENT'
      then
         fh2.script_put_line(fh, '');
         fh2.script_put_line(fh, '-- Note: This is a "' || buf1.build_timing || '" View');
      end if;
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--');
      fh2.script_put_line(fh, '--  Cannot grant permisions on a view with an error');
      fh2.script_put_line(fh, '--  https://asktom.oracle.com/pls/apex/f?p=100:11:0::::P11_QUESTION_ID:43253832697675#2653213300346351987');
      fh2.script_put_line(fh, 'create view "' || g_schema_name || '"."' || buf1.view_name || '"');
      fh2.script_put_line(fh, '  as   select * from TEMP_PUBLICLY_UPDATEABLE_TABLE;');
      grb_object_grants(fh, buf1.view_name, 'VIEW');
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--DBMS_METADATA:' || g_schema_name ||
                                               '.' || buf1.view_name);
      fh2.put_big_line(fh, g_schema_name || '.' || buf1.view_name || ' View'
                      ,COMMON_UTIL.split_sql_length
                         (COMMON_UTIL.escape_at_sign
                            (dbms_metadata.get_ddl
                               (object_type => 'VIEW'
                               ,name        => buf1.view_name
                               ,schema      => g_schema_name) ) )
                      ,common_util.MAXIMUM_SQL_LENGTH);
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--  Comments');
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, '--DBMS_METADATA:' || g_schema_name ||
                                           '.' || buf1.view_name);
      BEGIN
         fh2.put_big_line(fh, g_schema_name || '.' || buf1.view_name || ' View'
                         ,dbms_metadata.get_dependent_ddl(object_type        => 'COMMENT'
                                                         ,base_object_name   => buf1.view_name
                                                         ,base_object_schema => g_schema_name)
                         ,common_util.MAXIMUM_SQL_LENGTH);
      EXCEPTION
         WHEN DBMS_METADATA.object_not_found2
         THEN
            null;
      END;
      fh2.script_put_line(fh, '');
      grb_object_grants(fh, buf1.view_name, 'VIEW');
      grb_object_synonyms(fh, buf1.view_name, 'VIEW', common_util.MAXIMUM_SQL_LENGTH);
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, 'set define on');
      fh2.script_close(fh);
   end loop;
end grb_views;


------------------------------------------------------------
---   Setup and Main Control  ---
------------------------------------------------------------


------------------------------------------------------------
-- Set Installed Types
procedure set_installed_types
is
   -- ORA-00942: table or view does not exist
   table_does_not_exist  EXCEPTION;
   PRAGMA EXCEPTION_INIT(table_does_not_exist, -942);
   TYPE rcurs_type is ref cursor;
   rcurs     rcurs_type;
   btype     build_conf.build_type%TYPE;
begin
   -- Load INSTALLED_TYPES Array
   installed_types_aa.DELETE;
   open rcurs for 'select distinct build_type from odbcapture_installation_logs';
   loop
      fetch rcurs into btype;
      exit when rcurs%NOTFOUND;
      installed_types_aa(btype) := 'Y';
   end loop;
   if NOT installed_types_aa.EXISTS('grbsrc')
   then
      raise_application_error(-20000, 'Unable to find "grbsrc" in odbcapture_installation_log');
   end if;
   dbms_output.put_line($$PLSQL_UNIT || '.set_installed_types: ' || installed_types_aa.COUNT || ' Build Types in ODBCAPTURE_INSTALLATION_LOG');
exception when table_does_not_exist then
   null;
end set_installed_types;


------------------------------------------------------------
-- Initialize this Package
procedure initialize
      (in_build_type  in varchar2)
is
   -- Set the Installation Type
   procedure set_build_type
   is
      l_notes   build_conf.notes%type;
   begin
      if in_build_type in ('sys','pub')
      then
         raise_application_error (-20000, 'Build Type of "sys" or "pub" is not allowed: ' || in_build_type);
      end if;
      begin
         select notes
          into  l_notes
          from  BUILD_CONF
          where build_type = in_build_type;
      exception when NO_DATA_FOUND then
         raise_application_error (-20000, 'Invalid Build Type: ' || in_build_type);
      end;
      g_build_type  := in_build_type;
      dbms_output.put_line('g_build_type = ' || g_build_type || ', ' || l_notes);
   end set_build_type;
   --
begin
   -- Reset
   fh2.script_close_all;
   g_build_type   := null;
   g_schema_name    := null;
   -- Set Globals
   set_build_type;
   if fh2.sf_aa.EXISTS(g_build_type) then fh2.sf_aa(g_build_type).DELETE; end if;
   --  Checks and Settings
   COMMON_UTIL.check_windows_filenames(g_build_type);
   COMMON_UTIL.dbms_metadata_settings;
end initialize;


------------------------------------------------------------
-- Set the Schema Name
procedure set_schema_name
      (in_schema_name  in varchar2)
is
begin
   g_schema_name := in_schema_name;
   dbms_output.put_line('g_schema_name = ' || g_schema_name);
end set_schema_name;


------------------------------------------------------------
-- Generate SYS/SYSTEM Installation Scripts
procedure gen_installs
is
begin
   ------------------------------------------------------------
   set_schema_name('SYS');
   grb_future_sys_grants;     -- "FUTURE" SYS Object Grants
   grb_database_triggers;
   grb_host_acls;
   grb_wallet_acls;
   grb_roles;
   grb_users;
   ------------------------------------------------------------
   set_schema_name('SYSTEM');
   grb_future_grants;       -- Includes "FUTURE" Grants
   grb_directories;
   grb_user_triggers;
   ------------------------------------------------------------
   set_schema_name('PUBLIC');
   grb_future_synonyms;
   grb_database_links;
   ------------------------------------------------------------
   set_schema_name('');
   grb_install_master;
   grb_install_sys;
   grb_install_system;
end gen_installs;


------------------------------------------------------------
-- Generate NON SYS/SYSTEM Installation Scripts
procedure gen_schemas
is
   -- Loop through all scripts
   procedure all_schema_scripts is
   begin
      grb_future_synonyms;
      grb_advanced_queues;
      grb_aq_tables;
      grb_application_context;
      grb_comp_data_loader;
      grb_common('FUNCTION'          ,'Function'    );
      grb_common('PACKAGE_BODY'      ,'Package Body');
      grb_common('PACKAGE_SPEC'      ,'Package'     );
      grb_common('PROCEDURE'         ,'Procedure'   );
      grb_common('SCHEDULER_JOB'     ,'Job'         );
      grb_common('SCHEDULER_PROGRAM' ,'Program'     );
      grb_common('SCHEDULER_SCHEDULE','Schedule'    );
      grb_common('SEQUENCE'          ,'Sequence'    );
      grb_common('TYPE_BODY'         ,'Type Body'   );
      grb_common('TYPE_SPEC'         ,'Type'        );
      grb_database_links;
      grb_foreign_keys('MVIEW_FOREIGN_KEY');
      grb_foreign_keys('TABLE_FOREIGN_KEY');
      grb_foreign_keys('VIEW_FOREIGN_KEY');
      grb_indexes('MVIEW_INDEX');
      grb_indexes('TABLE_INDEX');
      grb_materialized_views;
      grb_plsql_java;
      grb_tables;
      grb_triggers('MVIEW_TRIGGER');
      grb_triggers('TABLE_TRIGGER');
      grb_triggers('VIEW_TRIGGER');
      grb_views;
   end all_schema_scripts;
begin
   for sch in (select obj.object_owner
                from  schema_objects_tab  obj
                      join schema_conf  sl
                          on  sl.username        = obj.object_owner
                          and sl.oracle_provided = 'N'
                where obj.build_type    = g_build_type
                 and  obj.object_owner != 'PUBLIC'
                group by obj.object_owner
                order by obj.object_owner)
   loop
      set_schema_name(sch.object_owner);
      all_schema_scripts;
   end loop;
   set_schema_name('');
   grb_install_schemas;
end gen_schemas;


------------------------------------------------------------
---   PUBLIC API  ---
------------------------------------------------------------


------------------------------------------------------------
-- Generate All Installation Scripts into the sf_aa array
procedure all_scripts
      (in_build_type   in varchar2)
is
begin
   dbms_output.put_line('Running ' || $$PLSQL_UNIT || '.all_scripts'  ||
                              '(in_build_type "' || in_build_type || '")' );
   initialize(in_build_type);
   gen_installs;
   gen_schemas;
   fh2.script_close_all;
end all_scripts;


------------------------------------------------------------
-- Get Version
function get_version
   return varchar2
is
begin
   return 'V2.1';
end get_version;


end grab_scripts;
/

set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/ROOT_SCRIPTS.pkbsql
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.ROOT_SCRIPTS Package Body
--

set define off


--DBMS_METADATA:ODBCAPTURE.ROOT_SCRIPTS

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "ODBCAPTURE"."ROOT_SCRIPTS" 
as

   utl_dir varchar2(50) := '../grb_linked_install_scripts';


function get_schema_list
      (in_build_type  in varchar2)
   return varchar2
is
   schema_list  varchar2(1000);
begin
   for sch in (select obj.object_owner
                from  schema_objects_tab  obj
                where obj.build_type = in_build_type
                 and  obj.object_owner != 'PUBLIC'
                group by obj.object_owner
                order by obj.object_owner)
   loop
      schema_list := schema_list || '''' || sch.object_owner || ''',';
   end loop;
   -- Remove the "comma" at the end of schema_list, if any
   schema_list := regexp_replace(schema_list,',$','');
   return schema_list;
end get_schema_list;


--------------------------------------------------------------------------------
-- Database Script Install Wrapper
function dbi_sql
      (in_build_type  in varchar2)
   return varchar2
is
   ret_txt  varchar2(32767);
begin
   ret_txt := q'{
-- Database Installation Assist
--   Wrapper for Database Installation Scripts
--
--   Parameters
--   1) Script Name
--   2) Schema Name
--   3) System Connect String

prompt === DBI Started: &1.

define DBI_SCRIPT_NAME="&1."
define DBI_SCHEMA_NAME="&2."
define DBI_SYSTEM_CONNECT="&3."

variable dbi_beg_dtm varchar2(40)
variable dbi_beg_secs number

set feedback off
begin
   -- Initialize Timer
   :dbi_beg_dtm  := to_char(systimestamp,'YYYY-MM-DD') || 'T' ||
                    to_char(systimestamp,'HH24:MI:SS');
   :dbi_beg_secs := dbms_utility.get_time;
   -- Set Current Schema
   if length('&DBI_SCHEMA_NAME.') > 0
   then
      execute immediate 'alter session set current_schema = "&DBI_SCHEMA_NAME."';
   end if;
end;
}';
   -- Can't have string declaration with a "/" on a line by itself
   ret_txt := ret_txt || '/' || CHR(10) || q'{
set feedback on
set blockterminator off
set sqlblanklines on

}';
   -- Can't start a line with an "@"
   ret_txt := ret_txt || q'{@"&DBI_SCRIPT_NAME." "&DBI_SYSTEM_CONNECT." "" ""
set serveroutput on size unlimited format wrapped

set sqlblanklines off
set blockterminator on
set feedback off
begin
   -- Reset Current Schema
   if length('&DBI_SCHEMA_NAME.') > 0
   then
      execute immediate 'alter session set current_schema = "' || USER || '"';
   end if;
   -- Show Timer Results
   dbms_output.put_line('=== DBI Completed at ' || to_char(systimestamp,'YYYY-MM-DD') || 'T' ||
                                                   to_char(systimestamp,'HH24:MI:SS') ||
      ' for a duration of '   || trim( (dbms_utility.get_time - :dbi_beg_secs) / 100 ) ||
      ' seconds (started at ' || :dbi_beg_dtm || ')');
end;
}';
   -- Can't have string declaration with a "/" on a line by itself
   ret_txt := ret_txt || '/' || CHR(10) || q'{
set feedback on
}';
   return ret_txt;
end dbi_sql;


--------------------------------------------------------------------------------
-- Installation Finalization Script
function installation_finalize_sql
      (in_build_type  in varchar2)
   return varchar2
is
   ret_txt      varchar2(32767);
begin
   ret_txt := q'{
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
}';
   -- Can't start a line with an "@"
   ret_txt := ret_txt || '@"' || utl_dir ||
                          q'{/fix_invalid_public_synonyms.sql" "" "" ""

prompt
prompt compile_all
}';
   -- Can't start a line with an "@"
   ret_txt := ret_txt || '@"' || utl_dir ||
                         '/compile_all.sql" "' || get_schema_list(in_build_type) ||
                          q'{" "" ""

prompt
prompt alter_foreign_keys_ENABLE
}';
   -- Can't start a line with an "@"
   ret_txt := ret_txt || '@"' || utl_dir ||
                         '/alter_foreign_keys.sql" "ENABLE" "' || get_schema_list(in_build_type) ||
                          q'{" ""

prompt
prompt alter_triggers_ENABLE
}';
   -- Can't start a line with an "@"
   ret_txt := ret_txt || '@"' || utl_dir ||
                         '/alter_triggers.sql" "ENABLE" "' || get_schema_list(in_build_type) ||
                          q'{" ""

prompt
prompt update_id_sequences
}';
   -- Can't start a line with an "@"
   ret_txt := ret_txt || '@"' || utl_dir ||
                         '/update_id_sequences.sql" "' || get_schema_list(in_build_type) ||
                          q'{" "" ""

--prompt
--prompt alter_queues_ENABLE
}';
   -- Can't start a line with an "@"
   ret_txt := ret_txt || '--@"' || utl_dir ||
                         '/alter_queues.sql" "ENABLE" "' || get_schema_list(in_build_type) ||
                          q'{" ""

--prompt
--prompt alter_scheduler_jobs_ENABLE
}';
   -- Can't start a line with an "@"
   ret_txt := ret_txt || '--@"' || utl_dir ||
                         '/alter_scheduler_jobs.sql" "ENABLE" "' || get_schema_list(in_build_type) ||
                          q'{" ""

prompt
prompt Switch Spooling Off

}';
   return ret_txt;
end installation_finalize_sql;


--------------------------------------------------------------------------------
-- Installation Preparation Script
function installation_prepare_sql
      (in_build_type  in varchar2)
   return varchar2
is
   TYPE btype_nt_type is table of build_conf.build_type%TYPE;
   btype_nt    btype_nt_type;
   ret_txt     varchar2(32767);
begin
   ret_txt := q'{
--
--  Prepare for View Install
--

prompt
prompt Create Temp Publicly Updateable Table
create table TEMP_PUBLICLY_UPDATEABLE_TABLE (c1 number);
grant all on TEMP_PUBLICLY_UPDATEABLE_TABLE to PUBLIC with grant option;
create public synonym TEMP_PUBLICLY_UPDATEABLE_TABLE for TEMP_PUBLICLY_UPDATEABLE_TABLE;
}';
   select to_build_type
    bulk collect into btype_nt
    from  build_type_timing
    where from_build_type = in_build_type
     and  build_timing = 'CURRENT'
     and  to_build_type not in (in_build_type, 'sys','pub')
    order by to_build_type;
   if btype_nt.COUNT > 0
   then
      ret_txt := ret_txt || q'{
prompt
prompt Check for Prerequisite BUILD_TYPEs
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
}';
      for i in 1 .. btype_nt.COUNT
      loop
         ret_txt := ret_txt || '   do_it(''' || btype_nt(i) || ''');' || CHR(10);
      end loop;
      ret_txt := ret_txt || 'end;' || CHR(10) || '/' || CHR(10);
   end if;
   return ret_txt;
end installation_prepare_sql;


--------------------------------------------------------------------------------
-- ODBCAPTURE Installation Logs Comprehensive Data Loader
function odbcapture_installation_logs_cldr
      (in_build_type  in varchar2)
   return varchar2
is
   ret_txt  varchar2(32767);
begin
   ret_txt := q'{
--
--  Comprehensive Data Loader script for odbcapture_installation_logs data
--
--  Must be run as SYSTEM
--
--  Command Line Parameters:
--   1 - SYSTEM/password@TNSALIAS
--       i.e. pass the username and password for the SYSTEM user
--            and the TNSALIAS for the connection to the database.
--       The Data Load installation requires this connection information.
--

prompt
prompt Confirm/Create odbcapture_installation_logs Table
declare
   jnk  number := 0;
   procedure run_sql (in_sql in varchar2) is begin
      dbms_output.put_line(in_sql || ';');
      execute immediate in_sql;
   exception when others then
      dbms_output.put_line('-- ' || SQLERRM || CHR(10));
   end run_sql;
begin
   begin
      execute immediate 'insert into odbcapture_installation_logs(load_dtm, build_type, file_name)' ||
                        ' values(sysdate, ''Test'', ''Test'')';
      rollback;
      jnk := 1;
   exception when others then
      if SQLERRM != 'ORA-00942: table or view does not exist'
      then
         dbms_output.put_line('odbcapture_installation_logs table: ' || SQLERRM);
      end if;
      jnk := -1;
   end;
   if jnk = -1
   then
      run_sql('create table odbcapture_installation_logs' || CHR(10) ||
         ' (load_dtm date' || CHR(10) ||
         ' ,build_type varchar2(10)' || CHR(10) ||
         ' ,file_name varchar2(512)' || CHR(10) ||
         ' ,contents clob)');
      run_sql('comment on column odbcapture_installation_logs.load_dtm is ''Date/Time the installation log file was loaded.''');
      run_sql('comment on column odbcapture_installation_logs.build_type is ''Type of Build (from BUILD_CONF).''');
      run_sql('comment on column odbcapture_installation_logs.file_name is ''Name of installation log file.''');
      run_sql('comment on column odbcapture_installation_logs.contents is ''Contents/Text of the installation log file.''');
      run_sql('comment on table odbcapture_installation_logs is ''ODBCAPTURE installation log files.''');
      run_sql('grant select on odbcapture_installation_logs to public');
      run_sql('create public synonym odbcapture_installation_logs for odbcapture_installation_logs');
   end if;
end;
}';
   -- Can't have string declaration with a "/" on a line by itself
   ret_txt := ret_txt || '/' || CHR(10) || q'{

-- NOTE: Additional file extensions for SQL*Loader include
--   .bad - Bad Records
--   .dsc - Discard Records
--   .log - Log File

prompt
prompt sqlldr_control=./odbcapture_installation_logs.ctl
host sqlldr '&1.' control=odbcapture_installation_logs.ctl data=odbcapture_installation_logs.csv log=odbcapture_installation_logs.log silent=HEADER,FEEDBACK

begin
   if '&_RC.' != '0' then
      raise_application_error(-20000, 'Control file "odbcapture_installation_logs.ctl" returned error: &_RC.');
   end if;
end;
}';
   -- Can't have string declaration with a "/" on a line by itself
   ret_txt := ret_txt || '/' || CHR(10);
   return ret_txt;
end odbcapture_installation_logs_cldr;


--------------------------------------------------------------------------------
-- ODBCAPTURE Installation Logs Comma Separated Values File
function odbcapture_installation_logs_csv
      (in_build_type  in varchar2)
   return varchar2
is
   ret_txt  varchar2(32767);
begin
   ret_txt := '"' || in_build_type || '","install_sys.log"'    || CHR(10) ||
              '"' || in_build_type || '","install_system.log"' || CHR(10) ||
              '"' || in_build_type || '","install_'            ||
                     in_build_type || '.log"';
   for buff in (select table_owner
                      ,table_name
                 from  obj_install_data_load_tab
                 where element_name = 'DATA_LOAD'
                  and  build_type   = in_build_type
                 order by table_owner
                      ,table_name)
   loop
      ret_txt := ret_txt || CHR(10) || '"' || in_build_type   ||
                                     '","' || replace(replace(buff.table_owner,'$','_'),'%','_') ||
                                       '/' || replace(replace(buff.table_name,'$','_'),'%','_')  || '.log"';
   end loop;
   return ret_txt;
end odbcapture_installation_logs_csv;


--------------------------------------------------------------------------------
-- ODBCAPTURE Installation Logs Control File
function odbcapture_installation_logs_ctl
      (in_build_type  in varchar2)
   return varchar2
is
   ret_txt  varchar2(32767);
begin
   ret_txt := q'{LOAD DATA
APPEND INTO TABLE "ODBCAPTURE_INSTALLATION_LOGS"
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
   (LOAD_DTM          SYSDATE
   ,BUILD_TYPE        char(10)
   ,FILE_NAME         char(512)
   ,CONTENTS          LOBFILE(FILE_NAME) TERMINATED BY EOF
   )}';
   return ret_txt;
end odbcapture_installation_logs_ctl;


--------------------------------------------------------------------------------
-- Report Status
function report_status_sql
      (in_build_type  in varchar2)
   return varchar2
is
   ret_txt  varchar2(32767);
begin
   ret_txt := q'{
--
--  Report Status Script
--
--  Must be run as SYSTEM User (DBA)
--
-- Command Line Parameters:
--   1 - SYSTEM/password@TNSALIAS
--       i.e. pass the username and password for the SYSTEM user
--            and the TNSALIAS for the connection to the database.
--       The Data Load installation requires this connection information.
--
-- Note: odbcapture_installation_logs table will be created
--   to load installation logs (if not already available).
--

----------------------------------------
prompt
prompt Load Installation Files
}';
   -- Can't start a line with an "@"
   ret_txt := ret_txt || q'{@"odbcapture_installation_logs.cldr" "&1."}' ||
                         q'{

----------------------------------------
-- Setup for Reports
set echo off
set verify off
set serveroutput on size unlimited format wrapped

----------------------------------------
prompt
prompt Reporting Summary of Build Type Log Errors
}';
   -- Can't have string declaration with a "/" on a line by itself
   ret_txt := ret_txt || '@"' || utl_dir ||
                         '/summarize_install_log.sql" "' || in_build_type ||
                          q'{" "" ""

----------------------------------------
prompt
prompt Reporting Invalid Objects
set feedback off
}';
   -- Can't start a line with an "@"
   ret_txt := ret_txt || '@"' || utl_dir ||
                         '/list_invalids.sql" "' || get_schema_list(in_build_type) ||
                          q'{" "" ""
set feedback on

----------------------------------------
prompt
prompt Reporting JUnit XML Database Build Status
set feedback off
}';
   -- Can't start a line with an "@"
   ret_txt := ret_txt || '@"' || utl_dir ||
                         '/db_build_junit_report.sql" "' || get_schema_list(in_build_type) ||
                          q'{" "" ""
set feedback on

----------------------------------------
prompt
prompt Reorting JUnit XML Installation Log
set feedback off
}';
   -- Can't start a line with an "@"
   ret_txt := ret_txt || '@"' || utl_dir ||
                         '/log_files_junit_report.sql" "' || in_build_type ||
                          q'{" "" ""
set feedback on

----------------------------------------
-- Done with Reports
set verify on}';
   return ret_txt;
end report_status_sql;


--------------------------------------------------------------------------------
-- Set User Authentication
function list_invalids_csv
      (in_build_type  in varchar2)
   return varchar2
is
begin
   return '"OWNER","OBJECT_NAME","OBJECT_TYPE","STATUS"';
end list_invalids_csv;


--------------------------------------------------------------------------------
-- Set User Authentication
function set_user_authentication_sql
      (in_build_type  in varchar2)
   return varchar2
is
   ret_txt  varchar2(32767);
begin
   ret_txt := q'{
--
-- Set "}' || in_build_type || q'{" USER AUTHENTICATION
--
-- Command Line Parameters:
--   1 - Password Key
--

define PASSKEY="&1."

}';
   for sch in (select sl.username
                     ,trim(to_char(ora_hash(username,99),'09'))   HASH_VALUE
                from  schema_conf  sl
                where sl.build_type = in_build_type
                 and  sl.oracle_provided = 'N'
                order by sl.username)
   loop
      ret_txt := ret_txt || 'alter user "' || sch.username   ||
                       '" identified by "' || sch.hash_value || '&PASSKEY.";' ;
   end loop;
   return ret_txt;
end set_user_authentication_sql;


end root_scripts;
/

set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/ZIP_UTIL_PKG.pkbsql
prompt ------------------------------------------------------------

--
--  Create ODBCAPTURE.ZIP_UTIL_PKG Package Body
--

set define off


--DBMS_METADATA:ODBCAPTURE.ZIP_UTIL_PKG

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "ODBCAPTURE"."ZIP_UTIL_PKG" 
is

  /*

  Purpose:      Package handles zipping and unzipping of files

  Remarks:      by Anton Scheffer, see http://forums.oracle.com/forums/thread.jspa?messageID=9289744#9289744

                for unzipping, see http://technology.amis.nl/blog/8090/parsing-a-microsoft-word-docx-and-unzip-zipfiles-with-plsql
                for zipping, see http://forums.oracle.com/forums/thread.jspa?threadID=1115748&tstart=0

  Who     Date        Description
  ------  ----------  --------------------------------
  MBR     09.01.2011  Created
  MBR     21.05.2012  Fixed a bug related to use of dbms_lob.substr in get_file (use dbms_lob.copy instead)

  */

  function raw2num(
    p_value in raw
  )
    return number
  is
  begin                                               -- note: FFFFFFFF => -1
    return utl_raw.cast_to_binary_integer( p_value
                                         , utl_raw.little_endian
                                         );
  end;
--
  function file2blob(
    p_dir in varchar2
  , p_file_name in varchar2
  )
    return blob
  is
    file_lob bfile;
    file_blob blob;
  begin
    file_lob := bfilename( p_dir
                         , p_file_name
                         );
    dbms_lob.open( file_lob
                 , dbms_lob.file_readonly
                 );
    dbms_lob.createtemporary( file_blob
                            , true
                            );
    dbms_lob.loadfromfile( file_blob
                         , file_lob
                         , dbms_lob.lobmaxsize
                         );
    dbms_lob.close( file_lob );
    return file_blob;
  exception
    when others
    then
      if dbms_lob.isopen( file_lob ) = 1
      then
        dbms_lob.close( file_lob );
      end if;
      if dbms_lob.istemporary( file_blob ) = 1
      then
        dbms_lob.freetemporary( file_blob );
      end if;
      raise;
  end;
--
  function raw2varchar2(
    p_raw in raw
  , p_encoding in varchar2
  )
    return varchar2
  is
  begin
    return nvl
            ( utl_i18n.raw_to_char( p_raw
                                  , p_encoding
                                  )
            , utl_i18n.raw_to_char
                            ( p_raw
                            , utl_i18n.map_charset( p_encoding
                                                  , utl_i18n.generic_context
                                                  , utl_i18n.iana_to_oracle
                                                  )
                            )
            );
  end;
  function get_file_list(
    p_dir in varchar2
  , p_zip_file in varchar2
  , p_encoding in varchar2 := null
  )
    return t_file_list
  is
  begin
    return get_file_list( file2blob( p_dir
                                   , p_zip_file
                                   )
                        , p_encoding
                        );
  end;
--
  function get_file_list(
    p_zipped_blob in blob
  , p_encoding in varchar2 := null
  )
    return t_file_list
  is
    t_ind integer;
    t_hd_ind integer;
    t_rv t_file_list;
  begin
    t_ind := dbms_lob.getlength( p_zipped_blob ) - 21;
    loop
      exit when dbms_lob.substr( p_zipped_blob
                               , 4
                               , t_ind
                               ) = hextoraw( '504B0506' )
            or t_ind < 1;
      t_ind := t_ind - 1;
    end loop;
--
    if t_ind <= 0
    then
      return null;
    end if;
--
    t_hd_ind := raw2num( dbms_lob.substr( p_zipped_blob
                                        , 4
                                        , t_ind + 16
                                        ) ) + 1;
    t_rv := t_file_list( );
    t_rv.extend( raw2num( dbms_lob.substr( p_zipped_blob
                                         , 2
                                         , t_ind + 10
                                         ) ) );
    for i in 1 .. raw2num( dbms_lob.substr( p_zipped_blob
                                          , 2
                                          , t_ind + 8
                                          ) )
    loop
      t_rv( i ) :=
        raw2varchar2
             ( dbms_lob.substr( p_zipped_blob
                              , raw2num( dbms_lob.substr( p_zipped_blob
                                                        , 2
                                                        , t_hd_ind + 28
                                                        ) )
                              , t_hd_ind + 46
                              )
             , p_encoding
             );
      t_hd_ind :=
          t_hd_ind
        + 46
        + raw2num( dbms_lob.substr( p_zipped_blob
                                  , 2
                                  , t_hd_ind + 28
                                  ) )
        + raw2num( dbms_lob.substr( p_zipped_blob
                                  , 2
                                  , t_hd_ind + 30
                                  ) )
        + raw2num( dbms_lob.substr( p_zipped_blob
                                  , 2
                                  , t_hd_ind + 32
                                  ) );
    end loop;
--
    return t_rv;
  end;
--
  function get_file(
    p_dir in varchar2
  , p_zip_file in varchar2
  , p_file_name in varchar2
  , p_encoding in varchar2 := null
  )
    return blob
  is
  begin
    return get_file( file2blob( p_dir
                              , p_zip_file
                              )
                   , p_file_name
                   , p_encoding
                   );
  end;
--
  function get_file(
    p_zipped_blob in blob
  , p_file_name in varchar2
  , p_encoding in varchar2 := null
  )
    return blob
  is
    t_tmp blob;
    t_ind integer;
    t_hd_ind integer;
    t_fl_ind integer;
  begin
    t_ind := dbms_lob.getlength( p_zipped_blob ) - 21;
    loop
      exit when dbms_lob.substr( p_zipped_blob
                               , 4
                               , t_ind
                               ) = hextoraw( '504B0506' )
            or t_ind < 1;
      t_ind := t_ind - 1;
    end loop;
--
    if t_ind <= 0
    then
      return null;
    end if;
--
    t_hd_ind := raw2num( dbms_lob.substr( p_zipped_blob
                                        , 4
                                        , t_ind + 16
                                        ) ) + 1;
    for i in 1 .. raw2num( dbms_lob.substr( p_zipped_blob
                                          , 2
                                          , t_ind + 8
                                          ) )
    loop
      if p_file_name =
           raw2varchar2
             ( dbms_lob.substr( p_zipped_blob
                              , raw2num( dbms_lob.substr( p_zipped_blob
                                                        , 2
                                                        , t_hd_ind + 28
                                                        ) )
                              , t_hd_ind + 46
                              )
             , p_encoding
             )
      then
        if dbms_lob.substr( p_zipped_blob
                          , 2
                          , t_hd_ind + 10
                          ) = hextoraw( '0800' )                -- deflate
        then
          t_fl_ind :=
                raw2num( dbms_lob.substr( p_zipped_blob
                                        , 4
                                        , t_hd_ind + 42
                                        ) );
          t_tmp := hextoraw( '1F8B0800000000000003' );          -- gzip header
          dbms_lob.copy( t_tmp
                       , p_zipped_blob
                       , raw2num( dbms_lob.substr( p_zipped_blob
                                                 , 4
                                                 , t_fl_ind + 19
                                                 ) )
                       , 11
                       ,   t_fl_ind
                         + 31
                         + raw2num( dbms_lob.substr( p_zipped_blob
                                                   , 2
                                                   , t_fl_ind + 27
                                                   ) )
                         + raw2num( dbms_lob.substr( p_zipped_blob
                                                   , 2
                                                   , t_fl_ind + 29
                                                   ) )
                       );
          dbms_lob.append( t_tmp
                         , dbms_lob.substr( p_zipped_blob
                                          , 4
                                          , t_fl_ind + 15
                                          )
                         );
          dbms_lob.append( t_tmp
                         , dbms_lob.substr( p_zipped_blob, 4, t_fl_ind + 23 )
                         );
          return utl_compress.lz_uncompress( t_tmp );
        end if;
--
        if dbms_lob.substr( p_zipped_blob
                          , 2
                          , t_hd_ind + 10
                          ) =
                      hextoraw( '0000' )
                                        -- The file is stored (no compression)
        then
          t_fl_ind :=
                raw2num( dbms_lob.substr( p_zipped_blob
                                        , 4
                                        , t_hd_ind + 42
                                        ) );

          dbms_lob.createtemporary(t_tmp, cache => true);

          dbms_lob.copy(dest_lob => t_tmp,
                        src_lob => p_zipped_blob,
                        amount => raw2num( dbms_lob.substr( p_zipped_blob, 4, t_fl_ind + 19)),
                        dest_offset => 1,
                        src_offset => t_fl_ind + 31 + raw2num(dbms_lob.substr(p_zipped_blob, 2, t_fl_ind + 27)) + raw2num(dbms_lob.substr( p_zipped_blob, 2, t_fl_ind + 29))
                       );

          return t_tmp;

        end if;

      end if;
      t_hd_ind :=
          t_hd_ind
        + 46
        + raw2num( dbms_lob.substr( p_zipped_blob
                                  , 2
                                  , t_hd_ind + 28
                                  ) )
        + raw2num( dbms_lob.substr( p_zipped_blob
                                  , 2
                                  , t_hd_ind + 30
                                  ) )
        + raw2num( dbms_lob.substr( p_zipped_blob
                                  , 2
                                  , t_hd_ind + 32
                                  ) );
    end loop;
--
    return null;
  end;
--
  function little_endian(
    p_big in number
  , p_bytes in pls_integer := 4
  )
    return raw
  is
  begin
    return utl_raw.substr
                  ( utl_raw.cast_from_binary_integer( p_big
                                                    , utl_raw.little_endian
                                                    )
                  , 1
                  , p_bytes
                  );
  end;
--
  procedure add_file(
    p_zipped_blob in out nocopy blob
  , p_name in varchar2
  , p_content in blob
  )
  is
    t_now date;
    t_blob blob;
    t_clen integer;
  begin
    t_now := sysdate;
    t_blob := utl_compress.lz_compress( p_content );
    t_clen := dbms_lob.getlength( t_blob );
    if p_zipped_blob is null
    then
      dbms_lob.createtemporary( p_zipped_blob
                              , true
                              );
    end if;
    dbms_lob.append
      ( p_zipped_blob
      , utl_raw.concat
          ( hextoraw( '504B0304' )              -- Local file header signature
          , hextoraw( '1400' )                  -- version 2.0
          , hextoraw( '0000' )                  -- no General purpose bits
          , hextoraw( '0800' )                  -- deflate
          , little_endian
              (   to_number( to_char( t_now
                                    , 'ss'
                                    ) ) / 2
                + to_number( to_char( t_now
                                    , 'mi'
                                    ) ) * 32
                + to_number( to_char( t_now
                                    , 'hh24'
                                    ) ) * 2048
              , 2
              )                                 -- File last modification time
          , little_endian
              (   to_number( to_char( t_now
                                    , 'dd'
                                    ) )
                + to_number( to_char( t_now
                                    , 'mm'
                                    ) ) * 32
                + ( to_number( to_char( t_now
                                      , 'yyyy'
                                      ) ) - 1980 ) * 512
              , 2
              )                                 -- File last modification date
          , dbms_lob.substr( t_blob
                           , 4
                           , t_clen - 7
                           )                                         -- CRC-32
          , little_endian( t_clen - 18 )                    -- compressed size
          , little_endian( dbms_lob.getlength( p_content ) )
                                                          -- uncompressed size
          , little_endian( length( p_name )
                         , 2
                         )                                 -- File name length
          , hextoraw( '0000' )                           -- Extra field length
          , utl_raw.cast_to_raw( p_name )                         -- File name
          )
      );
    dbms_lob.copy( p_zipped_blob
                 , t_blob
                 , t_clen - 18
                 , dbms_lob.getlength( p_zipped_blob ) + 1
                 , 11
                 );                                      -- compressed content
    dbms_lob.freetemporary( t_blob );
  end;
--
  procedure finish_zip(
    p_zipped_blob in out nocopy blob
  )
  is
    t_cnt pls_integer := 0;
    t_offs integer;
    t_offs_dir_header integer;
    t_offs_end_header integer;
    t_comment raw( 32767 )
                 := utl_raw.cast_to_raw( 'Implementation by Anton Scheffer' );
  begin
    t_offs_dir_header := dbms_lob.getlength( p_zipped_blob );
    t_offs := dbms_lob.instr( p_zipped_blob
                            , hextoraw( '504B0304' )
                            , 1
                            );
    while t_offs > 0
    loop
      t_cnt := t_cnt + 1;
      dbms_lob.append
        ( p_zipped_blob
        , utl_raw.concat
            ( hextoraw( '504B0102' )
                                    -- Central directory file header signature
            , hextoraw( '1400' )                                -- version 2.0
            , dbms_lob.substr( p_zipped_blob
                             , 26
                             , t_offs + 4
                             )
            , hextoraw( '0000' )                        -- File comment length
            , hextoraw( '0000' )              -- Disk number where file starts
            , hextoraw( '0100' )                   -- Internal file attributes
            , hextoraw( '2000B681' )               -- External file attributes
            , little_endian( t_offs - 1 )
                                       -- Relative offset of local file header
            , dbms_lob.substr
                ( p_zipped_blob
                , utl_raw.cast_to_binary_integer
                                           ( dbms_lob.substr( p_zipped_blob
                                                            , 2
                                                            , t_offs + 26
                                                            )
                                           , utl_raw.little_endian
                                           )
                , t_offs + 30
                )                                                 -- File name
            )
        );
      t_offs :=
          dbms_lob.instr( p_zipped_blob
                        , hextoraw( '504B0304' )
                        , t_offs + 32
                        );
    end loop;
    t_offs_end_header := dbms_lob.getlength( p_zipped_blob );
    dbms_lob.append
      ( p_zipped_blob
      , utl_raw.concat
          ( hextoraw( '504B0506' )       -- End of central directory signature
          , hextoraw( '0000' )                          -- Number of this disk
          , hextoraw( '0000' )          -- Disk where central directory starts
          , little_endian
                   ( t_cnt
                   , 2
                   )       -- Number of central directory records on this disk
          , little_endian( t_cnt
                         , 2
                         )        -- Total number of central directory records
          , little_endian( t_offs_end_header - t_offs_dir_header )
                                                  -- Size of central directory
          , little_endian
                    ( t_offs_dir_header )
                                       -- Relative offset of local file header
          , little_endian
                ( nvl( utl_raw.length( t_comment )
                     , 0
                     )
                , 2
                )                                   -- ZIP file comment length
          , t_comment
          )
      );
  end;
--
  procedure save_zip(
    p_zipped_blob in blob
  , p_dir in varchar2
  , p_filename in varchar2
  )
  is
    t_fh utl_file.file_type;
    t_len pls_integer := 32767;
  begin
    t_fh := utl_file.fopen( p_dir
                          , p_filename
                          , 'wb'
                          );
    for i in 0 .. trunc(  ( dbms_lob.getlength( p_zipped_blob ) - 1 ) / t_len )
    loop
      utl_file.put_raw( t_fh
                      , dbms_lob.substr( p_zipped_blob
                                       , t_len
                                       , i * t_len + 1
                                       )
                      );
    end loop;
    utl_file.fclose( t_fh );
  end;
--

end zip_util_pkg;
/

set define on

----------------------------------------
-- TABLE_FOREIGN_KEY Install

prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/BUILD_PATH.tfk
prompt ------------------------------------------------------------

--
--  Create Foreign Keys for ODBCAPTURE.BUILD_PATH TABLE
--

set define off


--  NOTE: This is a "BASE TABLE" Foreign Key

--DBMS_METADATA:ODBCAPTURE.BUILD_PATH_FK1

  ALTER TABLE "ODBCAPTURE"."BUILD_PATH" ADD CONSTRAINT "BUILD_PATH_FK1" FOREIGN KEY ("PARENT_BUILD_SEQ")
	  REFERENCES "ODBCAPTURE"."BUILD_CONF" ("BUILD_SEQ") ENABLE;

--  NOTE: This is a "BASE TABLE" Foreign Key

--DBMS_METADATA:ODBCAPTURE.BUILD_PATH_FK2

  ALTER TABLE "ODBCAPTURE"."BUILD_PATH" ADD CONSTRAINT "BUILD_PATH_FK2" FOREIGN KEY ("BUILD_SEQ")
	  REFERENCES "ODBCAPTURE"."BUILD_CONF" ("BUILD_SEQ") ENABLE;

set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/DLOAD_CONF.tfk
prompt ------------------------------------------------------------

--
--  Create Foreign Keys for ODBCAPTURE.DLOAD_CONF TABLE
--

set define off


--  NOTE: This is a "BASE TABLE" Foreign Key

--DBMS_METADATA:ODBCAPTURE.DLOAD_CONF_FK1

  ALTER TABLE "ODBCAPTURE"."DLOAD_CONF" ADD CONSTRAINT "DLOAD_CONF_FK1" FOREIGN KEY ("USERNAME")
	  REFERENCES "ODBCAPTURE"."SCHEMA_CONF" ("USERNAME") ENABLE;

--  NOTE: This is a "BASE TABLE" Foreign Key

--DBMS_METADATA:ODBCAPTURE.DLOAD_CONF_FK2

  ALTER TABLE "ODBCAPTURE"."DLOAD_CONF" ADD CONSTRAINT "DLOAD_CONF_FK2" FOREIGN KEY ("BUILD_TYPE")
	  REFERENCES "ODBCAPTURE"."BUILD_CONF" ("BUILD_TYPE") ENABLE;

set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/OBJECT_CONF.tfk
prompt ------------------------------------------------------------

--
--  Create Foreign Keys for ODBCAPTURE.OBJECT_CONF TABLE
--

set define off


--  NOTE: This is a "BASE TABLE" Foreign Key

--DBMS_METADATA:ODBCAPTURE.OBJECT_CONF_FK1

  ALTER TABLE "ODBCAPTURE"."OBJECT_CONF" ADD CONSTRAINT "OBJECT_CONF_FK1" FOREIGN KEY ("USERNAME")
	  REFERENCES "ODBCAPTURE"."SCHEMA_CONF" ("USERNAME") ENABLE;

--  NOTE: This is a "BASE TABLE" Foreign Key

--DBMS_METADATA:ODBCAPTURE.OBJECT_CONF_FK2

  ALTER TABLE "ODBCAPTURE"."OBJECT_CONF" ADD CONSTRAINT "OBJECT_CONF_FK2" FOREIGN KEY ("ELEMENT_NAME")
	  REFERENCES "ODBCAPTURE"."ELEMENT_CONF" ("ELEMENT_NAME") ENABLE;

--  NOTE: This is a "BASE TABLE" Foreign Key

--DBMS_METADATA:ODBCAPTURE.OBJECT_CONF_FK3

  ALTER TABLE "ODBCAPTURE"."OBJECT_CONF" ADD CONSTRAINT "OBJECT_CONF_FK3" FOREIGN KEY ("BUILD_TYPE")
	  REFERENCES "ODBCAPTURE"."BUILD_CONF" ("BUILD_TYPE") ENABLE;

set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/ROLE_CONF.tfk
prompt ------------------------------------------------------------

--
--  Create Foreign Keys for ODBCAPTURE.ROLE_CONF TABLE
--

set define off


--  NOTE: This is a "BASE TABLE" Foreign Key

--DBMS_METADATA:ODBCAPTURE.ROLE_CONF_FK1

  ALTER TABLE "ODBCAPTURE"."ROLE_CONF" ADD CONSTRAINT "ROLE_CONF_FK1" FOREIGN KEY ("BUILD_TYPE")
	  REFERENCES "ODBCAPTURE"."BUILD_CONF" ("BUILD_TYPE") ENABLE;

set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/SCHEMA_CONF.tfk
prompt ------------------------------------------------------------

--
--  Create Foreign Keys for ODBCAPTURE.SCHEMA_CONF TABLE
--

set define off


--  NOTE: This is a "BASE TABLE" Foreign Key

--DBMS_METADATA:ODBCAPTURE.SCHEMA_CONF_FK1

  ALTER TABLE "ODBCAPTURE"."SCHEMA_CONF" ADD CONSTRAINT "SCHEMA_CONF_FK1" FOREIGN KEY ("BUILD_TYPE")
	  REFERENCES "ODBCAPTURE"."BUILD_CONF" ("BUILD_TYPE") ENABLE;

set define on
prompt ------------------------------------------------------------
prompt Running: grbsrc ODBCAPTURE/TSPACE_CONF.tfk
prompt ------------------------------------------------------------

--
--  Create Foreign Keys for ODBCAPTURE.TSPACE_CONF TABLE
--

set define off


--  NOTE: This is a "BASE TABLE" Foreign Key

--DBMS_METADATA:ODBCAPTURE.TSPACE_CONF_FK1

  ALTER TABLE "ODBCAPTURE"."TSPACE_CONF" ADD CONSTRAINT "TSPACE_CONF_FK1" FOREIGN KEY ("USERNAME")
	  REFERENCES "ODBCAPTURE"."SCHEMA_CONF" ("USERNAME") ENABLE;

set define on

----------------------------------------
-- Finalize Installation (Includes SPOOL OFF)
prompt ------------------------------------------------------------
prompt Running: grbsrc ./installation_finalize.sql
prompt ------------------------------------------------------------

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
--@"../grb_linked_install_scripts/fix_invalid_public_synonyms.sql" "" "" ""

prompt
prompt compile_all
--@"../grb_linked_install_scripts/compile_all.sql" "'ODBCAPTURE'" "" ""

prompt
prompt alter_foreign_keys_ENABLE
--@"../grb_linked_install_scripts/alter_foreign_keys.sql" "ENABLE" "'ODBCAPTURE'" ""

prompt
prompt alter_triggers_ENABLE
--@"../grb_linked_install_scripts/alter_triggers.sql" "ENABLE" "'ODBCAPTURE'" ""

prompt
prompt update_id_sequences
--@"../grb_linked_install_scripts/update_id_sequences.sql" "'ODBCAPTURE'" "" ""

--prompt
--prompt alter_queues_ENABLE
--@"../grb_linked_install_scripts/alter_queues.sql" "ENABLE" "'ODBCAPTURE'" ""

--prompt
--prompt alter_scheduler_jobs_ENABLE
--@"../grb_linked_install_scripts/alter_scheduler_jobs.sql" "ENABLE" "'ODBCAPTURE'" ""

prompt
prompt Switch Spooling Off




