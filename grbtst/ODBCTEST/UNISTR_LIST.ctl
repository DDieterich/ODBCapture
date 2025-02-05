OPTIONS (SKIP=1)
LOAD DATA
INTO TABLE "ODBCTEST"."UNISTR_LIST"
APPEND
FIELDS CSV WITH EMBEDDED
TRAILING NULLCOLS
   (UNISTR_CHR                     CHAR(20) "UNISTR(to_char(:UNISTR_CHR))"
   ,UNISTR_TXT                     CHAR(20)
   ,HTML_ENTITY                    CHAR(20)
   ,NOTES                          CHAR(100)
   )
