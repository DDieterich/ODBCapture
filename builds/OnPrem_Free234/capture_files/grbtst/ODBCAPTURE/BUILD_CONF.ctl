OPTIONS (SKIP=1)
LOAD DATA
APPEND INTO TABLE "ODBCAPTURE"."BUILD_CONF"
FIELDS CSV WITH EMBEDDED
TRAILING NULLCOLS
   (BUILD_SEQ                      FLOAT EXTERNAL
   ,BUILD_TYPE                     CHAR(10)
   ,NOTES                          CHAR(1024)
   )
