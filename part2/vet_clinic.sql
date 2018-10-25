drop table if exists person;
drop table if exists phone_number;
drop table if exists client;
drop table if exists assistant;
drop table if exists veterinary;
drop table if exists species;
drop table if exists generalization_species;
drop table if exists animal;
drop table if exists consult;
drop table if exists participation;
drop table if exists consult_diagnosis;
drop table if exists diagnosis_code;
drop table if exists medication;
drop table if exists prescription;
drop table if exists indicator;
drop table if exists procedure;
drop table if exists performed;
drop table if exists radiography;
drop table if exists test_procedure;
drop table if exists procedure_indicator;

create table person
   (VAT  int(10),
    name  varchar(255),
    adress_city  varchar(255),
    adress_street  varchar(255),
    adress_zip  varchar(255),
    primary key(VAT));

create table phone_number
   (VAT  int(10),
    phone  int(9),
    primary key(VAT,phone),
    foreign key(VAT) references person(VAT));

create table client
   (VAT  int(10),
    primary key(VAT),
    foreign key(VAT) references person(VAT));

create table assistant
   (VAT  int(10),
    primary key(VAT),
    foreign key(VAT) references person(VAT));

create table veterinary
   (VAT  int(10),
    specialization varchar(255),
    bio text,
    primary key(VAT),
    foreign key(VAT) references person(VAT));

create table species
   (name  varchar(255),
    description text,
    primary key(name));

create table generalization_species
   (name1  varchar(255),
    name2  varchar(255),
    primary key(name1),
    foreign key(name1) references species(name),
    foreign key(name2) references species(name));

create table animal
   (name  varchar(255),
    VAT  int(10),
    species_name varchar(255),
    colour varchar(255),
    gender char(1),
    birth_year year,
    age int(3), -- should be computed from year
    primary key(name,VAT),
    foreign key(VAT) references client(VAT),
    foreign key(species_name) references species(name));

create table consult
   (name  varchar(255),
    VAT_owner  int(10),
    date_timestamp timestamp,
    s text,
    o text,
    a text,
    p text,
    VAT_client  int(10),
    VAT_vet  int(10),
    weight numeric(5,2) UNSIGNED,
    primary key(name,VAT_owner,date_timestamp),
    foreign key(VAT_owner,name) references animal(VAT,name),
    foreign key(VAT_client) references client(VAT),
    foreign key(VAT_vet) references veterinary(VAT));

create table participation
   (name  varchar(255),
    VAT_owner  int(10),
    date_timestamp timestamp,
    VAT_assistant  int(10),
    primary key(name,VAT_owner,date_timestamp,VAT_assistant),
    foreign key(VAT_owner,name,date_timestamp) references consult(VAT_owner,name,date_timestamp),
    foreign key(VAT_assistant) references assistant(VAT));

create table diagnosis_code
   (name  varchar(255),
    code  int(10),
    primary key(code));

create table consult_diagnosis
   (name  varchar(255),
    code  int(10),
    date_timestamp timestamp,
    VAT_owner  int(10),
    primary key(name,VAT_owner,date_timestamp,code),
    foreign key(VAT_owner,name,date_timestamp) references consult(VAT_owner,name,date_timestamp),
    foreign key(code) references diagnosis_code(code));

create table medication
   (name  varchar(255),
    dosage  int(5),
    lab  varchar(255),
    primary key(name,lab,dosage));

create table prescription
   (name  varchar(255),
    code  int(10),
    date_timestamp timestamp,
    VAT_owner  int(10),
    med_name varchar(255),
    dosage  int(5),
    lab  varchar(255),
    regime varchar(255),
    primary key(name,VAT_owner,date_timestamp,code,med_name,dosage,lab),
    foreign key(code,name,VAT_owner,date_timestamp) references consult_diagnosis(VAT_owner,name,date_timestamp,code),
    foreign key(med_name,lab,dosage) references medication(name, dosage, lab));

create table indicator
   (name  varchar(255),
    reference_value  numeric(10,4),
    units  varchar(255),
    description text,
    primary key(name));

create table procedure
   (name  varchar(255),
    num  int(10),
    date_timestamp timestamp,
    VAT_owner  int(10),
    description text,
    primary key(name,VAT_owner,date_timestamp,num),
    foreign key(name,VAT_owner,date_timestamp) references consult(VAT_owner,name,date_timestamp));
-- check RI

create table performed
   (name  varchar(255),
    num  int(10),
    date_timestamp timestamp,
    VAT_owner  int(10),
    VAT_assistant int(10),
    primary key(name,VAT_owner,date_timestamp,num,VAT_assistant),
    foreign key(name,VAT_owner,date_timestamp,num) references procedure(VAT_owner,name,date_timestamp,num),
    foreign key(VAT_assistant) references assistant(VAT));

create table radiography
   (name  varchar(255),
    num  int(10),
    date_timestamp timestamp,
    VAT_owner  int(10),
    file text,
    primary key(name,VAT_owner,date_timestamp,num),
    foreign key(name,VAT_owner,date_timestamp,num) references procedure(VAT_owner,name,date_timestamp,num));

create table test_procedure
   (name  varchar(255),
    num  int(10),
    date_timestamp timestamp,
    VAT_owner  int(10),
    type char(5),
    primary key(name,VAT_owner,date_timestamp,num),
    foreign key(name,VAT_owner,date_timestamp,num) references procedure(VAT_owner,name,date_timestamp,num));
-- check RI

create table procedure_indicator
   (name  varchar(255),
    num  int(10),
    date_timestamp timestamp,
    VAT_owner  int(10),
    indicator_name varchar(255),
    value numeric(10,4),
    primary key(name,VAT_owner,date_timestamp,num,indicator_name),
    foreign key(name,VAT_owner,date_timestamp,num) references test_procedure(VAT_owner,name,date_timestamp,num),
    foreign key(indicator_name) references indicator(name));
