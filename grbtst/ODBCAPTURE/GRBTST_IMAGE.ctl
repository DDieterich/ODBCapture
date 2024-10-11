OPTIONS (SKIP=1)
LOAD DATA
INTO TABLE "ODBCAPTURE"."GRBTST_IMAGE"
APPEND
FIELDS CSV WITH EMBEDDED
TRAILING NULLCOLS
   (ID                             FLOAT EXTERNAL
      -- BLOB data must be decoded from Base64 after loading
   ,IMAGE                          CHAR(1572864)
   )
