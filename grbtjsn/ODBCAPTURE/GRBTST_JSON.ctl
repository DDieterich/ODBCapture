OPTIONS (SKIP=1)
LOAD DATA
APPEND INTO TABLE "ODBCAPTURE"."GRBTST_JSON"
FIELDS CSV WITH EMBEDDED
TRAILING NULLCOLS
   (ID                             FLOAT EXTERNAL
   ,JSON_DATA                      CHAR(1048576)
   )
