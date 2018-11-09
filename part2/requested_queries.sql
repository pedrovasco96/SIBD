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
AND C1.name = C2.name
AND C1.date_timestamp < C2.date_timestamp
WHERE C2.VAT_owner IS NULL
AND A.VAT_owner = C1.VAT_owner
AND A.name = C1.name
AND C1.weight > 30
AND (C1.o LIKE '%obese%' OR C1.o LIKE '%obesity%')

-- 4
SELECT P.VAT, P.name, P.address_city, P.address_street, P.address_zip
FROM person P, client C
WHERE P.VAT NOT IN (SELECT animal.VAT_owner FROM animal)
AND P.VAT = C.VAT;

-- 5
SELECT diagnosis_code.name as 'Diagnosis', COUNT(DISTINCT medication.name) as 'Diff meds prescribed'
FROM diagnosis_code, prescription, medication
WHERE diagnosis_code.code=prescription.code and prescription.med_name=medication.name
GROUP BY diagnosis_code.name
ORDER BY COUNT(DISTINCT medication.name) ASC;

--6
SET @assistant_count = (SELECT count(P.VAT_assistant)
                          FROM consult C, participation P
                          WHERE YEAR(C.date_timestamp)=2017
                          AND P.date_timestamp=C.date_timestamp
                          AND P.VAT_owner=C.VAT_owner);
SET @operation_count = (SELECT count(O.num)
                          FROM consult C, operation O
                          WHERE YEAR(C.date_timestamp)=2017
                          AND O.date_timestamp=C.date_timestamp
                          AND O.VAT_owner=C.VAT_owner);
SET @diagnosis_count = (SELECT count(D.code)
                          FROM consult C, consult_diagnosis D
                          WHERE YEAR(C.date_timestamp)=2017
                          AND D.date_timestamp=C.date_timestamp
                          AND D.VAT_owner=C.VAT_owner);
SET @prescription_count = (SELECT count(PC.code)
                          FROM consult C, prescription PC
                          WHERE YEAR(C.date_timestamp)=2017
                          AND PC.date_timestamp=C.date_timestamp
                          AND PC.VAT_owner=C.VAT_owner);
SET @total = (SELECT count(C.date_timestamp)
                          FROM consult C
                          WHERE YEAR(C.date_timestamp)=2017);
SELECT  @assistant_count/@total as 'avg assistants',
        @prescription_count/@total as 'avg procedures',
        @diagnosis_count/@total as 'avg diagnostics',
        @prescription_count/@total as 'avg prescriptions';

-- 7 (good for now, needs adjusting to make sure it's not the same animal)
SELECT S.name, C.name
FROM generalization_species G, species S, animal A, consult_diagnosis D, diagnosis_code C
WHERE G.name2 = 'Dog'
      AND G.name1 = S.name
      AND S.name = A.species_name
      AND A.name = D.name
      AND D.code = C.code
GROUP BY S.name
ORDER BY count(D.code) DESC;

-- 8
SELECT distinct P.name
FROM person P, veterinary V, assistant A, consult CO
WHERE (P.VAT=CO.VAT_client)
      AND (CO.VAT_client=V.VAT OR CO.VAT_client=A.VAT);

-- 9
SELECT P.name, P.address_street, P.address_zip, P.address_city
FROM person P, client C, animal A, generalization_species G1, generalization_species G2
WHERE P.VAT=C.VAT
      AND C.VAT=A.VAT_owner
      AND A.species_name=G1.name1
      AND G1.name2=G2.name1
      AND (G2.name2="Bird" OR G1.name2="Bird");
