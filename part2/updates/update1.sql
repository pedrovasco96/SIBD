UPDATE person
SET address_city = 'Leiria', address_street = 'Rua Sésamo', address_zip = '6670-567'
WHERE person.name = 'John Smith'
      AND person.VAT IN (SELECT *
                        FROM client);
