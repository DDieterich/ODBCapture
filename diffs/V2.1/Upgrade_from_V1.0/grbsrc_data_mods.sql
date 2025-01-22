
-- BUILD_CONF
-- No Changes to Base Install

--insert into "ODBCAPTURE"."BUILD_CONF" ("BUILD_SEQ","BUILD_TYPE","NOTES")
--   values (59,'grbxrep','Oracle XDB Repository');

-- BUILD_PATH
-- No Changes to Base Install

--insert into "ODBCAPTURE"."BUILD_PATH" ("PARENT_BUILD_SEQ","BUILD_SEQ")
--   values (-82,-59);
--insert into "ODBCAPTURE"."BUILD_PATH" ("PARENT_BUILD_SEQ","BUILD_SEQ")
--   values (-59,-50);

-- DLOAD_CONF
-- No Changes to Base Install

--update "ODBCAPTURE"."DLOAD_CONF"
--  set  "WHERE_CLAUSE" = 'build_type in (''sys'',''pub'')'
-- where "USERNAME"   = 'ODBCAPTURE'
--  and  "TABLE_NAME" = 'BUILD_CONF'
--  and  "BUILD_TYPE" = 'grbsrc';
--insert into "ODBCAPTURE"."DLOAD_CONF" ("USERNAME","TABLE_NAME","BUILD_TYPE","ORDER_BY_COLUMNS","WHERE_CLAUSE")
-- values ('ODBCAPTURE','BUILD_CONF','grbdat','BUILD_SEQ','build_type in (''grbsrc'',''grbjava'',''grbras'',''grbsdo'',''grbxrep'',''grbendp'',''grbdat'')');
--
--update "ODBCAPTURE"."DLOAD_CONF"
--  set  "WHERE_CLAUSE" = 'build_seq in (build_type in (''sys'',''pub''))'
-- where "USERNAME"   = 'ODBCAPTURE'
--  and  "TABLE_NAME" = 'BUILD_PATH'
--  and  "BUILD_TYPE" = 'grbsrc';
--insert into "ODBCAPTURE"."DLOAD_CONF" ("USERNAME","TABLE_NAME","BUILD_TYPE","ORDER_BY_COLUMNS","WHERE_CLAUSE")
-- values ('ODBCAPTURE','BUILD_PATH','grbdat','BUILD_SEQ','build_seq in (build_type in (''grbsrc'',''grbjava'',''grbras'',''grbsdo'',''grbxrep'',''grbendp'',''grbdat''))');
--
--update "ODBCAPTURE"."DLOAD_CONF"
--  set  "WHERE_CLAUSE" = 'build_type in (''sys'',''pub'')'
-- where "USERNAME"   = 'ODBCAPTURE'
--  and  "TABLE_NAME" = 'ROLE_CONF'
--  and  "BUILD_TYPE" = 'grbsrc';
--insert into "ODBCAPTURE"."DLOAD_CONF" ("USERNAME","TABLE_NAME","BUILD_TYPE","ORDER_BY_COLUMNS","WHERE_CLAUSE")
-- values ('ODBCAPTURE','ROLE_CONF','grbdat','BUILD_SEQ','build_type in (''grbsrc'',''grbjava'',''grbras'',''grbsdo'',''grbxrep'',''grbendp'',''grbdat'')');
--delete from "ODBCAPTURE"."DLOAD_CONF"
-- where "USERNAME"   = 'ODBCAPTURE'
--  and  "TABLE_NAME" = 'ROLE_CONF'
--  and  "BUILD_TYPE" in ('grbjava','grbras','grbsdo','grbxrep');
--
--update "ODBCAPTURE"."DLOAD_CONF"
--  set  "WHERE_CLAUSE" = 'build_type in (''sys'',''pub'')'
-- where "USERNAME"   = 'ODBCAPTURE'
--  and  "TABLE_NAME" = 'SCHEMA_CONF'
--  and  "BUILD_TYPE" = 'grbsrc';
--insert into "ODBCAPTURE"."DLOAD_CONF" ("USERNAME","TABLE_NAME","BUILD_TYPE","ORDER_BY_COLUMNS","WHERE_CLAUSE")
-- values ('ODBCAPTURE','SCHEMA_CONF','grbdat','BUILD_SEQ','build_type in (''grbsrc'',''grbjava'',''grbras'',''grbsdo'',''grbxrep'',''grbendp'',''grbdat'')');
--delete from "ODBCAPTURE"."DLOAD_CONF"
-- where "USERNAME"   = 'ODBCAPTURE'
--  and  "TABLE_NAME" = 'SCHEMA_CONF'
--  and  "BUILD_TYPE" in ('grbjava','grbras','grbsdo','grbxrep');
--
--update "ODBCAPTURE"."DLOAD_CONF"
--  set  "BUILD_TYPE"   = 'grbtdat'
--      ,"WHERE_CLAUSE" = 'build_type in (''grbtst'',''grbtctx'',''grbtjva'',''grbtjsn'',''grbtsdo'',''grbtend'',''grbtdat'')'
-- where "USERNAME"   = 'ODBCAPTURE'
--  and  "TABLE_NAME" = 'BUILD_CONF'
--  and  "BUILD_TYPE" = 'grbtst';
--
--update "ODBCAPTURE"."DLOAD_CONF"
--  set  "BUILD_TYPE"   = 'grbtdat'
--      ,"WHERE_CLAUSE" = 'build_seq in (select build_seq from build_conf where build_type in (''grbtst'',''grbtctx'',''grbtjva'',''grbtjsn'',''grbtsdo'',''grbtend'',''grbtdat''))'
-- where "USERNAME"   = 'ODBCAPTURE'
--  and  "TABLE_NAME" = 'BUILD_PATH'
--  and  "BUILD_TYPE" = 'grbtst';
--
--update "ODBCAPTURE"."DLOAD_CONF"
--  set  "BUILD_TYPE"   = 'grbtdat'
--      ,"WHERE_CLAUSE" = 'build_type in (''grbtst'',''grbtctx'',''grbtjva'',''grbtjsn'',''grbtsdo'',''grbtend'',''grbtdat'')'
--      ,"ORDER_BY_CLAUSE" = 'ROLENAME'
-- where "USERNAME"   = 'ODBCAPTURE'
--  and  "TABLE_NAME" = 'ROLE_CONF'
--  and  "BUILD_TYPE" = 'grbtst';
--
--update "ODBCAPTURE"."DLOAD_CONF"
--  set  "BUILD_TYPE"   = 'grbtdat'
--      ,"WHERE_CLAUSE" = 'build_type in (''grbtst'',''grbtctx'',''grbtjva'',''grbtjsn'',''grbtsdo'',''grbtend'',''grbtdat'')'
-- where "USERNAME"   = 'ODBCAPTURE'
--  and  "TABLE_NAME" = 'SCHEMA_CONF'
--  and  "BUILD_TYPE" = 'grbtst';

