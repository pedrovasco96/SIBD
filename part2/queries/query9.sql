SELECT P.name, P.address_street, P.address_zip, P.address_city
FROM person P, client C, animal A, generalization_species G1, generalization_species G2
WHERE P.VAT=C.VAT
      AND C.VAT=A.VAT_owner
      AND A.species_name=G1.name1
      AND G1.name2=G2.name1
      AND (G2.name2="Bird" OR G1.name2="Bird");
