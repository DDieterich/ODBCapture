OPTIONS (SKIP=1)
LOAD DATA
APPEND INTO TABLE "ODBCAPTURE"."ELEMENT_CONF"
FIELDS CSV WITH EMBEDDED
TRAILING NULLCOLS
   (ELEMENT_SEQ                    FLOAT EXTERNAL
   ,ELEMENT_NAME                   CHAR(20)
   ,FILE_EXT1                      CHAR(6)
   ,FILE_EXT2                      CHAR(6)
   ,FILE_EXT3                      CHAR(6)
   ,OBJECT_TYPE                    CHAR(30)
   ,NAME_CHECK_OBJECT_TYPE         CHAR(30)
   ,NOTES                          CHAR(1024)
   ,PRE_COMPILE                    CHAR(1)
   )
