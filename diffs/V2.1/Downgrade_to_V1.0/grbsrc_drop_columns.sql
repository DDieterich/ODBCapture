
alter table "ODBCAPTURE_INSTALLATION_LOGS" drop column "CAPVER";

alter table "ODBCAPTURE"."DATA_LOAD" drop column "LOADING_METHOD";

alter table "ODBCAPTURE"."ELEMENT_CONF" drop column "PRE_COMPILE";

alter table "ODBCAPTURE"."OBJ_INSTALL_DATA_LOAD_TAB" drop column "OBJECT_TABLE_TYPE";
alter table "ODBCAPTURE"."OBJ_INSTALL_DATA_LOAD_TAB" drop column "LOADING_METHOD";
