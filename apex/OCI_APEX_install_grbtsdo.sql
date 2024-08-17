
--
--  SYS Installation Script
--
--  Must be run as SYS
--



----------------------------------------



--
--  SYSTEM Installation Script
--
--  Must be run as SYSTEM
--



----------------------------------------



--
--  grbtsdo Installation Script
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
-- TABLE Install


--
--  Create ODBCTEST.SDO_COLA_MARKETS Table
--



--DBMS_METADATA:ODBCTEST.SDO_COLA_MARKETS

  CREATE TABLE "ODBCTEST"."SDO_COLA_MARKETS" 
   (	"MKT_ID" NUMBER, 
	"NAME" VARCHAR2(32 BYTE), 
	"SHAPE" "ST_GEOMETRY"
   ) SEGMENT CREATION IMMEDIATE  LOGGING
 VARRAY "SHAPE"."GEOM"."SDO_ELEM_INFO" STORE AS SECUREFILE LOB 
 VARRAY "SHAPE"."GEOM"."SDO_ORDINATES" STORE AS SECUREFILE LOB ;
ALTER TABLE "ODBCTEST"."SDO_COLA_MARKETS" ADD PRIMARY KEY ("MKT_ID")
  USING INDEX  ENABLE;

--  Comments

--DBMS_METADATA:ODBCTEST.SDO_COLA_MARKETS


--  Grants


--  Synonyms



----------------------------------------
-- DATA_LOAD Install


------------------------------------------------------------
NOTE: DATA LOADING for "ODBCTEST/SDO_COLA_MARKETS.cldr" NOT IMPLEMENTED
------------------------------------------------------------


----------------------------------------
-- INDEX Install


--
--  Create Indexes for ODBCTEST.SDO_COLA_MARKETS TABLE
--



--  NOTE: This is a "TARGET" Index

-- The MDSYS Domain Index "ODBCTEST"."COLA_SPATIAL_IDX
--   installation script is located in the "root" folder because
--   it must be executed using the "ODBCTEST" database login.



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





