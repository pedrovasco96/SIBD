/*
* POPULATES THE CLINIC'S TABLES IN THE DATABASE
*/

-- (VAT, name, adress_city, adress_street, adress_zip)
-- veterinary
insert into person values (716066894, 'Pedro Vasco', 'Lisboa', 'Rua Jorge', '2695-048');
insert into person values (626114400, 'John Smith', 'Lisboa', 'Compaund', '9747-202');
insert into person values (678580968, 'Jamil Merritt', 'Lisboa', 'Rua da Graça', '1360-965');

-- assistant
insert into person values (490988036, 'Sara Vieira', 'Lisboa', 'Risotte', '1697-908');
insert into person values (353386064, 'Brenna Pratt', 'Porto', 'Rua da Graça', '2666-901');
insert into person values (791306026, 'Shakir Silva', 'Porto', 'Rua da Glória', '1602-725');
insert into person values (523798442, 'Awais Kaiser', 'Porto', 'Avenida da Liberdade', '5850-873');
insert into person values (183354373, 'Cecilia Holmes', 'Porto', 'Avenida da Liberdade', '9196-721');

-- client
insert into person values (102556247, 'João Rodrigues', 'Lisboa', 'Rua Fialho', '2200-238');
insert into person values (100124638, 'Erasmus Cannon', 'Porto', 'Avenida da Liberdade', '2314-477');
insert into person values (650179091, 'Carlos Brennan', 'Braga', 'Rua 24 de Julho', '5874-773');
insert into person values (340890964, 'Miriam Cameron', 'Braga', 'Rua 24 de Julho', '3897-231');
insert into person values (841477918, 'Clio Morin', 'Braga', 'Praça Firmino', '3673-594');
insert into person values (243811413, 'Jameson Harrison', 'Braga', 'Praça Firmino', '1152-114');
insert into person values (899014901, 'Elijah Vargas', 'Braga', 'Praçeta do Vale dos Reis', '3634-589');
insert into person values (842418653, 'Jared Mcfadden', 'Coimbra', 'Praçeta do Vale dos Reis', '6995-225');
insert into person values (700074220, 'Solomon Christian', 'Coimbra', 'Praçeta do Vale dos Reis', '9975-858');
insert into person values (852102198, 'Phelan Kemp', 'Coimbra', 'Rua Vasco', '3008-678');
insert into person values (160929865, 'Vielka Montgomery', 'Coimbra', 'Rua Vasco', '5258-082');
insert into person values (593867020, 'Ivana Woodard', 'Coimbra', 'Rua Vasco', '5138-462');

-- (VAT, specialization, bio)
insert into veterinary values (716066894, 'General', 'BSc. degree FMVUL 2015');
insert into veterinary values (626114400, 'General', 'PhD at Veterinary Faculty of Beijing');
insert into veterinary values (678580968, 'General', 'MSc. Veterinary Faculty of Munich');

-- (VAT)
insert into assistant values (490988036);
insert into assistant values (353386064);
insert into assistant values (791306026);
insert into assistant values (523798442);
insert into assistant values (183354373);

-- (VAT)
insert into client values (102556247);
insert into client values (100124638);
insert into client values (650179091);
insert into client values (340890964);
insert into client values (841477918);
insert into client values (243811413);
insert into client values (899014901);
insert into client values (842418653);
insert into client values (700074220);
insert into client values (852102198);
insert into client values (160929865);
insert into client values (593867020);

-- (VAT, phone)
insert into phone_number values (716066894,916784568);
insert into phone_number values (716066894,937176301);
insert into phone_number values (626114400,969512368);
insert into phone_number values (678580968,962719223);
insert into phone_number values (490988036,967583339);
insert into phone_number values (353386064,965437203);
insert into phone_number values (791306026,919927348);
insert into phone_number values (523798442,925314883);
insert into phone_number values (183354373,922389293);
insert into phone_number values (102556247,914512836);
insert into phone_number values (100124638,959369700);
insert into phone_number values (650179091,972771466);
insert into phone_number values (340890964,992414419);
insert into phone_number values (841477918,910238159);
insert into phone_number values (243811413,902042335);
insert into phone_number values (899014901,983391730);
insert into phone_number values (842418653,998128821);
insert into phone_number values (700074220,910859733);
insert into phone_number values (852102198,935509172);
insert into phone_number values (160929865,956142621);
insert into phone_number values (593867020,921889291);

-- (name / latin name (when there is no commom name), latin name / description)
insert into species values ('Accipitridae', 'Family of birds');
insert into species values ('Eagle', 'Set of all Eagle species');
insert into species values ('Bald Eagle', 'H. leucocephalus');
insert into species values ('Cat', 'Felis catus');
insert into species values ('Sphynx', 'Cat breed');
insert into species values ('Dog', 'Canis familiaris');
insert into species values ('Labrador', 'Dog breed');
insert into species values ('Papillon', 'Dog breed');
insert into species values ('Shiba Inu', 'Dog breed');
insert into species values ('Doberman', 'Dog breed');
insert into species values ('German Sheppard', 'Dog breed');

