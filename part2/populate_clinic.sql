/*
* POPULATES THE CLINIC'S TABLES IN THE DATABASE
*/

-- (VAT, name, adress_city, adress_street, address_zip)
-- veterinary
insert into person values (7160, 'Pedro Vasco', 'Lisboa', 'Rua Jorge', '2695-048');
insert into person values (6261, 'John Smith', 'Lisboa', 'Compaund', '9747-202');
insert into person values (6285, 'Jamil Merritt', 'Lisboa', 'Rua da Graca', '1360-965');

-- assistant
insert into person values (4909, 'Sara Vieira', 'Lisboa', 'Risotte', '1697-908');
insert into person values (3533, 'Brenna Pratt', 'Porto', 'Rua da Graca', '2666-901');
insert into person values (7913, 'Shakir Silva', 'Porto', 'Rua da Gloria', '1602-725');
insert into person values (5237, 'Awais Kaiser', 'Porto', 'Avenida da Liberdade', '5850-873');
insert into person values (1833, 'Cecilia Holmes', 'Porto', 'Avenida da Liberdade', '9196-721');

-- client
insert into person values (1025, 'Joao Rodrigues', 'Lisboa', 'Rua Fialho', '2200-238');
insert into person values (1001, 'Erasmus Cannon', 'Porto', 'Avenida da Liberdade', '2314-477');
insert into person values (6501, 'Carlos Brennan', 'Braga', 'Rua 24 de Julho', '5874-773');
insert into person values (3408, 'Miriam Cameron', 'Braga', 'Rua 24 de Julho', '3897-231');
insert into person values (3409, 'Clio Morin', 'Braga', 'Praca Firmino', '3673-594');
insert into person values (2438, 'Jameson Harrison', 'Braga', 'Praca Firmino', '1152-114');
insert into person values (8990, 'Elijah Vargas', 'Braga', 'Praceta do Vale dos Reis', '3634-589');
insert into person values (8424, 'Jared Mcfadden', 'Coimbra', 'Praceta do Vale dos Reis', '6995-225');
insert into person values (7000, 'Solomon Christian', 'Coimbra', 'Praceta do Vale dos Reis', '9975-858');
insert into person values (8521, 'Rossi Rossadas', 'Vialonga', 'VBlock', '3008-678');
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
insert into client values (6261);

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

/*
(name / latin name (when there is no commom name), latin name / description)
general names
*/
insert into species values ('Bird', 'Birds');
insert into species values ('Accipitridae', 'Family');
insert into species values ('Cat', 'Felis catus');
insert into species values ('Dog', 'Canis familiaris');
insert into species values ('Iguanidae', 'Family');
insert into species values ('Bald Eagle', 'Eagle species');
insert into species values ('Sphynx', 'Cat breed');
insert into species values ('Russian Blue', 'Cat breed');
insert into species values ('Labrador', 'Dog breed');
insert into species values ('Papillon', 'Dog breed');
insert into species values ('Shiba Inu', 'Dog breed');
insert into species values ('Doberman', 'Dog breed');
insert into species values ('German Sheppard', 'Dog breed');
insert into species values ('Iguana', 'Iguana');

-- (general name, specific name / breed)
insert into generalization_species values ('Iguana', 'Iguanidae');
insert into generalization_species values ('Accipitridae', 'Bird');
insert into generalization_species values ('Bald Eagle', 'Accipitridae');
insert into generalization_species values ('Sphynx', 'Cat');
insert into generalization_species values ('Russian Blue', 'Cat');
insert into generalization_species values ('Labrador', 'Dog');
insert into generalization_species values ('Papillon', 'Dog');
insert into generalization_species values ('Shiba Inu', 'Dog');
insert into generalization_species values ('Doberman', 'Dog');
insert into generalization_species values ('German Sheppard', 'Dog');

