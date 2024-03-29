/*
* POPULATES THE CLINIC'S TABLES IN THE DATABASE
*/

-- (VAT, name, adress_city, adress_street, adress_zip)
-- veterinary
insert into person values (7160, 'Pedro Vasco', 'Lisboa', 'Rua Jorge', '2695-048');
insert into person values (6261, 'John Smith', 'Lisboa', 'Compaund', '9747-202');
insert into person values (6285, 'Jamil Merritt', 'Lisboa', 'Rua da Graça', '1360-965');

-- assistant
insert into person values (4909, 'Sara Vieira', 'Lisboa', 'Risotte', '1697-908');
insert into person values (3533, 'Brenna Pratt', 'Porto', 'Rua da Graça', '2666-901');
insert into person values (7913, 'Shakir Silva', 'Porto', 'Rua da Glória', '1602-725');
insert into person values (5237, 'Awais Kaiser', 'Porto', 'Avenida da Liberdade', '5850-873');
insert into person values (1833, 'Cecilia Holmes', 'Porto', 'Avenida da Liberdade', '9196-721');

-- client
insert into person values (1025, 'João Rodrigues', 'Lisboa', 'Rua Fialho', '2200-238');
insert into person values (1001, 'Erasmus Cannon', 'Porto', 'Avenida da Liberdade', '2314-477');
insert into person values (6501, 'Carlos Brennan', 'Braga', 'Rua 24 de Julho', '5874-773');
insert into person values (3408, 'Miriam Cameron', 'Braga', 'Rua 24 de Julho', '3897-231');
insert into person values (3409, 'Clio Morin', 'Braga', 'Praça Firmino', '3673-594');
insert into person values (2438, 'Jameson Harrison', 'Braga', 'Praça Firmino', '1152-114');
insert into person values (8990, 'Elijah Vargas', 'Braga', 'Praçeta do Vale dos Reis', '3634-589');
insert into person values (8424, 'Jared Mcfadden', 'Coimbra', 'Praçeta do Vale dos Reis', '6995-225');
insert into person values (7000, 'Solomon Christian', 'Coimbra', 'Praçeta do Vale dos Reis', '9975-858');
insert into person values (8521, 'Rossi', 'Vialonga', 'VBlock', '3008-678');
insert into person values (1609, 'Vielka Montgomery', 'Coimbra', 'Rua Vasco', '5258-082');
insert into person values (5938, 'Ivana Woodard', 'Coimbra', 'Rua Vasco', '5138-462');

-- (VAT, specialization, bio)
insert into veterinary values (7160, 'General', 'BSc. degree FMVUL 2015');
insert into veterinary values (6261, 'General', 'PhD at Veterinary Faculty of Beijing');
insert into veterinary values (6285, 'General', 'MSc. Veterinary Faculty of Munich');

-- (VAT)
insert into assistant values (4909);
insert into assistant values (3533);
insert into assistant values (7913);
insert into assistant values (5237);
insert into assistant values (1833);

-- (VAT)
insert into client values (1025);
insert into client values (1001);
insert into client values (6501);
insert into client values (3408);
insert into client values (3409);
insert into client values (2438);
insert into client values (8990);
insert into client values (8424);
insert into client values (7000);
insert into client values (8521);
insert into client values (1609);
insert into client values (5938);

