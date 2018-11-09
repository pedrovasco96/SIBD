INSERT INTO diagnosis_code
VALUES ('End-stage renal disease', 10);

SET @code_kidney = (SELECT code
                          FROM diagnosis_code
                          WHERE diagnosis_code.name='End-stage renal disease');

SET foreign_key_checks = 0;
UPDATE consult_diagnosis
SET code =  @code_kidney
WHERE name IN (SELECT P.name
                            FROM produced_indicator P, test_procedure T
                            WHERE T.type='blood'
                            AND T.date_timestamp=P.date_timestamp
                            AND P.indicator_name='Creatinine level'
                            AND P.value>1.0)
      AND VAT_owner IN (SELECT P.VAT_owner
                                  FROM produced_indicator P, test_procedure T
                                  WHERE T.type='blood'
                                  AND T.date_timestamp=P.date_timestamp
                                  AND P.indicator_name='Creatinine level'
                                  AND P.value>1.0);
SET foreign_key_checks = 1;
