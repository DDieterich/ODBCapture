OPTIONS (SKIP=1)
LOAD DATA
APPEND INTO TABLE "ODBCAPTURE"."ROLE_CONF"
FIELDS CSV WITH EMBEDDED
TRAILING NULLCOLS
   (ROLENAME                       CHAR(128)
   ,BUILD_TYPE                     CHAR(10)
   ,ORACLE_PROVIDED                CHAR(1)
   ,NOTES                          CHAR(1024)
   )