-- (VAT, phone)
insert into phone_number values (7160,916784568);
insert into phone_number values (7160,937176301);
insert into phone_number values (6261,969512368);
insert into phone_number values (6285,962719223);
insert into phone_number values (4909,967583339);
insert into phone_number values (3533,965437203);
insert into phone_number values (7913,919927348);
insert into phone_number values (5237,925314883);
insert into phone_number values (1833,922389293);
insert into phone_number values (1025,914512836);
insert into phone_number values (1001,959369700);
insert into phone_number values (6501,972771466);
insert into phone_number values (3408,992414419);
insert into phone_number values (3409,910238159);
insert into phone_number values (2438,902042335);
insert into phone_number values (8990,983391730);
insert into phone_number values (8424,998128821);
insert into phone_number values (7000,910859733);
insert into phone_number values (8521,935509172);
insert into phone_number values (1609,956142621);
insert into phone_number values (5938,921889291);

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
insert into animal values ('Jonas', 1025, 'Labrador', 'brown', 'F', 2012, YEAR(CURDATE())-2012);
insert into animal values ('Pizzi', 1025, 'Labrador', 'black', 'M', 2010, YEAR(CURDATE())-2010);
insert into animal values ('Deezy', 7000, 'Labrador', 'white', 'M', 2015, YEAR(CURDATE())-2015);
insert into animal values ('Bruno César', 6501, 'Bald Eagle', 'white', 'M', 2005, YEAR(CURDATE())-2005);
insert into animal values ('Amelie', 3408, 'Sphynx', 'white', 'F', 2016, YEAR(CURDATE())-2016);
insert into animal values ('Nel', 5938, 'Papillon', 'white', 'M', 2015, YEAR(CURDATE())-2015);
insert into animal values ('Holly Hood', 5938, 'Papillon', 'white', 'F', 2015, YEAR(CURDATE())-2015);
insert into animal values ('Prodígio', 7000, 'Papillon', 'black', 'M', 2016, YEAR(CURDATE())-2016);
insert into animal values ('Zizzy', 8521, 'Doberman', 'brown', 'M', 2011, YEAR(CURDATE())-2011);
insert into animal values ('Slow J', 8990, 'Sphynx', 'white', 'M', 2011, YEAR(CURDATE())-2011);
insert into animal values ('Sam The Kid', 2438, 'Papillon', 'white', 'M', 2010, YEAR(CURDATE())-2010);
insert into animal values ('Allen', 2438, 'Shiba Inu', 'black', 'M', 1994, YEAR(CURDATE())-1994);
insert into animal values ('Valete', 2438, 'Shiba Inu', 'black', 'M', 2015, YEAR(CURDATE())-2015);
insert into animal values ('Bispo', 8424, 'Shiba Inu', 'white', 'M', 2017, YEAR(CURDATE())-2017);
insert into animal values ('Kappa Jota', 8424, 'Shiba Inu', 'white', 'F', 2013, YEAR(CURDATE())-2013);
insert into animal values ('Malabá', 1001, 'German Sheppard', 'brown', 'M', 2015, YEAR(CURDATE())-2015);
insert into animal values ('Regula', 1001, 'German Sheppard', 'white', 'F', 2015, YEAR(CURDATE())-2015);
insert into animal values ('GSon', 8521, 'Doberman', 'black', 'M', 2009, YEAR(CURDATE())-2009);
insert into animal values ('Zara', 8521, 'Doberman', 'black', 'M', 2008, YEAR(CURDATE())-2008);
insert into animal values ('Kroa', 8521, 'Doberman', 'black', 'M', 2014, YEAR(CURDATE())-2014);

-- (name, VAT_owner, date_timestamp, s, o, a, p, VAT_client, VAT_vet, weight)
-- s:subjetive observation
-- o:objective observation
-- a:assessment
-- p:plan
insert into consult values ('Jonas', 1025, '2018-10-25 08:30:00', '', 'Obesity', '', '', 1025, 7160, 32.4);
insert into consult values ('Pizzi', 1025, '2018-10-25 10:34:09', '', 'Strabism', '', '', 1025, 7160, 24.5);
insert into consult values ('Bruno César', 6501, '2018-10-25 12:34:09', '', 'Obesity', '', '', 6501, 7160, 40);
insert into consult values ('Nel', 5938, '2017-10-25 12:34:09', '', 'Obesity', '', '', 5938, 6261, 25);
insert into consult values ('GSon', 8521, '2017-05-23 12:34:09', 'Cup Problems', 'Alcoholism', '', '', 8521, 6261, 25);
insert into consult values ('Nel', 5938, '2017-10-27 10:34:09', '', 'Alcoholism', '', '', 5938, 6261, 24);
insert into consult values ('Sam The Kid', 2438, '2017-07-11 17:15:00', '', 'Fever', '', '', 2438, 7160, 15);
insert into consult values ('Allen', 2438, '2017-10-25 16:34:09', '', 'Rabies', '', '', 5938, 6261, 25);

-- (name, VAT_owner, date_timestamp, VAT_assistant)
insert into participation values ('Jonas', 1025, '2018-10-25 08:30:00', 4909);
insert into participation values ('Bruno César', 6501,'2018-10-25 12:34:09', 4909);
insert into participation values ('GSon', 8521,'2017-05-23 12:34:09', 3533);
insert into participation values ('Sam The Kid', 2438,'2017-07-11 17:15:00', 7913);

-- (name, code)
insert into diagnosis_code values ('Anthrax', 1);
insert into diagnosis_code values ('Rabies', 2);
insert into diagnosis_code values ('Leuchemia', 3);
insert into diagnosis_code values ('Arrhythmia', 4);
insert into diagnosis_code values ('Diarrea', 5);
insert into diagnosis_code values ('Pneumonia', 6);
insert into diagnosis_code values ('Tumor', 7);
insert into diagnosis_code values ('Zika', 8);
insert into diagnosis_code values ('Obesity', 8);



-- (name, code, date_timestamp, VAT_owner)
insert into consult_diagnosis values ('Jonas', 234, '2018-10-25 08:30:00', 1025);
insert into consult_diagnosis values ('Bruno César', 200, '2018-10-25 12:34:09', 6501);
insert into consult_diagnosis values ('GSon', 2, '2017-05-23 12:34:09', 8521);
insert into consult_diagnosis values ('Sam The Kid', 201, '2017-07-11 17:15:00', 2438);

-- (name, dosage, lab)
insert into medication values ('Aspirina', 2, 'Bayer');
insert into medication values ('Varfine', 1, 'Bayer');
insert into medication values ('Halibut', 1, 'Halibut');
insert into medication values ('Benuron', 2, 'Bene');
insert into medication values ('Brufen', 1, 'Abbott');
insert into medication values ('Boostrix', 4, 'Imovax');