-- ELEMENT_CONF

update "ODBCAPTURE"."ELEMENT_CONF" set "PRE_COMPILE" = 'Y' where "ELEMENT_NAME" = 'VIEW';
-- From Sequence:
--320,"DATA_LOAD"
--330,"TABLE_INDEX"
--350,"MVIEW_INDEX"
--360,"VIEW"
--370,"MVIEW"
update "ODBCAPTURE"."ELEMENT_CONF" set "ELEMENT_SEQ" = 300 where "ELEMENT_NAME" = 'MVIEW';
update "ODBCAPTURE"."ELEMENT_CONF" set "ELEMENT_SEQ" = 370 where "ELEMENT_NAME" = 'MVIEW_INDEX';
update "ODBCAPTURE"."ELEMENT_CONF" set "ELEMENT_SEQ" = 350 where "ELEMENT_NAME" = 'DATA_LOAD';
update "ODBCAPTURE"."ELEMENT_CONF" set "ELEMENT_SEQ" = 320 where "ELEMENT_NAME" = 'VIEW';
update "ODBCAPTURE"."ELEMENT_CONF" set "ELEMENT_SEQ" = 360 where "ELEMENT_NAME" = 'TABLE_INDEX';
update "ODBCAPTURE"."ELEMENT_CONF" set "ELEMENT_SEQ" = 330 where "ELEMENT_NAME" = 'MVIEW';
-- To Sequence:
--320,"VIEW"
--330,"MVIEW"
--350,"DATA_LOAD"
--360,"TABLE_INDEX"
--370,"MVIEW_INDEX"
insert into "ODBCAPTURE"."ELEMENT_CONF" ("ELEMENT_SEQ","ELEMENT_NAME","FILE_EXT1","FILE_EXT2","FILE_EXT3","OBJECT_TYPE","NAME_CHECK_OBJECT_TYPE","NOTES","PRE_COMPILE")
   values (-127,'XDB_ACL','xacl',,,,,'SYS Only. XDB Repositoty ACL (Deprecated) (Not Implemented)',);
