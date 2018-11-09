-- UPDATING THE DATABASE

-- 1 (needs to check if it's client)
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
