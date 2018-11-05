-- 1
-- change animal.vat to owner name
SELECT DISTINCT A.name, P2.name, A.species_name, A.age
FROM animal A, consult C, person P1, person P2
WHERE P1.name='John Smith' AND P1.VAT=C.VAT_vet AND A.VAT=C.VAT_owner AND P2.VAT = A.VAT;

-- 2
SELECT I.name, I.reference_value
FROM indicator I
WHERE I.reference_value>100 AND I.units='milligrams'
ORDER BY I.reference_value DESC;

-- 3
SELECT DISTINCT A.name, A.VAT, A.species_name, A.age
FROM animal A, consult C
WHERE A.name=C.name AND C.weight>30 AND (C.o='obese' OR C.o='obesity');

-- 4
SELECT P.VAT, P.name, P.adress_city, P.adress_street, P.adress_zip
FROM person P
WHERE P.VAT NOT IN (SELECT animal.VAT FROM animal);

--6 (not working)
SELECT avg(count(P.VAT_assistant)), avg(count(D.code)), avg(count(PR.name))
FROM consult_diagnosis D, procedure PR, consult C, participation P
WHERE YEAR(C.date_timestamp)=2017
      AND D.date_timestamp=C.date_timestamp
      AND P.date_timestamp = C.date_timestamp
      AND PR.date_timestamp = C.date_timestamp;
