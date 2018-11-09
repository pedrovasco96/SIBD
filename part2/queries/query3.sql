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
AND (C1.o LIKE '%obese%' OR C1.o LIKE '%obesity%');
