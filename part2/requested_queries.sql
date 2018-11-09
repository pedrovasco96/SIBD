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
SELECT count(P.VAT_assistant), count(distinct C.date_timestamp), count(D.code), count(PR.name), count(PC.date_timestamp)
FROM consult_diagnosis D,operation PR, consult C, participation P, prescription PC
WHERE YEAR(C.date_timestamp) = 2017;
      AND YEAR(D.date_timestamp) = 2017
      AND YEAR(P.date_timestamp) = 2017
      AND YEAR(PC.date_timestamp) = 2017
      AND YEAR(PR.date_timestamp) = 2017;

(SELECT count(distinct C.date_timestamp) AS total_consults
FROM consult C
WHERE YEAR(C.date_timestamp)=2017)
UNION
(SELECT count(*) AS total_diagnosis
FROM consult_diagnosis D
WHERE YEAR(D.date_timestamp)=2017);
UNION
(SELECT count(*) AS assistants_participating
FROM participation P
WHERE YEAR(P.date_timestamp)=2017)
UNION
(SELECT count(*) AS procedures_done
FROM operation PR
WHERE YEAR(PR.date_timestamp)=2017)
UNION
(SELECT count(*) AS prescriptions_given
FROM prescription PC
WHERE YEAR(PC.date_timestamp)=2017);


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
