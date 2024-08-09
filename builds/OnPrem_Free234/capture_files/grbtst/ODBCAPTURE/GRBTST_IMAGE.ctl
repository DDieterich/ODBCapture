OPTIONS (SKIP=1)
LOAD DATA
APPEND INTO TABLE "ODBCAPTURE"."GRBTST_IMAGE"
FIELDS CSV WITH EMBEDDED
TRAILING NULLCOLS
   (ID                             FLOAT EXTERNAL
      -- BLOB data must be decoded from Base64 after loading
   ,IMAGE                          CHAR(1572864)
   )
