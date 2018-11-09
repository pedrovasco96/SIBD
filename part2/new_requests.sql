-- 1
SELECT DISTINCT A.name, P.name, A.species_name, A.age
FROM animal A, consult C, person V, person P
WHERE V.name='John Smith' AND V.VAT=C.VAT_vet AND A.VAT_owner=C.VAT_owner AND P.VAT = A.VAT_owner AND A.name = C.name;

-- 2
SELECT I.name, I.reference_value
FROM indicator I
WHERE I.reference_value>100 AND I.units='milligrams'
ORDER BY I.reference_value DESC;

-- 3
SELECT A.name, A.VAT_owner, A.species_name, A.age, C1.o
FROM animal A, consult C1
LEFT OUTER JOIN consult C2
ON C1.VAT_owner = C2.VAT_owner
AND C1.date_timestamp < C2.date_timestamp
WHERE C2.VAT_owner IS NULL
AND (C1.o LIKE '%obese%' OR C1.o LIKE '%obesity%')
AND A.VAT_owner = C1.VAT_owner
AND A.name = C1.name;

-- 4
SELECT P.VAT, P.name, P.address_city, P.address_street, P.adress_zip
FROM person P
WHERE P.VAT NOT IN (SELECT animal.VAT_owner FROM animal);

-- 5
SELECT COUNT(DISTINCT medication.name), diagnosis_code.name
FROM diagnosis_code, prescription, medication
WHERE diagnosis_code.code=prescription.code and prescription.med_name=medication.name
GROUP BY diagnosis_code.name
ORDER BY COUNT(DISTINCT medication.name) ASC;

--6 (not working, possibly something with unions)
SELECT C.name, P.VAT_assistant, O.num as 'operation_number', D.code as 'diagnosis_code', PC.code as 'prescription_code'
FROM consult C
LEFT JOIN consult_diagnosis D
  ON D.date_timestamp=C.date_timestamp
  AND D.VAT_owner=C.VAT_owner
LEFT JOIN operation O
  ON O.date_timestamp=C.date_timestamp
  AND O.VAT_owner=C.VAT_owner
LEFT JOIN participation P
  ON P.date_timestamp=C.date_timestamp
  AND P.VAT_owner=C.VAT_owner
LEFT JOIN prescription PC
  ON PC.date_timestamp=C.date_timestamp
  AND PC.VAT_owner=C.VAT_owner
WHERE YEAR(C.date_timestamp) = 2017

SELECT C.name, D.code as 'diagnosis_code',O.num as 'operation_number'
FROM consult C, consult_diagnosis D
WHERE YEAR(C.date_timestamp) = 2017
AND C.VAT_owner = D.VAT_owner
AND D.date_timestamp=C.date_timestamp
GROUP BY C.date_timestamp, C.VAT_owner
LEFT JOIN operation O
ON O.date_timestamp=C.date_timestamp
AND O.VAT_owner=C.VAT_owner

SELECT C.date_timestamp
FROM consult C
WHERE YEAR(C.date_timestamp)=2017

SELECT P.VAT_assistant, count(C.VAT_owner),O.num, D.code, PC.code
FROM consult C, participation P, operation O, consult_diagnosis D, prescription PC
WHERE P.date_timestamp=C.date_timestamp
  AND O.date_timestamp=C.date_timestamp
  AND D.date_timestamp=C.date_timestamp
  AND PC.date_timestamp=C.date_timestamp
  AND P.VAT_owner = C.VAT_owner
  AND O.VAT_owner = C.VAT_owner
  AND D.VAT_owner = C.VAT_owner
  AND PC.VAT_owner = C.VAT_owner
GROUP BY C.date_timestamp, C.name, C.VAT_owner
HAVING YEAR(C.date_timestamp) = 2017

SELECT C.name, C.date_timestamp
FROM consult C
WHERE YEAR(C.date_timestamp) = 2017

SELECT count(P.VAT_assistant), count(distinct C.date_timestamp), count(D.code), count(PR.name), count(PC.date_timestamp)
FROM consult_diagnosis D, operation PR, consult C, participation P, prescription PC
WHERE YEAR(C.date_timestamp) = 2017
      AND YEAR(D.date_timestamp) = 2017
      AND YEAR(P.date_timestamp) = 2017
      AND YEAR(PC.date_timestamp) = 2017
      AND YEAR(PR.date_timestamp) = 2017;

(SELECT count(distinct C.date_timestamp)
FROM consult C
WHERE YEAR(C.date_timestamp)=2017)
UNION
(SELECT count(D.code)
FROM consult_diagnosis D
WHERE YEAR(D.date_timestamp)=2017)
UNION
(SELECT count(P.VAT_assistant)
FROM participation P
WHERE YEAR(P.date_timestamp)=2017)
UNION
(SELECT count(PR.name)
FROM operation PR
WHERE YEAR(PR.date_timestamp)=2017)
UNION
(SELECT count(PC.code)
FROM prescription PC
WHERE YEAR(PC.date_timestamp)=2017);

-- 7 (good for now, needs adjusting)
SELECT S.name, C.name AS most_common
FROM generalization_species G, species S, animal A, consult_diagnosis D, diagnosis_code C
WHERE G.name2 = 'Dog'
      AND G.name1 = S.name
      AND S.name = A.species_name
      AND A.name = D.name
      AND D.code = C.code
GROUP BY S.name
ORDER BY most_common DESC;

-- 8 (gives empty set, so it might work just fine :D)
SELECT P.name
FROM person P, client C, veterinary V, assistant A, consult CO
WHERE (P.VAT=C.VAT OR P.VAT=CO.VAT_client)
      AND (C.VAT=V.VAT OR C.VAT=A.VAT OR CO.VAT_client=V.VAT OR CO.VAT_client=A.VAT);

-- 9 (needs testing)
SELECT P.name, P.address_street, P.address_city, P.address_zip
FROM person P, client C, animal A, generalization_species G
WHERE P.VAT=C.VAT
      AND C.VAT=A.VAT
      AND A.species_name=G.name1
      AND G.name2='Bird';