-- (name, VAT, species_name, colour, gender, birth_year, age)
insert into animal values ('Snaiguxo',  1025, 'Labrador', 'brown', 'F',         2012, YEAR(CURDATE())-2012);
insert into animal values ('Elexau',    1025, 'Labrador', 'black', 'M',         2010, YEAR(CURDATE())-2010);
insert into animal values ('Kloukoo',   7000, 'Labrador', 'white', 'M',         2015, YEAR(CURDATE())-2015);
insert into animal values ('Panacuda',  6501, 'Bald Eagle', 'white', 'M',       2005, YEAR(CURDATE())-2005);
insert into animal values ('Amelie',    3408, 'Sphynx', 'white', 'F',           2016, YEAR(CURDATE())-2016);
insert into animal values ('Nel',       5938, 'Papillon', 'white', 'M',         2015, YEAR(CURDATE())-2015);
insert into animal values ('Sofia',     5938, 'Papillon', 'white', 'F',         2015, YEAR(CURDATE())-2015);
insert into animal values ('Tobias',    7000, 'Papillon', 'black', 'M',         2016, YEAR(CURDATE())-2016);
insert into animal values ('Zizzy',     8521, 'Doberman', 'brown', 'M',         2011, YEAR(CURDATE())-2011);
insert into animal values ('Sticeed',   8990, 'Sphynx', 'white', 'M',           2011, YEAR(CURDATE())-2011);
insert into animal values ('Squinnaxi', 6261, 'Papillon', 'white', 'M',         2010, YEAR(CURDATE())-2010);
insert into animal values ('Allen',     2438, 'Shiba Inu', 'black', 'M',        1994, YEAR(CURDATE())-1994);
insert into animal values ('Valete',    2438, 'Shiba Inu', 'black', 'M',        2015, YEAR(CURDATE())-2015);
insert into animal values ('Bispo',     8424, 'Shiba Inu', 'white', 'M',        2017, YEAR(CURDATE())-2017);
insert into animal values ('Spinou',    8424, 'Shiba Inu', 'white', 'F',        2013, YEAR(CURDATE())-2013);
insert into animal values ('Xaamingo',  1001, 'German Sheppard', 'brown', 'M',  2015, YEAR(CURDATE())-2015);
insert into animal values ('Regula',    1001, 'German Sheppard', 'white', 'F',  2015, YEAR(CURDATE())-2015);
insert into animal values ('Dolite',    8521, 'Doberman', 'black', 'M',         2009, YEAR(CURDATE())-2009);
insert into animal values ('Bikey',     8521, 'Russian Blue', 'black', 'M',     2008, YEAR(CURDATE())-2008);
insert into animal values ('Kroa',      8521, 'Iguana', 'green', 'M',           2014, YEAR(CURDATE())-2014);

/*(name, VAT_owner, date_timestamp, s, o, a, p, VAT_client, VAT_vet, weight)
s:subjetive observation
o:objective observation
a:assessment
p:plan*/
insert into consult values ('Snaiguxo',   1025, '2016-10-25 08:30:00', 'First Evaluation',            'anthrax', 'NA', 'NA', 1025, 7160, 25.2);
insert into consult values ('Elexau',     1025, '2016-10-25 10:30:00', 'First Evaluation',            'anthrax', 'NA', 'NA', 1025, 7160, 24.5);
insert into consult values ('Panacuda',   6501, '2016-10-25 10:30:00', 'First Evaluation',            'leuchemia', 'NA', 'NA', 6501, 6261, 7);
insert into consult values ('Nel',        5938, '2016-10-29 12:50:00', 'First Evaluation',            'obesity', 'NA', 'Improved Diet', 5938, 6261, 35);
insert into consult values ('Dolite',     8521, '2016-10-31 12:30:00', 'First Evaluation',            'arrhythmia and obese', 'NA', 'NA', 8521, 6261, 36);
insert into consult values ('Nel',        5938, '2017-02-27 10:30:00', 'Showed signs of improvement', 'has obesity', 'NA', 'Improved Diet', 5938, 6261, 32);
insert into consult values ('Squinnaxi',  6261, '2017-07-11 17:15:00', 'First Evaluation',            'rabies', 'NA', 'NA', 2438, 7160, 8);
insert into consult values ('Allen',      2438, '2017-10-25 16:30:00', 'First Evaluation',            'pneumonia', 'NA', 'NA', 2438, 6261, 13);
insert into consult values ('Kroa',       8521, '2017-10-25 16:30:00', 'First Evaluation',            'obese', 'NA', 'NA', 6261, 7160, 9.5);
insert into consult values ('Nel',        5938, '2018-02-27 10:30:00', 'Much improvement',            'NA', 'NA', 'NA', 5938, 6261, 12);

