-- 1
UPDATE person
SET address_city = 'Leiria', address_street = 'Rua Sésamo', address_zip = '6670-567'
WHERE person.name = 'John Smith'
      AND person.VAT IN (SELECT *
                        FROM client);

-- 2
UPDATE indicator
SET reference_value = 1.1 * reference_value
WHERE units='milligrams'
      AND (description LIKE '%blood%'
          OR name IN (SELECT P.indicator_name
                      FROM test_procedure T, produced_indicator P
                      WHERE T.type='Blood'
                      AND T.date_timestamp=P.date_timestamp));
-- 3
DELETE person.*
FROM person
WHERE person.name = "John Smith";

-- 4
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
