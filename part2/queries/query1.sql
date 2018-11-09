SELECT DISTINCT A.name, P.name, A.species_name, A.age
FROM animal A, consult C, person V, person P
WHERE V.name='John Smith' AND V.VAT=C.VAT_vet AND A.VAT_owner=C.VAT_owner AND P.VAT = A.VAT_owner AND A.name = C.name;
