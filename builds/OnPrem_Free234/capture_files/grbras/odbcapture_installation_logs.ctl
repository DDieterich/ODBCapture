LOAD DATA
APPEND INTO TABLE "ODBCAPTURE_INSTALLATION_LOGS"
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
   (LOAD_DTM          SYSDATE
   ,BUILD_TYPE        char(10)
   ,FILE_NAME         char(512)
   ,CONTENTS          LOBFILE(FILE_NAME) TERMINATED BY EOF
   )
