
--
--  grbsdo Installation Script
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
--  Create ODBCAPTURE.GRAB_SDO Package
--



--DBMS_METADATA:ODBCAPTURE.GRAB_SDO

  CREATE OR REPLACE EDITIONABLE PACKAGE "ODBCAPTURE"."GRAB_SDO" AUTHID DEFINER
as

   sdo_elem_info_buff   sdo_elem_info_array;
   sdo_geometry_buff    sdo_geometry;
   sdo_ordinate_buff    sdo_ordinate_array;
   sdo_point_buff       sdo_point_type;
   st_geometry_buff     st_geometry;

   function sql_sdo_dim_element
      (in_de  in  sdo_dim_element)
   return varchar2;

   function sql_sdo_dim_array
      (in_da      in  sdo_dim_array
      ,in_spaces  in  varchar2 default '')
   return varchar2;

   function ctl_sdo_point_type
      (in_spaces  in  varchar2 default '   ')
   return varchar2;
   function dat_sdo_point_type
      (in_pt  in  sdo_point_type)
   return varchar2;

   function ctl_sdo_elem_info_array
   return varchar2;
   function dat_sdo_elem_info_array
      (in_eia  in  sdo_elem_info_array)
   return varchar2;

   function ctl_sdo_ordinate_array
   return varchar2;
   function dat_sdo_ordinate_array
      (in_oa  in  sdo_ordinate_array)
   return varchar2;

   function ctl_sdo_geometry
      (in_spaces  in  varchar2 default '   ')
   return varchar2;
   function dat_sdo_geometry
      (in_geo  in  sdo_geometry)
   return varchar2;

   function ctl_st_geometry
      (in_spaces  in  varchar2 default '   ')
   return varchar2;
   function dat_st_geometry
      (in_geo  in  st_geometry)
   return varchar2;

   procedure grb_ind
      (in_table_owner  in varchar2
      ,in_table_name   in varchar2
      ,in_table_type   in varchar2
      ,in_index_owner  in varchar2
      ,in_index_name   in varchar2
      ,in_index_ext    in varchar2
      ,in_ityp_owner   in varchar2
      ,in_ityp_name    in varchar2);

   procedure grb_cldr_define
      (in_dyn_curs  in            integer
      ,in_position  in            integer
      ,io_lc        in out nocopy varchar2
      ,io_fh        in out nocopy fh2.sf_ptr_type
      ,io_desc_tab3 in out nocopy dbms_sql.desc_tab3);

   procedure grb_cldr_value
      (in_dyn_curs  in            integer
      ,in_position  in            integer
      ,io_lc        in out nocopy varchar2
      ,io_fh        in out nocopy fh2.sf_ptr_type
      ,io_desc_tab3 in out nocopy dbms_sql.desc_tab3);

end grab_sdo;
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
-- PACKAGE BODY Install


--
--  Create ODBCAPTURE.GRAB_SDO Package Body
--



--DBMS_METADATA:ODBCAPTURE.GRAB_SDO

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "ODBCAPTURE"."GRAB_SDO" as


------------------------------------------------------------
-- Report the SQL Script Values of the SDO DIM Element
function sql_sdo_dim_element
      (in_de  in  sdo_dim_element)
   return varchar2
as
begin
   return 'sdo_dim_element(''' ||             in_de.sdo_dimname            ||
                        ''', ' || nvl(to_char(in_de.sdo_lb       ),'NULL') ||
                          ', ' || nvl(to_char(in_de.sdo_ub       ),'NULL') ||
                          ', ' || nvl(to_char(in_de.sdo_tolerance),'NULL') ||
                           ')' ;
end sql_sdo_dim_element;


------------------------------------------------------------
-- Report the SQL Script Values of the SDO DIM Array
function sql_sdo_dim_array
      (in_da      in  sdo_dim_array
      ,in_spaces  in  varchar2 default '')
   return varchar2
as
   ret_txt  varchar2(32767);
begin
   if in_da.EXISTS(1)
   then
      ret_txt := 'sdo_dim_array(' || grab_sdo.sql_sdo_dim_element(in_da(1));
      for i in 2 .. in_da.COUNT
      loop
         ret_txt := ret_txt || CHR(10) || in_spaces ||
                    '             ,' || grab_sdo.sql_sdo_dim_element(in_da(i));
      end loop;
      ret_txt := ret_txt || CHR(10) || in_spaces ||
                 '             )';
   end if;
   return ret_txt;
end sql_sdo_dim_array;


------------------------------------------------------------
-- Report the Control File Specification of the SDO POINT
function ctl_sdo_point_type
      (in_spaces  in  varchar2 default '   ')
   return varchar2
as
begin
    return 'COLUMN OBJECT TREAT AS SDO_POINT_TYPE'      || CHR(10) || in_spaces ||
           '   (X   FLOAT EXTERNAL TERMINATED BY '';''' || CHR(10) || in_spaces ||
           '   ,Y   FLOAT EXTERNAL TERMINATED BY '';''' || CHR(10) || in_spaces ||
           '   ,Z   FLOAT EXTERNAL TERMINATED BY '';''' || CHR(10) || in_spaces ||
           '   )';
