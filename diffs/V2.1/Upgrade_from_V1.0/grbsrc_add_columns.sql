
alter table "ODBCAPTURE_INSTALLATION_LOGS" add "CAPVER" varchar2(20);
comment on column "ODBCAPTURE_INSTALLATION_LOGS"."CAPVER" is 'ODBCapture Source Code Version.';

alter table "ODBCAPTURE"."DLOAD_CONF" add "LOADING_METHOD" varchar2(50);
comment on column "ODBCAPTURE"."DLOAD_CONF"."LOADING_METHOD" is 'Loading Method for SQL*Loader (Optional): INSERT, APPEND (Default), REPLACE, or TRUNCATE. Can also include "WHEN" clause.';

alter table "ODBCAPTURE"."ELEMENT_CONF" add "PRE_COMPILE" varchar2(1);
comment on column "ODBCAPTURE"."ELEMENT_CONF"."PRE_COMPILE" is '"Y" - Object Type must be Compiled before proceeding. (Optional)';

alter table "ODBCAPTURE"."OBJ_INSTALL_DATA_LOAD_TAB" add "OBJECT_TABLE_TYPE" varchar2(128);
alter table "ODBCAPTURE"."OBJ_INSTALL_DATA_LOAD_TAB" add "LOADING_METHOD" varchar2(50);
