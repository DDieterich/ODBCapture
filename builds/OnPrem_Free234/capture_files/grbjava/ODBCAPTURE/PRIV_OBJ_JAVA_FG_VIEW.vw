
--
--  Create ODBCAPTURE.PRIV_OBJ_JAVA_FG_VIEW view
--

set define off


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


set define on
