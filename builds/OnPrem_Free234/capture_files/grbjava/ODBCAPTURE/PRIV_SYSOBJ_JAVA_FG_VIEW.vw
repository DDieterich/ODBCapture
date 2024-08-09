
--
--  Create ODBCAPTURE.PRIV_SYSOBJ_JAVA_FG_VIEW view
--

set define off


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


set define on
