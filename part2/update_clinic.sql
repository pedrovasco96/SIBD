-- UPDATING THE DATABASE

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
DELETE FROM person, phone_number, animal, client, consult
WHERE name='John Smith';
AND person.VAT=phone_number.VAT
AND person.VAT=client.VAT
AND animal.VAT_owner=person.VAT
AND consult.VAT_owner=person.VAT;

-- 4
SET @code_kidney = (SELECT code
                          FROM diagnosis_code
                          WHERE diagnosis_code.name='Kidney failure');

INSERT INTO diagnosis_code
VALUES ('End-stage renal disease', 10);

SET @code_renal = (SELECT code
                          FROM diagnosis_code
                          WHERE diagnosis_code.name='End-stage renal disease');

SET @consults_creatinine = (SELECT P.date_timestamp
                            FROM produced_indicator P, test_procedure T
                            WHERE T.type='blood'
                            AND T.date_timestamp=P.date_timestamp
                            AND P.indicator_name='Creatinine level'
                            AND P.value>1.0);

UPDATE consult_diagnosis
SET code = 10
WHERE date_timestamp = @consults_creatinine;
