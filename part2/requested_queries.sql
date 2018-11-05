-- 1
-- change animal.vat to owner name
SELECT animal.name, animal.VAT, animal.species_name, animal.age
FROM animal, consult, person
WHERE person.name='John Smith' AND person.VAT=consult.VAT_vet AND animal.VAT=consult.VAT_owner;

-- 2
SELECT indicator.name, indicator.reference_value
FROM indicator
WHERE indicator.reference_value>100 AND indicator.units='milligrams'
ORDER BY indicator.reference_value DESC;

-- 3
SELECT DISTINCT animal.name, animal.VAT, animal.species_name, animal.age
FROM animal, consult
WHERE animal.name=consult.name AND consult.weight>30 AND (consult.o='obese' OR consult.o='obesity');

-- 4
SELECT person.VAT, person.name, person.adress_city, person.adress_street, person.adress_zip
FROM person
WHERE person.VAT NOT IN (SELECT animal.VAT FROM animal);