insert into "ODBCAPTURE"."ELEMENT_CONF" ("ELEMENT_SEQ","ELEMENT_NAME","FILE_EXT1","FILE_EXT2","FILE_EXT3","OBJECT_TYPE","NAME_CHECK_OBJECT_TYPE","NOTES","PRE_COMPILE")
   values (100,'XML_SCHEMA','pxsd',,,'XML SCHEMA',,'DBMS_XMLSCHEMA Registered Schema (Deprecated)',);

-- ROLE_CONF

update "ODBCAPTURE"."ROLE_CONF" set "NOTES" = '(grbaqadm) Privilege to administer Advanced Queuing.' where "ROLENAME" = 'AQ_ADMINISTRATOR_ROLE';
update "ODBCAPTURE"."ROLE_CONF" set "NOTES" = '(grbaqadm) De-supported but maintained for backward compatibility to version 8.0.' where "ROLENAME" = 'AQ_USER_ROLE';
update "ODBCAPTURE"."ROLE_CONF" set "NOTES" = '(grbaudit) Provides privileges to create unified and fine-grained audit policies, use the AUDIT and NOAUDIT SQL statements, view audit data, and manage the audit trail administration.' where "ROLENAME" = 'AUDIT_ADMIN';
update "ODBCAPTURE"."ROLE_CONF" set "NOTES" = '(grbaudit) Provides privileges to view and analyze audit data.' where "ROLENAME" = 'AUDIT_VIEWER';
update "ODBCAPTURE"."ROLE_CONF" set "NOTES" = '(grbbdata) Big Data SQL Admin Role.' where "ROLENAME" = 'BDSQL_ADMIN';
update "ODBCAPTURE"."ROLE_CONF" set "NOTES" = '(grbbdata) Big Data SQL User Role.' where "ROLENAME" = 'BDSQL_USER';
update "ODBCAPTURE"."ROLE_CONF" set "NOTES" = '(grbggadm) Golden Gate Administrator Privileges.' where "ROLENAME" = 'GGSYS_ROLE';
update "ODBCAPTURE"."ROLE_CONF" set "NOTES" = '(grbaqadm) Required to register through LDAP using JDBC connection parameters as this requires the ability to write access to the connection factory entries in the LDAP server (which requires the LDAP user to be either the database itself or be granted GLOBAL_AQ_USER_ROLE).' where "ROLENAME" = 'GLOBAL_AQ_USER_ROLE';

update "ODBCAPTURE"."ROLE_CONF"
  set  "BUILD_TYPE" = 'sys'
      ,"NOTES"      = '(grbxrep) Used by the XDB protocols to define any user who has logged in to the system.'
 where "ROLENAME" = 'AUTHENTICATEDUSER';

update "ODBCAPTURE"."ROLE_CONF"
  set  "BUILD_TYPE" = 'sys'
      ,"NOTES"      = '(grbsdo) Provides user privileges to manage the Catalog Services for the Web (CSW) component of Oracle Spatial.'
 where "ROLENAME" = 'CSW_USR_ROLE';

update "ODBCAPTURE"."ROLE_CONF"
  set  "BUILD_TYPE" = 'sys'
      ,"NOTES"      = '(grbjava) Needed for running JavaScript code, using the Nashorn engine of 12.2 Oracle JVM in your sessions. This role includes the permissions that are required to run Nashorn in the database.'
 where "ROLENAME" = 'DBJAVASCRIPT';