-- (name, code, date_timestamp, VAT_owner, med_name, dosage, lab, regime)
insert into prescription values ('Jonas', 234, '2018-10-25 08:30:00', 1025, 'Aspirina', 2, 'Bayer', 'One time a day');
insert into prescription values ('Jonas', 234, '2018-10-25 08:30:00', 1025, 'Varfine', 1, 'Bayer', 'Two times a day');
insert into prescription values ('Bruno César', 200, '2018-10-25 12:34:09', 6501, 'Halibut', 1, 'Halibut', 'After poop');
insert into prescription values ('GSon', 2, '2017-05-23 12:34:09', 8521, 'Boostrix', 4, 'Imovax', 'One time a day for 4 days');
insert into prescription values ('Sam The Kid', 201, '2017-07-11 17:15:00', 2438, 'Benuron', 2, 'Bene', 'One in the morning and one at night');
insert into prescription values ('Sam The Kid', 201, '2017-07-11 17:15:00', 2438, 'Brufen', 1, 'Abbott', 'One in the morning');

-- (name, reference_value, units, description)
insert into indicator values ('Diabetes', 200, 'milligrams', 'Amount of sugar in blood');
insert into indicator values ('Collestrol', 180, 'milligrams', 'Amount of collestrol in blood');
insert into indicator values ('Red cells', 300, 'units', 'Amount of red cells in blood');
insert into indicator values ('Protease Protein', 10, 'milligrams', 'Infection protein');
insert into indicator values ('White cells', 120, 'units', 'Amount of white cells in blood');
insert into indicator values ('Ureia', 20, 'milligrams', 'Amount of ureia in urine');

-- (name, num, date_timestamp, VAT_owner, description)
insert into proceeding values ('Jonas', 1, '2018-10-25 08:30:00', 1025, 'Analysis');
insert into proceeding values ('Jonas', 2, '2018-10-25 08:30:00', 1025, 'Toraxic Radiography');
insert into proceeding values ('Bruno César', 1, '2018-10-25 12:34:09', 6501, 'Analysis');
insert into proceeding values ('Sam The Kid', 2, '2017-07-11 17:15:00', 2438, 'Toraxic Radiography');
insert into proceeding values ('Sam The Kid', 1, '2017-07-11 17:15:00', 2438, 'Analysis');
insert into proceeding values ('GSon', 1, '2017-05-23 12:34:09', 8521, 'Analysis');
insert into proceeding values ('GSon', 3, '2017-05-23 12:34:09', 8521, 'Analysis');

-- (name, num, date_timestamp, VAT_owner, VAT_assistant)
insert into performed values ('Jonas', 1, '2018-10-25 08:30:00', 1025, 4909);
insert into performed values ('Jonas', 2, '2018-10-25 08:30:00', 1025, 4909);
insert into performed values ('Bruno César', 1, '2018-10-25 12:34:09', 6501, 4909);
insert into performed values ('Sam The Kid', 2, '2017-07-11 17:15:00', 2438, 1833);
insert into performed values ('Sam The Kid', 1, '2017-07-11 17:15:00', 2438, 1833);
insert into performed values ('GSon', 1, '2017-05-23 12:34:09', 8521, 1833);
insert into performed values ('GSon', 3, '2017-05-23 12:34:09', 8521, 1833);

-- (name, num, date_timestamp, VAT_owner, file)
insert into radiography values ('Jonas', 2, '2018-10-25 08:30:00', 1025, 'No significant patologies detected');
insert into radiography values ('Sam The Kid', 2, '2017-07-11 17:15:00', 2438, 'Signs of pneumonia. Little circles more evident in the left lung');

-- (name, num, date_timestamp, VAT_owner, type)
insert into test_procedure values ('Jonas', 1, '2018-10-25 08:30:00', 1025, 'Blood');
insert into test_procedure values ('Bruno César', 1,'2018-10-25 12:34:09', 6501, 'Blood');
insert into test_procedure values ('Sam The Kid', 1, '2017-07-11 17:15:00', 2438, 'Blood');
insert into test_procedure values ('GSon', 1, '2017-05-23 12:34:09', 8521, 'Blood');
insert into test_procedure values ('GSon', 3, '2017-05-23 12:34:09', 8521, 'Urine');

-- (name,num,date_timestamp, VAT_owner, indicator_name, value)
insert into produced_indicator values ('Jonas', 1, '2018-10-25 08:30:00', 1025, 'Diabetes', 250);
insert into produced_indicator values ('Bruno César', 1, '2018-10-25 12:34:09', 6501, 'Diabetes', 350);
insert into produced_indicator values ('Sam The Kid', 1, '2017-07-11 17:15:00', 2438, 'White Cells', 160);
insert into produced_indicator values ('GSon', 1, '2017-05-23 12:34:09', 8521, 'Protease Protein', 30);
insert into produced_indicator values ('GSon', 1, '2017-05-23 12:34:09', 8521, 'Red Cells', 280);
insert into produced_indicator values ('GSon', 3, '2017-05-23 12:34:09', 8521, 'Ureia', 25);