-- (name, VAT_owner, date_timestamp, VAT_assistant)
insert into participation values ('Snaiguxo',   1025, '2016-10-25 08:30:00', 4909);
insert into participation values ('Panacuda',   6501, '2016-10-25 10:30:00', 4909);
insert into participation values ('Dolite',     8521, '2016-10-31 12:30:00', 3533);
insert into participation values ('Squinnaxi',  6261, '2017-07-11 17:15:00', 7913);

-- (name, code)
insert into diagnosis_code values ('Anthrax', 1);
insert into diagnosis_code values ('Rabies', 2);
insert into diagnosis_code values ('Leuchemia', 3);
insert into diagnosis_code values ('Kidney failure', 4);
insert into diagnosis_code values ('Diarrea', 5);
insert into diagnosis_code values ('Pneumonia', 6);
insert into diagnosis_code values ('Tumor', 7);
insert into diagnosis_code values ('Zika', 8);
insert into diagnosis_code values ('Obesity', 9);

-- (code, name, VAT_owner, date_timestamp)
insert into consult_diagnosis values (1, 'Snaiguxo',   1025, '2016-10-25 08:30:00');
insert into consult_diagnosis values (1, 'Elexau',     1025, '2016-10-25 10:30:00');
insert into consult_diagnosis values (3, 'Panacuda',   6501, '2016-10-25 10:30:00');
insert into consult_diagnosis values (9, 'Nel',        5938, '2016-10-29 12:50:00');
insert into consult_diagnosis values (4, 'Dolite',     8521, '2016-10-31 12:30:00');
insert into consult_diagnosis values (9, 'Nel',        5938, '2017-02-27 10:30:00');
insert into consult_diagnosis values (4, 'Squinnaxi',  6261, '2017-07-11 17:15:00');
insert into consult_diagnosis values (6, 'Allen',      2438, '2017-10-25 16:30:00');

-- (name, dosage, lab)
insert into medication values ('Aspirine', 2, 'Bayer');
insert into medication values ('Varfine', 1, 'Bayer');
insert into medication values ('Halibut', 1, 'Halibut');
insert into medication values ('Benuron', 2, 'Bene');
insert into medication values ('Brufen', 1, 'Abbott');
insert into medication values ('Boostrix', 4, 'Imovax');

-- (code, name, VAT_owner, date_timestamp, med_name, dosage, lab, regime)
insert into prescription values (1, 'Snaiguxo',   1025, '2016-10-25 08:30:00', 'Aspirine', 2, 'Bayer', 'One time a day');
insert into prescription values (1, 'Elexau',     1025, '2016-10-25 10:30:00', 'Varfine', 1, 'Bayer', 'Two times a day');
insert into prescription values (3, 'Panacuda',   6501, '2016-10-25 10:30:00', 'Halibut', 1, 'Halibut', 'After poop');
insert into prescription values (4, 'Dolite',     8521, '2016-10-31 12:30:00', 'Benuron', 2, 'Bene', 'One time a day for 4 days');
insert into prescription values (4, 'Squinnaxi',  6261, '2017-07-11 17:15:00', 'Brufen', 1, 'Abbott', 'One in the morning and one at night');
insert into prescription values (6, 'Allen',      2438, '2017-10-25 16:30:00', 'Boostrix', 4, 'Imovax', 'One in the morning');

-- (name, reference_value, units, description)
insert into indicator values ('Diabetes', 200, 'milligrams', 'Amount of sugar in blood');
insert into indicator values ('Collestrol', 180, 'milligrams', 'Amount of collestrol in blood');
insert into indicator values ('Red cells', 300, 'units', 'Amount of red cells in blood');
insert into indicator values ('Protease Protein', 10, 'milligrams', 'Infection protein');
insert into indicator values ('White cells', 120, 'units', 'Amount of white cells in blood');
insert into indicator values ('Ureia', 20, 'milligrams', 'Amount of ureia in urine');
insert into indicator values ('Creatinine level', 0.8, 'milligrams', 'Amount of creatinine in the blood');
insert into indicator values ('Lymphocytes', 200, 'milligrams', 'Amount of lymphocytes in the blood');
insert into indicator values ('Monocytes', 300, 'milligrams', 'Amount of monocytes in the blood');
insert into indicator values ('Neutrophils', 300, 'milligrams', 'Amount of neutrophils in the blood');