end ctl_sdo_point_type;


------------------------------------------------------------
-- Report the Data Contents of the SDO POINT
function dat_sdo_point_type
      (in_pt  in  sdo_point_type)
   return varchar2
as
begin
    return to_char(in_pt.x) || ';' ||
           to_char(in_pt.y) || ';' ||
           to_char(in_pt.z) || ';' ;
end dat_sdo_point_type;


------------------------------------------------------------
-- Report the Control File Specification of the SDO_ELEM_INFO_ARRAY
function ctl_sdo_elem_info_array
   return varchar2
as
   delim  varchar2(1);
begin
   grab_scripts.grb_cldr_array_lvl := grab_scripts.grb_cldr_array_lvl + 1;
   delim                           := grab_scripts.grb_cldr_delim_nt(grab_scripts.grb_cldr_array_lvl);
   return 'VARRAY TERMINATED BY ''' || delim || ''' (SDO_ELEM_INFO_ARRAY  FLOAT EXTERNAL TERMINATED BY '';'')';
end ctl_sdo_elem_info_array;


------------------------------------------------------------
-- Report the Data Contents of the SDO_ELEM_INFO_ARRAY
function dat_sdo_elem_info_array
      (in_eia  in  sdo_elem_info_array)
   return varchar2
as
   delim     varchar2(1);
   ret_txt   varchar2(32767);
begin
   grab_scripts.grb_cldr_array_lvl := grab_scripts.grb_cldr_array_lvl + 1;
   delim                           := grab_scripts.grb_cldr_delim_nt(grab_scripts.grb_cldr_array_lvl);
   if in_eia.EXISTS(1)
   then
      ret_txt := to_char(in_eia(1));
      for i in 2 .. in_eia.COUNT
      loop
         ret_txt := ret_txt || ';' || to_char(in_eia(i));
      end loop;
   else
      ret_txt := '';
   end if;
   return ret_txt || delim;
end dat_sdo_elem_info_array;


------------------------------------------------------------
-- Report the Control File Specification of the SDO_ORDINATE_ARRAY
function ctl_sdo_ordinate_array
   return varchar2
as
   delim  varchar2(1);
begin
   grab_scripts.grb_cldr_array_lvl := grab_scripts.grb_cldr_array_lvl + 1;
   delim                           := grab_scripts.grb_cldr_delim_nt(grab_scripts.grb_cldr_array_lvl);
   return 'VARRAY TERMINATED BY ''' || delim || ''' (SDO_ORDINATE_ARRAY  FLOAT EXTERNAL TERMINATED BY '';'')';
end ctl_sdo_ordinate_array;


------------------------------------------------------------
-- Report the Data Contents of the SDO_ORDINATE_ARRAY
function dat_sdo_ordinate_array
      (in_oa  in  sdo_ordinate_array)
   return varchar2
as
   delim     varchar2(1);
   ret_txt   varchar2(32767);
begin
   grab_scripts.grb_cldr_array_lvl := grab_scripts.grb_cldr_array_lvl + 1;
   delim                           := grab_scripts.grb_cldr_delim_nt(grab_scripts.grb_cldr_array_lvl);
   if in_oa.EXISTS(1)
   then
      ret_txt := to_char(in_oa(1));
      for i in 2 .. in_oa.COUNT
      loop
         ret_txt := ret_txt || ';' || to_char(in_oa(i));
      end loop;
   else
      ret_txt := '';
   end if;
   return ret_txt || delim;
end dat_sdo_ordinate_array;


------------------------------------------------------------
-- Report the Control File Specification of the SDO_GEOMETRY
function ctl_sdo_geometry
      (in_spaces  in  varchar2 default '   ')
   return varchar2
as
begin
   return 'COLUMN OBJECT TREAT AS SDO_GEOMETRY'                                 || CHR(10) || in_spaces ||
          '   (SDO_GTYPE     FLOAT EXTERNAL TERMINATED BY '';'''                || CHR(10) || in_spaces ||
          '   ,SDO_SRID      FLOAT EXTERNAL TERMINATED BY '';'''                || CHR(10) || in_spaces ||
          '   ,SDO_POINT     ' || grab_sdo.ctl_sdo_point_type(in_spaces||'   ') || CHR(10) || in_spaces ||
          '   ,SDO_ELEM_INFO ' || grab_sdo.ctl_sdo_elem_info_array              || CHR(10) || in_spaces ||
          '   ,SDO_ORDINATES ' || grab_sdo.ctl_sdo_ordinate_array               || CHR(10) || in_spaces ||
          '   )';
