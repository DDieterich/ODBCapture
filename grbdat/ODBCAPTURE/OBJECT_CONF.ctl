OPTIONS (SKIP=1)
LOAD DATA
APPEND INTO TABLE "ODBCAPTURE"."OBJECT_CONF"
FIELDS CSV WITH EMBEDDED
TRAILING NULLCOLS
   (USERNAME                       CHAR(128)
   ,ELEMENT_NAME                   CHAR(20)
   ,BUILD_TYPE                     CHAR(10)
   ,OBJECT_NAME_REGEXP             CHAR(4000)
   ,NOTES                          CHAR(1024)
   )
