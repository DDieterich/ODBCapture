
--
--  Create ODBCAPTURE.OBJ_INSTALL_XDB_REPO_VIEW view
--

set define off


--
--  Cannot grant permisions on a view with an error
--  https://asktom.oracle.com/pls/apex/f?p=100:11:0::::P11_QUESTION_ID:43253832697675#2653213300346351987
create view "ODBCAPTURE"."OBJ_INSTALL_XDB_REPO_VIEW"
  as   select * from TEMP_PUBLICLY_UPDATEABLE_TABLE;

--  Grants



--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_XDB_REPO_VIEW

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ODBCAPTURE"."OBJ_INSTALL_XDB_REPO_VIEW" ("BUILD_TYPE", "BUILD_TIMING", "OBJECT_NAME_REGEXP", "OBJECT_OWNER_BUILD_TYPE", "OBJECT_OWNER", "OBJECT_BUILD_TYPE", "OBJECT_NAME", "OBJECT_TYPE", "ELEMENT_NAME", "FILE_EXT1", "FILE_EXT2", "FILE_EXT3") AS 
  with q_nondflt as (
  select oc.build_type
      ,t.build_timing
      ,oc.object_name_regexp
      ,sc.build_type               OBJECT_OWNER_BUILD_TYPE
      ,xsd.owner                   OBJECT_OWNER
      ,oc.build_type               OBJECT_BUILD_TYPE
      ,xsd.int_objname             OBJECT_NAME
      ,'XML SCHEMA'                OBJECT_TYPE
      ,ec.element_name
      ,ec.file_ext1
      ,ec.file_ext2
      ,ec.file_ext3
 from  dba_xml_schemas  xsd
       join schema_conf  sc
            on  sc.username        = xsd.owner
            and sc.oracle_provided = 'N'  -- Exclude Oracle Provided Synonym Owner
       join element_conf  ec
            on  ec.element_name = 'XML_SCHEMA'
       join object_conf  oc
            on  oc.username     = xsd.owner
            and oc.build_type  != sc.build_type
            and oc.element_name = 'XML_SCHEMA'
            and regexp_like(xsd.int_objname, oc.object_name_regexp)
       join build_type_timing  t
            -- Ensure the owner is installed before this object
            on  t.from_build_type = oc.build_type
            and t.to_build_type   = sc.build_type
 where xsd.int_objname not like common_util.get_RECYCLE_BIN_PATTERN escape '\'
), q_dflt as (
  select sc.build_type             BUILD_TYPE
      ,'CURRENT'                   BUILD_TIMING
      ,NULL                        OBJECT_NAME_REGEXP
      ,sc.build_type               OBJECT_OWNER_BUILD_TYPE
      ,xsd.owner                   OBJECT_OWNER
      ,sc.build_type               OBJECT_BUILD_TYPE
      ,xsd.int_objname             OBJECT_NAME
      ,'XML SCHEMA'                OBJECT_TYPE
      ,ec.element_name
      ,ec.file_ext1
      ,ec.file_ext2
      ,ec.file_ext3
 from  dba_xml_schemas  xsd
       join schema_conf  sc
            on  sc.username        = xsd.owner
            and sc.oracle_provided = 'N'  -- Exclude Oracle Provided Synonym Owner
       join element_conf  ec
            on  ec.element_name = 'XML_SCHEMA'
  and  (xsd.owner, 'XML SCHEMA', xsd.int_objname) not in (
        select q_nondflt.object_owner, q_nondflt.object_type, q_nondflt.object_name from q_nondflt)
  and  xsd.int_objname not like common_util.get_RECYCLE_BIN_PATTERN escape '\'
)
select "BUILD_TYPE","BUILD_TIMING","OBJECT_NAME_REGEXP","OBJECT_OWNER_BUILD_TYPE","OBJECT_OWNER","OBJECT_BUILD_TYPE","OBJECT_NAME","OBJECT_TYPE","ELEMENT_NAME","FILE_EXT1","FILE_EXT2","FILE_EXT3" from q_nondflt
UNION ALL
select "BUILD_TYPE","BUILD_TIMING","OBJECT_NAME_REGEXP","OBJECT_OWNER_BUILD_TYPE","OBJECT_OWNER","OBJECT_BUILD_TYPE","OBJECT_NAME","OBJECT_TYPE","ELEMENT_NAME","FILE_EXT1","FILE_EXT2","FILE_EXT3" from q_dflt;

--  Comments

--DBMS_METADATA:ODBCAPTURE.OBJ_INSTALL_XDB_REPO_VIEW


--  Grants


--  Synonyms


set define on