end ctl_sdo_geometry;


------------------------------------------------------------
-- Report the Data Contents of the SDO_GEOMETRY
function dat_sdo_geometry
      (in_geo  in  sdo_geometry)
   return varchar2
as
begin
   return to_char(in_geo.sdo_gtype)                              || ';' ||
          to_char(in_geo.sdo_srid)                               || ';' ||
          grab_sdo.dat_sdo_point_type(in_geo.sdo_point)          ||
          grab_sdo.dat_sdo_elem_info_array(in_geo.sdo_elem_info) ||
          grab_sdo.dat_sdo_ordinate_array(in_geo.sdo_ordinates)  ;
end dat_sdo_geometry;


------------------------------------------------------------
-- Report the Control File Specification of the SDO_GEOMETRY
function ctl_st_geometry
      (in_spaces  in  varchar2 default '   ')
   return varchar2
as
begin
   return 'COLUMN OBJECT TREAT AS ST_GEOMETRY'                         || CHR(10) || in_spaces ||
          '   (GEOM   ' || grab_sdo.ctl_sdo_geometry(in_spaces||'   ') || CHR(10) || in_spaces ||
          '   )';
end ctl_st_geometry;


------------------------------------------------------------
-- Report the Data Contents of the SDO_GEOMETRY
function dat_st_geometry
      (in_geo  in  st_geometry)
   return varchar2
as
begin
   return grab_sdo.dat_sdo_geometry(in_geo.geom);
end dat_st_geometry;


------------------------------------------------------------
-- Report the Data Contents of the SDO_GEOMETRY
procedure grb_ind
      (in_table_owner  in varchar2
      ,in_table_name   in varchar2
      ,in_table_type   in varchar2
      ,in_index_owner  in varchar2
      ,in_index_name   in varchar2
      ,in_index_ext    in varchar2
      ,in_ityp_owner   in varchar2
      ,in_ityp_name    in varchar2)
