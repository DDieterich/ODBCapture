
--
--  Create ODBCAPTURE.PRIV_OBJ_RACL_VIEW view
--

set define off


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


set define on
