OPTIONS (SKIP=1)
LOAD DATA
APPEND INTO TABLE "ODBCTEST"."CUST_CTX_TEST"
FIELDS CSV WITH EMBEDDED
TRAILING NULLCOLS
   (CUST_ID                        FLOAT EXTERNAL
   ,CUST_NAME                      CHAR(80)
   ,CREATE_DATE                    DATE 'DD-MON-YYYY HH24:MI:SS'
   )