update "ODBCAPTURE"."ROLE_CONF"
  set  "BUILD_TYPE" = 'sys'
      ,"NOTES"      = '(grbjava) Provides privileges to connect to EJBs from a Java stored procedure.'
 where "ROLENAME" = 'EJBCLIENT';

update "ODBCAPTURE"."ROLE_CONF"
  set  "BUILD_TYPE" = 'sys'
      ,"NOTES"      = '(grbjava) Grants permissions to run the Java debugger.'
 where "ROLENAME" = 'JAVADEBUGPRIV';

update "ODBCAPTURE"."ROLE_CONF"
  set  "BUILD_TYPE" = 'sys'
      ,"NOTES"      = '(grbjava) Deprecated'
 where "ROLENAME" = 'JAVAIDPRIV';

update "ODBCAPTURE"."ROLE_CONF"
  set  "BUILD_TYPE" = 'sys'
      ,"NOTES"      = '(grbjava) Grants permissions for Java administrators including updating JVM-protected packages. Granted the JAVAUSERPRIV role.'
 where "ROLENAME" = 'JAVASYSPRIV';

update "ODBCAPTURE"."ROLE_CONF"
  set  "BUILD_TYPE" = 'sys'
      ,"NOTES"      = '(grbjava) Grants permissions for Java users such as examining properties.'
 where "ROLENAME" = 'JAVAUSERPRIV';

update "ODBCAPTURE"."ROLE_CONF"
  set  "BUILD_TYPE" = 'sys'
      ,"NOTES"      = '(grbjava) Java administration privileges including permission to modify PolicyTable.'
 where "ROLENAME" = 'JAVA_ADMIN';

update "ODBCAPTURE"."ROLE_CONF"
  set  "BUILD_TYPE" = 'sys'
      ,"NOTES"      = '(grbjava) '
 where "ROLENAME" = 'JAVA_DEPLOY';

update "ODBCAPTURE"."ROLE_CONF"
  set  "BUILD_TYPE" = 'sys'
      ,"NOTES"      = '(grbjava) Provides permissions to start and maintain a JMX agent in a session. The procedure dbms_java.start_jmx_agent starts the agent in a specific session that generally remains active for the duration of the session.'
 where "ROLENAME" = 'JMXSERVER';

update "ODBCAPTURE"."ROLE_CONF"
  set  "BUILD_TYPE" = 'sys'
      ,"NOTES"      = '(grbsdo) Provides administrative privileges to manage the Catalog Services for the Web (CSW) component of Oracle Spatial.'
 where "ROLENAME" = 'SPATIAL_CSW_ADMIN';

update "ODBCAPTURE"."ROLE_CONF"
  set  "BUILD_TYPE" = 'sys'
      ,"NOTES"      = '(grbsdo) Provides administrative privileges to manage the Web Feature Service (WFS) component of Oracle Spatial.'
 where "ROLENAME" = 'SPATIAL_WFS_ADMIN';

update "ODBCAPTURE"."ROLE_CONF"
  set  "BUILD_TYPE" = 'sys'
      ,"NOTES"      = '(grbsdo) Provides user privileges for the Web Feature Service (WFS) component of Oracle Spatial.'
 where "ROLENAME" = 'WFS_USR_ROLE';

update "ODBCAPTURE"."ROLE_CONF"
  set  "BUILD_TYPE" = 'sys'
      ,"NOTES"      = '(grbxrep) Allows the grantee to register an XML schema globally, as opposed to registering it for use or access only by its owner. It also lets the grantee bypass access control list (ACL) checks when accessing Oracle XML DB Repository.'
 where "ROLENAME" = 'XDBADMIN';

update "ODBCAPTURE"."ROLE_CONF"
  set  "BUILD_TYPE" = 'sys'
      ,"NOTES"      = '(grbxrep) Allows the grantee to define invoker''s rights handlers and to create or update the resource configuration for XML repository triggers. By default, Oracle Database grants this role to the DBA role but not to the XDBADMIN role.'
 where "ROLENAME" = 'XDB_SET_INVOKER';

update "ODBCAPTURE"."ROLE_CONF"
  set  "BUILD_TYPE" = 'sys'
      ,"NOTES"      = '(grbxrep) Allows the grantee to access Oracle Database Web services over HTTPS. However, it does not provide the user access to objects in the database that are public. To allow public access, you need to grant the user the XDB_WEBSERVICES_WITH_PUBLIC role. For a user to use these Web services, SYS must enable the Web service servlets.'
 where "ROLENAME" = 'XDB_WEBSERVICES';

