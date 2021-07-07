SELECT A1.TABLE_NAME as "테이블ID"

     , A1.TABLE_COMMENTS as "테이블명"

     , A1.COLUMN_COMMENTS as "컬럼명"

     , A1.COLUMN_NAME as "컬럼ID"

     , A1.DATA_TYPE || A1.DATA_LENGTH as "타입 및 길이"

     , CASE WHEN A1.NULL_FLAG = 'Y' THEN 'NULL'

            ELSE 'NOT NULL' END as "NULL"

     , CASE WHEN B1.CONSTRAINT_TYPE = 'P' THEN 'Yes'

            ELSE 'No' END as "PK"

     , CASE WHEN B1.CONSTRAINT_TYPE = 'R'THEN 'Yes'

            ELSE 'No' END as "FK"

  FROM (SELECT B.COMMENTS TABLE_COMMENTS

             , A.TABLE_NAME TABLE_NAME

             , C.COMMENTS COLUMN_COMMENTS

             , A.COLUMN_NAME COLUMN_NAME

             , (CASE A.NULLABLE

                   WHEN 'Y'

                      THEN 'Y'

                END) NULL_FLAG

             , A.DATA_TYPE DATA_TYPE

             , (CASE

                   WHEN A.DATA_TYPE IN ('CHAR', 'VARCHAR2')

                      THEN '(' || A.DATA_LENGTH || ')'

                   WHEN A.DATA_TYPE = 'NUMBER'

                   AND A.DATA_SCALE = 0

                   AND A.DATA_PRECISION IS NOT NULL

                      THEN '(' || A.DATA_PRECISION || ')'

                   WHEN A.DATA_TYPE = 'NUMBER'

                   AND A.DATA_SCALE <> 0

                      THEN '(' || A.DATA_PRECISION || ',' || A.DATA_SCALE

                           || ')'

                END

               ) DATA_LENGTH

             , A.COLUMN_ID

          FROM USER_TAB_COLUMNS A

             , USER_TAB_COMMENTS B

             , USER_COL_COMMENTS C

         WHERE (A.TABLE_NAME = B.TABLE_NAME)

           AND (    A.TABLE_NAME = C.TABLE_NAME

                AND A.COLUMN_NAME = C.COLUMN_NAME

               )

         

       ) A1

     , (SELECT A.TABLE_NAME

             , A.COLUMN_NAME

             , B.CONSTRAINT_TYPE

          FROM USER_CONS_COLUMNS A

             , USER_CONSTRAINTS B

         WHERE (A.CONSTRAINT_NAME = B.CONSTRAINT_NAME)

           AND B.CONSTRAINT_TYPE IN ('P', 'R')) B1

WHERE (    A1.TABLE_NAME = B1.TABLE_NAME(+)

        AND A1.COLUMN_NAME = B1.COLUMN_NAME(+))

ORDER BY A1.TABLE_NAME, A1.COLUMN_ID;
