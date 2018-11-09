SELECT I.name, I.reference_value
FROM indicator I
WHERE I.reference_value>100 AND I.units='milligrams'
ORDER BY I.reference_value DESC;