-- (num, name, VAT_owner, date_timestamp, description)
insert into operation values (default, 'Snaiguxo',   1025, '2016-10-25 08:30:00', 'Analysis');
insert into operation values (default, 'Snaiguxo',   1025, '2016-10-25 08:30:00', 'Toraxic Radiography');
insert into operation values (default, 'Panacuda',   6501, '2016-10-25 10:30:00', 'Analysis');
insert into operation values (default, 'Squinnaxi',  6261, '2017-07-11 17:15:00', 'Toraxic Radiography');
insert into operation values (default, 'Squinnaxi',  6261, '2017-07-11 17:15:00', 'Analysis');
insert into operation values (default, 'Dolite',     8521, '2016-10-31 12:30:00', 'Analysis');
insert into operation values (default, 'Dolite',     8521, '2016-10-31 12:30:00', 'Analysis');

-- (num, name, VAT_owner, date_timestamp, VAT_assistant)
insert into performed values (2,'Snaiguxo',   1025, '2016-10-25 08:30:00', 4909);
insert into performed values (4,'Snaiguxo',   1025, '2016-10-25 08:30:00', 4909);
insert into performed values (6,'Panacuda',   6501, '2016-10-25 10:30:00', 4909);
insert into performed values (8,'Squinnaxi',  6261, '2017-07-11 17:15:00', 1833);
insert into performed values (10,'Squinnaxi',  6261, '2017-07-11 17:15:00', 1833);
insert into performed values (12,'Dolite',     8521, '2016-10-31 12:30:00', 1833);
insert into performed values (14,'Dolite',     8521, '2016-10-31 12:30:00', 1833);

-- (num, name, VAT_owner, date_timestamp, file)
insert into radiography values (4,'Snaiguxo',   1025, '2016-10-25 08:30:00', 'rad/1025/20161025/');
insert into radiography values (8,'Squinnaxi',  6261, '2017-07-11 17:15:00', 'rad/2438/20170711/');

-- (num,name, VAT_owner, date_timestamp, type)
insert into test_procedure values (2,'Snaiguxo',   1025, '2016-10-25 08:30:00', 'blood');
insert into test_procedure values (6,'Panacuda',   6501, '2016-10-25 10:30:00', 'blood');
insert into test_procedure values (10,'Squinnaxi',  6261, '2017-07-11 17:15:00', 'blood');
insert into test_procedure values (12,'Dolite',     8521, '2016-10-31 12:30:00', 'blood');
insert into test_procedure values (14,'Dolite',     8521, '2016-10-31 12:30:00', 'urine');

-- (num, name, VAT_owner, date_timestamp, indicator_name, value)
insert into produced_indicator values (2,'Snaiguxo',   1025, '2016-10-25 08:30:00', 'Lymphocytes', 250);
insert into produced_indicator values (6,'Panacuda',   6501, '2016-10-25 10:30:00', 'Monocytes', 350);
insert into produced_indicator values (6,'Panacuda',   6501, '2016-10-25 10:30:00', 'White Cells', 120);
insert into produced_indicator values (10,'Squinnaxi',  6261, '2017-07-11 17:15:00', 'White Cells', 160);
insert into produced_indicator values (10,'Squinnaxi',  6261, '2017-07-11 17:15:00', 'Neutrophils', 100);
insert into produced_indicator values (12,'Dolite',     8521, '2016-10-31 12:30:00', 'Monocytes', 330);
insert into produced_indicator values (12,'Dolite',     8521, '2016-10-31 12:30:00', 'Lymphocytes', 280);
insert into produced_indicator values (12,'Dolite',     8521, '2016-10-31 12:30:00', 'Neutrophils', 120);
insert into produced_indicator values (14,'Dolite',     8521, '2016-10-31 12:30:00', 'Ureia', 25);
