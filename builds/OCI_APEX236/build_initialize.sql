
--
--  Initialize Database for Build
--

-- Not Supported by APEX Service/Instance
--WHENEVER SQLERROR EXIT SQL.SQLCODE
--WHENEVER OSERROR EXIT
--set linesize 2499
--set trimspool on
--set termout on

set verify off
set echo off
set timing on

----------------------------------------
prompt
select username from dba_users where username in ('ODBCAPTURE', 'ODBCTEST');

----------------------------------------
prompt
prompt Drop Index COLA_SPATIAL_IDX
begin
   execute immediate 'drop index "ODBCTEST"."COLA_SPATIAL_IDX"';
exception when others then
   dbms_output.put_line(SQLERRM);
end;
/

delete from MDSYS.user_sdo_geom_metadata
 where table_name  = 'SDO_COLA_MARKETS'
  and  column_name = 'SHAPE';

----------------------------------------
prompt
prompt Drop Principal Roles
DECLARE
   TYPE vs_nt_type is table of varchar2(128);
   vs_nt  vs_nt_type :=
          vs_nt_type('"GRB_TEST_USER_02"','"GRB_TEST_USER_01"','"GRB_TEST_ROLE_01"');
BEGIN
   for i in 1 .. vs_nt.COUNT
   loop
      begin
         dbms_output.put_line('xs_principal.delete_principal ' || vs_nt(i));
         xs_principal.delete_principal(vs_nt(i), XS_ADMIN_UTIL.CASCADE_OPTION);
      exception when others then
         dbms_output.put_line(SQLERRM);
      end;
   end loop;
END;
/

----------------------------------------
prompt
prompt Drop Schema
declare
   sql_txt    varchar2(200);
begin
   for buff in (select username from dba_users
                 where username in ('ODBCAPTURE', 'ODBCTEST'))
   loop
      dbms_output.put_line('-- ' || to_char(sysdate,'YYYY-MM-DD HH24:MI:SS') || ' --');
      sql_txt := 'drop user "' || buff.username || '" cascade';
      dbms_output.put_line(sql_txt);
      begin
         execute immediate sql_txt;
      exception when others then
         dbms_output.put_line(SQLERRM);
      end;
   end loop;
end;
/

----------------------------------------
prompt
prompt Drop Role
declare
   sql_txt    varchar2(200);
begin
   for buff in (select role from dba_roles
                 where role in ('GRB_TEST_ROLE'))
   loop
      dbms_output.put_line('-- ' || to_char(sysdate,'YYYY-MM-DD HH24:MI:SS') || ' --');
      sql_txt := 'drop role "' || buff.role || '"';
      dbms_output.put_line(sql_txt);
      begin
         execute immediate sql_txt;
      exception when others then
         dbms_output.put_line(SQLERRM);
      end;
   end loop;
end;
/