is
   fh                fh2.sf_ptr_type;  -- Domain Index file handler
   old_schema_name   varchar2(1000) := grab_scripts.g_schema_name;
   ----------------------------------------
   procedure l_close_file as
      l_file_name  varchar2(1000) :=
                   fh2.sf_aa(fh.bld_type)(fh.bld_ord)(fh.file_id).filename;
   begin
      --
      fh2.script_put_line(fh, '');
      fh2.script_put_line(fh, 'set define on');
      fh2.script_close(fh);
      --
      grab_scripts.g_schema_name  := '';
      fh := fh2.script_open(in_filename     => 'odbcapture_installation_logs.csv'
                           ,in_elmnt        => 'INSTALL_SCRIPT'
                           ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
      grab_scripts.g_schema_name  := old_schema_name;
      --
      fh2.script_put_line(fh, '"' || grab_scripts.g_build_type ||
                            '","' || l_file_name || '.log"' );
      fh2.script_close(fh);
      --
   end l_close_file;
begin
   dbms_output.put_line(in_table_owner || ', ' ||
                        in_table_name  || ', ' ||
                        in_table_type  || ', ' ||
                        in_index_owner || ', ' ||
                        in_index_name  || ', ' ||
                        in_index_ext   );
   --
   grab_scripts.g_schema_name  := '';
   fh := fh2.script_open(in_filename     => replace(replace(in_index_name ,'$','_'),'%','_')
                                                   || '.' || in_index_ext
                               ,in_elmnt        => 'INSTALL_SCRIPT'
                               ,in_max_linesize => common_util.MAXIMUM_SQL_LENGTH);
   grab_scripts.g_schema_name  := old_schema_name;
   --
   fh2.script_put_line(fh, '');
   fh2.script_put_line(fh, '--');
   fh2.script_put_line(fh, '--  Create Indexes for ' || in_table_owner ||
                                                        '.' || in_table_name  ||
                                                        ' ' || in_table_type  );
   fh2.script_put_line(fh, '--');
   fh2.script_put_line(fh, '');
   fh2.script_put_line(fh, 'set define off');
   fh2.script_put_line(fh, '');
   for buf1 in (select column_name from dba_ind_columns
                 where table_owner = grab_scripts.g_schema_name
                  and  table_name  = in_table_name
                  and  index_owner = in_index_owner
                  and  index_name  = in_index_name
                 order by column_position )
   loop
      for buf2 in (select diminfo, srid
                    from  MDSYS.all_sdo_geom_metadata
                    where owner       = grab_scripts.g_schema_name
                     and  table_name  = in_table_name
                     and  column_name = buf1.column_name)
      loop
         fh2.script_put_line(fh, '----------------------------------------');
         fh2.script_put_line(fh, 'prompt');
         fh2.script_put_line(fh, 'prompt MUST be run as ' || grab_scripts.g_schema_name);
         fh2.script_put_line(fh, 'insert into MDSYS.user_sdo_geom_metadata');
         fh2.script_put_line(fh, '      (table_name');
         fh2.script_put_line(fh, '      ,column_name');
         fh2.script_put_line(fh, '      ,diminfo');
         fh2.script_put_line(fh, '      ,srid)');
         fh2.script_put_line(fh, '   values');
         fh2.script_put_line(fh, '      (''' || in_table_name  || '''');
         fh2.script_put_line(fh, '      ,''' || buf1.column_name || '''');
         fh2.script_put_line(fh, '      ,' || grab_sdo.sql_sdo_dim_array(buf2.diminfo, '       '));
         fh2.script_put_line(fh, '      ,' || nvl(to_char(buf2.srid),'NULL'));
         fh2.script_put_line(fh, '      );');
         fh2.script_put_line(fh, '');
      end loop;
      fh2.script_put_line(fh, 'CREATE INDEX "' || in_index_owner || '"."' || in_index_name || '"' || CHR(10) ||
                                     '   ON "' || in_table_owner || '"."' || in_table_name || '" ("' || buf1.column_name || '")' || CHR(10) ||
                                     '   INDEXTYPE IS "' || in_ityp_owner || '"."' || in_ityp_name || '";');
      fh2.script_put_line(fh, '');
   end loop;
   --
   --fh2.script_put_line(fh, '--DBMS_METADATA:' || in_index_owner ||
   --                                              '.' || in_index_name);
   --fh2.put_big_line(fh, grab_scripts.g_schema_name || '.' || in_table_name || ' ' || in_table_type
   --                ,dbms_metadata.get_ddl(object_type => 'INDEX'
   --                                      ,name        => in_index_name
   --                                      ,schema      => in_index_owner)
   --                ,common_util.MAXIMUM_SQL_LENGTH);
   --
   l_close_file;
end grb_ind;


------------------------------------------------------------
-- Define Dynamic SQL Column
procedure grb_cldr_define
      (in_dyn_curs  in            integer
      ,in_position  in            integer
      ,io_lc        in out nocopy varchar2
      ,io_fh        in out nocopy fh2.sf_ptr_type
      ,io_desc_tab3 in out nocopy dbms_sql.desc_tab3)
is
begin
   case
      when io_desc_tab3(in_position).col_type_name = 'SDO_ELEM_INFO_ARRAY'
      then
         fh2.script_put_line(io_fh, io_lc || common_util.old_rpad(io_desc_tab3(in_position).col_name,30) ||
                 ' ' || ctl_sdo_elem_info_array );
         dbms_sql.define_column(c         => in_dyn_curs
                               ,position  => in_position
                               ,column    => sdo_elem_info_buff);
         --
      when io_desc_tab3(in_position).col_type_name = 'SDO_GEOMETRY'
      then
         fh2.script_put_line(io_fh, io_lc || common_util.old_rpad(io_desc_tab3(in_position).col_name,30) ||
                 ' ' || ctl_sdo_geometry );
         dbms_sql.define_column(c         => in_dyn_curs
                               ,position  => in_position
                               ,column    => sdo_geometry_buff);
         --
      when io_desc_tab3(in_position).col_type_name = 'SDO_ORDINATE_ARRAY'
      then
         fh2.script_put_line(io_fh, io_lc || common_util.old_rpad(io_desc_tab3(in_position).col_name,30) ||
                 ' ' || ctl_sdo_ordinate_array );
         dbms_sql.define_column(c         => in_dyn_curs
                               ,position  => in_position
                               ,column    => sdo_ordinate_buff);
         --
      when io_desc_tab3(in_position).col_type_name = 'SDO_POINT_TYPE'
      then
         fh2.script_put_line(io_fh, io_lc || common_util.old_rpad(io_desc_tab3(in_position).col_name,30) ||
                 ' ' || ctl_sdo_point_type );
         dbms_sql.define_column(c         => in_dyn_curs
                               ,position  => in_position
                               ,column    => sdo_point_buff);
         --
      when io_desc_tab3(in_position).col_type_name = 'ST_GEOMETRY'
      then
         fh2.script_put_line(io_fh, io_lc || common_util.old_rpad(io_desc_tab3(in_position).col_name,30) ||
                 ' ' || ctl_st_geometry );
         dbms_sql.define_column(c         => in_dyn_curs
                               ,position  => in_position
                               ,column    => st_geometry_buff);
         --
      else
         raise_application_error(-20000, 'Bad Column Type "' || io_desc_tab3(in_position).col_type ||
                                                     '" in io_desc_tab3(' || in_position || ').col_type');
   end case;
end grb_cldr_define;


------------------------------------------------------------
-- Value from Dynamic SQL Column
procedure grb_cldr_value
      (in_dyn_curs  in            integer
      ,in_position  in            integer
      ,io_lc        in out nocopy varchar2
      ,io_fh        in out nocopy fh2.sf_ptr_type
      ,io_desc_tab3 in out nocopy dbms_sql.desc_tab3)
is
begin
   case
      when io_desc_tab3(in_position).col_type_name = 'SDO_ELEM_INFO_ARRAY'
      then
         dbms_sql.column_value(c         => in_dyn_curs
                              ,position  => in_position
                              ,value     => sdo_elem_info_buff);
         fh2.script_put(io_fh, io_lc || grab_sdo.dat_sdo_elem_info_array(sdo_elem_info_buff));
         --
      when io_desc_tab3(in_position).col_type_name = 'SDO_GEOMETRY'
      then
         dbms_sql.column_value(c         => in_dyn_curs
                              ,position  => in_position
                              ,value     => sdo_geometry_buff);
         fh2.script_put(io_fh, io_lc || grab_sdo.dat_sdo_geometry(sdo_geometry_buff));
         --
      when io_desc_tab3(in_position).col_type_name = 'SDO_ORDINATE_ARRAY'
      then
         dbms_sql.column_value(c         => in_dyn_curs
                              ,position  => in_position
                              ,value     => sdo_ordinate_buff);
         fh2.script_put(io_fh, io_lc || grab_sdo.dat_sdo_ordinate_array(sdo_ordinate_buff));
         --
      when io_desc_tab3(in_position).col_type_name = 'SDO_POINT_TYPE'
      then
         dbms_sql.column_value(c         => in_dyn_curs
                              ,position  => in_position
                              ,value     => sdo_point_buff);
         fh2.script_put(io_fh, io_lc || grab_sdo.dat_sdo_point_type(sdo_point_buff));
         --
      when io_desc_tab3(in_position).col_type_name = 'ST_GEOMETRY'
      then
         dbms_sql.column_value(c         => in_dyn_curs
                              ,position  => in_position
                              ,value     => st_geometry_buff);
         fh2.script_put(io_fh, io_lc || grab_sdo.dat_st_geometry(st_geometry_buff));
         --
      else
         raise_application_error(-20000, 'Bad Column Type "' || io_desc_tab3(in_position).col_type ||
                                                     '" in io_desc_tab3(' || in_position || ').col_type');
   end case;
end grb_cldr_value;


end grab_sdo;
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





