SELECT S.name, C.name
FROM generalization_species G, species S, animal A, consult_diagnosis D, diagnosis_code C
WHERE G.name2 = 'Dog'
      AND G.name1 = S.name
      AND S.name = A.species_name
      AND A.name = D.name
      AND D.code = C.code
GROUP BY S.name
ORDER BY count(D.code) DESC;