update "ODBCAPTURE"."ROLE_CONF"
  set  "BUILD_TYPE" = 'sys'
      ,"NOTES"      = '(grbxrep) Allows the grantee to access Oracle Database Web services over HTTP. However, it does not provide the user access to objects in the database that are public. To allow public access, you need to grant the user the XDB_WEBSERVICES_WITH_PUBLIC role.'
 where "ROLENAME" = 'XDB_WEBSERVICES_OVER_HTTP';

update "ODBCAPTURE"."ROLE_CONF"
  set  "BUILD_TYPE" = 'sys'
      ,"NOTES"      = '(grbxrep) Allows the grantee access to public objects through Oracle Database Web services.'
 where "ROLENAME" = 'XDB_WEBSERVICES_WITH_PUBLIC';

update "ODBCAPTURE"."ROLE_CONF"
  set  "BUILD_TYPE" = 'sys'
      ,"NOTES"      = '(grbras) The mid-tier cache. It is required for caching the security policy at the mid-tier level for the checkAcl (authorization) method of the XSAccessController class. Grant this role to the application connection user or the Real Application Security dispatcher.'
 where "ROLENAME" = 'XS_CACHE_ADMIN';

update "ODBCAPTURE"."ROLE_CONF"
  set  "BUILD_TYPE" = 'sys'
      ,"NOTES"      = '(grbras) '
 where "ROLENAME" = 'XS_CONNECT';

update "ODBCAPTURE"."ROLE_CONF"
  set  "BUILD_TYPE" = 'sys'
      ,"NOTES"      = '(grbras) In Oracle Database Real Application Security, enables the grantee to manage and manipulate the namespace and attribute for a session. Grant this role to the Real Application Security session user.'
 where "ROLENAME" = 'XS_NAMESPACE_ADMIN';

update "ODBCAPTURE"."ROLE_CONF"
  set  "BUILD_TYPE" = 'sys'
      ,"NOTES"      = '(grbras) '
 where "ROLENAME" = 'XS_RESOURCE';

update "ODBCAPTURE"."ROLE_CONF"
  set  "BUILD_TYPE" = 'sys'
      ,"NOTES"      = '(grbras) In Oracle Database Real Application Security, enables the grantee to manage the life cycle of a session, including the ability to create, attach, detach, and destroy the session. Grant this role to the application connection user or Real Application Security dispatcher.'
 where "ROLENAME" = 'XS_SESSION_ADMIN';

-- SCHEMA_CONF

delete from "ODBCAPTURE"."SCHEMA_CONF" where "USERNAME" = 'ODBCapture';

update "ODBCAPTURE"."SCHEMA_CONF" set "NOTES" = '(grbxrep) XDB - XML Database Repository (XDB,ANONYMOUS)' where "USERNAME" = 'ANONYMOUS';
update "ODBCAPTURE"."SCHEMA_CONF" set "NOTES" = '(grbsdo) SDO,LCTR - Spatial - Oracle Locator (MDSYS, MDDATA)' where "USERNAME" = 'MDDATA';
update "ODBCAPTURE"."SCHEMA_CONF" set "NOTES" = '(grbsdo) SDO,LCTR - Spatial - Oracle Locator (MDSYS, MDDATA)' where "USERNAME" = 'MDSYS';
update "ODBCAPTURE"."SCHEMA_CONF" set "NOTES" = '(grbjava) JAVAVM,CATJAVA,XML - JServer JAVA Virtual Machine, Oracle Database Java Packages (OJVMSYS), Oracle XDK' where "USERNAME" = 'OJVMSYS';
update "ODBCAPTURE"."SCHEMA_CONF" set "NOTES" = '(grbxrep) XDB - XML Database Repository (XDB,ANONYMOUS)' where "USERNAME" = 'XDB';
update "ODBCAPTURE"."SCHEMA_CONF" set "NOTES" = '(grbras) RAS - Real Application Security NULL Login' where "USERNAME" = 'XS$NULL';
