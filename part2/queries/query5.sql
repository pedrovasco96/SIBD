SELECT diagnosis_code.name as 'Diagnosis', COUNT(DISTINCT medication.name) as 'Diff meds prescribed'
FROM diagnosis_code, prescription, medication
WHERE diagnosis_code.code=prescription.code and prescription.med_name=medication.name
GROUP BY diagnosis_code.name
ORDER BY COUNT(DISTINCT medication.name) ASC;
