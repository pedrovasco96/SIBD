/*
* POPULATES THE CLINIC'S TABLES IN THE DATABASE
*/

-- (VAT, name, adress_city, adress_street, adress_zip)
insert into person values (2424, 'Pedro', 'Bobadela', 'Rua Jorge', '2695-048');
insert into person values (2425, 'João', 'Pontinha', 'Rua Fialho', '2200-238');
insert into person values (2426, 'Sara', 'Cascais', 'Risotte', '1697-908');
insert into person values (2427, 'John Smith', 'Lisboa', 'Compaund', '1002-908');
insert into person values (2828, 'Badoije', 'Lisboa', 'Alvalade', '1000-908');
insert into person values (88, 'JJBoçe', 'Lidal', 'Risotte', '1001-908');

-- (VAT, specialization, bio)
insert into veterinary values (2424, 'General', 'Licenciado em 2015 pela FMVUL');
insert into veterinary values (2427, 'Cardiologist', 'Licenciado em 1998 pela FMVUP');

-- (VAT)
insert into assistant values (2426);

-- (VAT)
insert into client values (2425);
insert into client values (2426);
insert into client values (2828);
insert into client values (88);

-- (VAT, phone)
insert into phone_number values (2425, 916784568);

-- (name / latin name (when there is no commom name), latin name / description)
insert into species values ('Accipitridae', 'Family of birds');
insert into species values ('Eagle', 'Set of all Eagle species');
insert into species values ('Bald Eagle', 'H. leucocephalus');
insert into species values ('Cat', 'Felis catus');
insert into species values ('Sphynx', 'Cat breed');
insert into species values ('Dog', 'Canis familiaris');
insert into species values ('Labrador', 'Dog breed');

-- (general name, specific name / breed)
insert into generalization_species values ('Dog', 'Labrador');
insert into generalization_species values ('Accipitridae', 'Eagle');
insert into generalization_species values ('Eagle', 'Bald Eagle');
insert into generalization_species values ('Cat', 'Sphynx');

-- (name, VAT, species_name, colour, gender, birth_year, age)
insert into animal values ('Jonas', 2425, 'Labrador', 'brown', 'F', 2012, 6);
insert into animal values ('Pizzi', 2425, 'Labrador', 'black', 'M', 2010, 8);
insert into animal values ('Esferovite', 2425, 'Labrador', 'white', 'M', 2015, 3);
insert into animal values ('Bruno César', 88, 'Bald Eagle', 'white', 'M', 2005, 13);
insert into animal values ('Amelie', 2426, 'Sphynx', 'white', 'F', 2016, 2);

-- (name, VAT_owner, date_timestamp, s, o, a, p, VAT_client, VAT_vet, weight)
insert into consult values ('Jonas', 2425, 2018-10-25 13:45:30, '', 'obese', '', '', 2425, 2427, 32.4);
insert into consult values ('Pizzi', 2425, 2018-10-24 16:15:00, '', 'strabism', '', '', 2425, 2424, 24.5);
insert into consult values ('Bruno César', 88, 2017-10-24 11:15:00, '', 'obese', '', '', 88, 2424, 40);

-- (name, VAT_owner, date_timestamp, VAT_assistant)
insert into participation values ('Jonas', 2425, 2018-10-25 13:45:30, 2426);
insert into participation values ('Bruno César', 88, 2017-10-24 11:15:00, 2426);

-- (name, code)
insert into diagnosis_code values ('Arrhythmia', 234);
insert into diagnosis_code values ('Diarrea', 200);

-- (name, code, date_timestamp, VAT_owner)
insert into consult_diagnosis values ('Jonas', 234, 2018-10-25 13:45:30, 2425);
insert into consult_diagnosis values ('Bruno César', 200, 2017-10-24 11:15:00, 88);

-- (name, dosage, lab)
insert into medication values ('Aspirina', 2, 'Bayer');
insert into medication values ('Varfine', 1, 'Bayer');
insert into medication values ('Halibut', 1, 'Halibut');

-- (name, code, date_timestamp, VAT_owner, med_name, dosage, lab, regime)
insert into prescription values ('Jonas', 234, 2018-10-25 13:45:30, 2425, 'Aspirina', 2, 'Bayer', 'One time a day');
insert into prescription values ('Jonas', 234, 2018-10-25 13:45:30, 2425, 'Varfine', 1, 'Bayer', 'Two times a day');
insert into prescription values ('Bruno César', 200, 2017-10-24 11:15:00, 88, 'Halibut', 1, 'Halibut', 'After poop');

-- (name, reference_value, units, description)
insert into indicator values ('Diabetes', 200, 'milligrams', 'Amount of sugar in blood');
insert into indicator values ('Collestrol', 180, 'milligrams', 'Amount of collestrol in blood');
insert into indicator values ('Red cells', 300, 'units', 'Amount of red cells in blood');
insert into indicator values ('Protease Protein', 10, 'milligrams', 'Infection protein');

-- (name, num, date_timestamp, VAT_owner, description)
insert into proceeding values ('Jonas', 1, 2018-10-25 13:45:30, 2425, 'Analysis');
insert into proceeding values ('Bruno César', 1, 2017-10-24 11:15:00, 88, 'Analysis');
insert into proceeding values ('Jonas', 2, 2018-10-25 13:45:30, 2425, 'Toraxic Radiography');

-- (name, num, date_timestamp, VAT_owner, VAT_assistant)
insert into performed values ('Jonas', 1, 2018-10-25 13:45:30, 2425, 2426);
insert into performed values ('Jonas', 2, 2018-10-25 13:45:30, 2425, 2426);
insert into performed values ('Bruno César', 1, 2017-10-24 11:15:00, 88, 2426);

-- (name, num, date_timestamp, VAT_owner, file)
insert into radiography values ('Jonas', 2, 2018-10-25 13:45:30, 2425, 'No significant patologies detected');

-- (name, num, date_timestamp, VAT_owner, type)
insert into test_procedure values ('Jonas', 1, 2018-10-25 13:45:30, 2425, 'Blood');
insert into test_procedure values ('Bruno César', 1, 2017-10-24 11:15:00, 88, 'Blood');

-- (name,num,date_timestamp, VAT_owner, indicator_name, value)
insert into produced_indicator values ('Jonas', 1, 2018-10-25 13:45:30, 2425, 'Diabetes', 250);
insert into produced_indicator values ('Bruno César', 1, 2017-10-24 11:15:00, 88, 'Diabetes', 350);
