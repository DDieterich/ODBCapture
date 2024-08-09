OPTIONS (SKIP=1)
LOAD DATA
APPEND INTO TABLE "ODBCTEST"."SDO_COLA_MARKETS"
FIELDS CSV WITH EMBEDDED
TRAILING NULLCOLS
   (MKT_ID                         FLOAT EXTERNAL
   ,NAME                           CHAR(32)
   ,SHAPE                          COLUMN OBJECT TREAT AS ST_GEOMETRY
      (GEOM   COLUMN OBJECT TREAT AS SDO_GEOMETRY
         (SDO_GTYPE     FLOAT EXTERNAL TERMINATED BY ';'
         ,SDO_SRID      FLOAT EXTERNAL TERMINATED BY ';'
         ,SDO_POINT     COLUMN OBJECT TREAT AS SDO_POINT_TYPE
            (X   FLOAT EXTERNAL TERMINATED BY ';'
            ,Y   FLOAT EXTERNAL TERMINATED BY ';'
            ,Z   FLOAT EXTERNAL TERMINATED BY ';'
            )
         ,SDO_ELEM_INFO VARRAY TERMINATED BY '' (SDO_ELEM_INFO_ARRAY  FLOAT EXTERNAL TERMINATED BY ';')
         ,SDO_ORDINATES VARRAY TERMINATED BY '' (SDO_ORDINATE_ARRAY  FLOAT EXTERNAL TERMINATED BY ';')
         )
      )
   )