-- (general name, specific name / breed)
insert into generalization_species values ('Eagle', 'Accipitridae');
insert into generalization_species values ('Bald Eagle', 'Eagle');
insert into generalization_species values ('Sphynx', 'Cat');
insert into generalization_species values ('Labrador', 'Dog');
insert into generalization_species values ('Papillon', 'Dog');
insert into generalization_species values ('Shiba Inu', 'Dog');
insert into generalization_species values ('Doberman', 'Dog');
insert into generalization_species values ('German Sheppard', 'Dog');

-- (name, VAT, species_name, colour, gender, birth_year, age)
insert into animal values ('Jonas', 102556247, 'Labrador', 'brown', 'F', 2012, 6);
insert into animal values ('Pizzi', 102556247, 'Labrador', 'black', 'M', 2010, 8);
insert into animal values ('Esferovite', 100124638, 'Labrador', 'white', 'M', 2015, 3);
insert into animal values ('Bruno César', 650179091, 'Bald Eagle', 'white', 'M', 2005, 13);
insert into animal values ('Amelie', 340890964, 'Sphynx', 'white', 'F', 2016, 2);

-- (name, VAT_owner, date_timestamp, s, o, a, p, VAT_client, VAT_vet, weight)
insert into consult values ('Jonas', 102556247, '2018-10-25 08:30:00', '', 'obesity', '', '', 102556247, 716066894, 32.4);
insert into consult values ('Pizzi', 102556247, '2018-10-25 10:34:09', '', 'strabism', '', '', 102556247, 716066894, 24.5);
insert into consult values ('Bruno César', 650179091, '2018-10-25 12:34:09', '', 'obesity', '', '', 650179091, 716066894, 40);

-- (name, VAT_owner, date_timestamp, VAT_assistant)
insert into participation values ('Jonas', 102556247, '2018-10-25 10:34:09', 490988036);
insert into participation values ('Bruno César', 650179091,'2018-10-25 12:34:09', 490988036);

-- (name, code)
insert into diagnosis_code values ('Arrhythmia', 234);
insert into diagnosis_code values ('Diarrea', 200);

-- (name, code, date_timestamp, VAT_owner)
insert into consult_diagnosis values ('Jonas', 234, '2018-10-25 10:34:09', 102556247);
insert into consult_diagnosis values ('Bruno César', 200, '2018-10-25 12:34:09', 650179091);

-- (name, dosage, lab)
insert into medication values ('Aspirina', 2, 'Bayer');
insert into medication values ('Varfine', 1, 'Bayer');
insert into medication values ('Halibut', 1, 'Halibut');

-- (name, code, date_timestamp, VAT_owner, med_name, dosage, lab, regime)
insert into prescription values ('Jonas', 234, '2018-10-25 10:34:09', 102556247, 'Aspirina', 2, 'Bayer', 'One time a day');
insert into prescription values ('Jonas', 234, '2018-10-25 10:34:09', 102556247, 'Varfine', 1, 'Bayer', 'Two times a day');
insert into prescription values ('Bruno César', 200, '2018-10-25 12:34:09', 650179091, 'Halibut', 1, 'Halibut', 'After poop');

-- (name, reference_value, units, description)
insert into indicator values ('Diabetes', 200, 'milligrams', 'Amount of sugar in blood');
insert into indicator values ('Collestrol', 180, 'milligrams', 'Amount of collestrol in blood');
insert into indicator values ('Red cells', 300, 'units', 'Amount of red cells in blood');
insert into indicator values ('Protease Protein', 10, 'milligrams', 'Infection protein');

-- (name, num, date_timestamp, VAT_owner, description)
insert into proceeding values ('Jonas', 1, '2018-10-25 10:34:09', 102556247, 'Analysis');
insert into proceeding values ('Jonas', 2, '2018-10-25 10:34:09', 102556247, 'Toraxic Radiography');
insert into proceeding values ('Bruno César', 1, '2018-10-25 12:34:09', 650179091, 'Analysis');

-- (name, num, date_timestamp, VAT_owner, VAT_assistant)
insert into performed values ('Jonas', 1, '2018-10-25 10:34:09', 102556247, 490988036);
insert into performed values ('Jonas', 2, '2018-10-25 10:34:09', 102556247, 490988036);
insert into performed values ('Bruno César', 1, '2018-10-25 12:34:09', 650179091, 490988036);

-- (name, num, date_timestamp, VAT_owner, file)
insert into radiography values ('Jonas', 2, '2018-10-25 10:34:09', 102556247, 'No significant patologies detected');

-- (name, num, date_timestamp, VAT_owner, type)
insert into test_procedure values ('Jonas', 1, '2018-10-25 10:34:09', 102556247, 'Blood');
insert into test_procedure values ('Bruno César', 1,'2018-10-25 12:34:09', 650179091, 'Blood');

-- (name,num,date_timestamp, VAT_owner, indicator_name, value)
insert into produced_indicator values ('Jonas', 1, '2018-10-25 10:34:09', 102556247, 'Diabetes', 250);
insert into produced_indicator values ('Bruno César', 1, '2018-10-25 12:34:09', 650179091, 'Diabetes', 350);
