SELECT P.VAT, P.name, P.address_city, P.address_street, P.address_zip
FROM person P, client C
WHERE P.VAT NOT IN (SELECT animal.VAT_owner FROM animal)
AND P.VAT = C.VAT;
