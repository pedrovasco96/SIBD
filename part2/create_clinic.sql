/*
* CREATES THE CLINIC'S TABLES IN THE DATABASE
*/
drop table if exists produced_indicator;
drop table if exists indicator;
drop table if exists test_procedure;
drop table if exists performed;
drop table if exists radiography;
drop table if exists operation;
drop table if exists prescription;
drop table if exists medication;
drop table if exists consult_diagnosis;
drop table if exists diagnosis_code;
drop table if exists participation;
drop table if exists consult;
drop table if exists animal;
drop table if exists generalization_species;
drop table if exists species;
drop table if exists client;
drop table if exists assistant;
drop table if exists veterinary;
drop table if exists phone_number;
drop table if exists person;

create table person
   (VAT  int(10),
    name  varchar(255),
    address_city  varchar(255),
    address_street  varchar(255),
    address_zip  varchar(255),
    primary key(VAT));

create table phone_number
   (VAT  int(10),
    phone  int(9),
    primary key(VAT,phone),
    foreign key(VAT) references person(VAT) on delete cascade on update cascade
  );

create table client
   (VAT  int(10),
    primary key(VAT),
    foreign key(VAT) references person(VAT) on delete cascade on update cascade
  );

create table assistant
   (VAT  int(10),
    primary key(VAT),
    foreign key(VAT) references person(VAT) on delete cascade on update cascade
  );

create table veterinary
   (VAT  int(10),
    specialization varchar(255),
    bio text,
    primary key(VAT),
    foreign key(VAT) references person(VAT) on delete cascade on update cascade
  );

/*
GRANT ALTER ON ist181843.person
alter table person
add constraint chk_subclass CHECK (VAT IN (SELECT VAT FROM client
                                           UNION SELECT VAT FROM veterinary
                                           UNION SELECT VAT FROM assistant));
*/

create table species
   (name  varchar(255),
    description text,
    primary key(name));

create table generalization_species
   (name1  varchar(255),
    name2  varchar(255),
    primary key(name1),
    foreign key(name1) references species(name) on delete cascade on update cascade,
    foreign key(name2) references species(name) on delete cascade on update cascade);

create table animal
   (name  varchar(255),
    VAT_owner  int(10),
    species_name varchar(255),
    colour varchar(255),
    gender enum('M','F'),
    birth_year year,
    age int(3), -- should be computed from year
    primary key(name,VAT_owner),
    foreign key(VAT_owner) references client(VAT) on delete cascade on update cascade,
    foreign key(species_name) references species(name) on delete cascade on update cascade
  );

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
    foreign key(VAT_owner,name) references animal(VAT_owner,name) on delete cascade on update cascade,
    foreign key(VAT_client) references client(VAT) on delete cascade on update cascade,
    foreign key(VAT_vet) references veterinary(VAT) on delete cascade on update cascade
  );

create table participation
   (name  varchar(255),
    VAT_owner  int(10),
    date_timestamp timestamp,
    VAT_assistant  int(10),
    primary key(name,VAT_owner,date_timestamp,VAT_assistant),
    foreign key(name,VAT_owner,date_timestamp) references consult(name,VAT_owner,date_timestamp) on delete cascade on update cascade,
    foreign key(VAT_assistant) references assistant(VAT) on delete cascade on update cascade
  );

create table diagnosis_code
   (name  varchar(255),
    code  int(10),
    primary key(code));

create table consult_diagnosis
   (code  int(10),
    name  varchar(255),
    VAT_owner  int(10),
    date_timestamp timestamp,
    primary key(code,name,VAT_owner,date_timestamp),
    constraint FK_consult foreign key(name, VAT_owner, date_timestamp) references consult(name, VAT_owner, date_timestamp) on delete cascade on update cascade,
    constraint FK_code foreign key(code) references diagnosis_code(code) on delete cascade on update cascade
  );

create table medication
   (name  varchar(255),
    dosage  int(5),
    lab  varchar(255),
    primary key(name,lab,dosage));

create table prescription
   (code int(10),
    name  varchar(255),
    VAT_owner  int(10),
    date_timestamp timestamp,
    med_name varchar(255),
    dosage  int(5),
    lab  varchar(255),
    regime varchar(255),
    primary key(code, name,VAT_owner,date_timestamp,med_name,dosage,lab),
    foreign key(code, name, VAT_owner,date_timestamp) references consult_diagnosis(code, name, VAT_owner, date_timestamp) on delete cascade on update cascade,
    foreign key(med_name,lab,dosage) references medication(name, lab, dosage) on delete cascade on update cascade
  );

create table indicator
   (name  varchar(255),
    reference_value  numeric(10,4),
    units  varchar(255),
    description text,
    primary key(name));

create table operation
   (num  int NOT NULL AUTO_INCREMENT,
    name  varchar(255),
    VAT_owner  int(10),
    date_timestamp timestamp,
    description text,
    primary key(num,name,VAT_owner,date_timestamp),
    foreign key(name,VAT_owner,date_timestamp) references consult(name,VAT_owner,date_timestamp) on delete cascade on update cascade
  );
-- check RI

create table performed
   (num  int,
    name  varchar(255),
    VAT_owner  int(10),
    date_timestamp timestamp,
    VAT_assistant int(10),
    primary key(num, name,VAT_owner,date_timestamp,VAT_assistant),
    foreign key(num,name,VAT_owner,date_timestamp) references operation(num,name,VAT_owner,date_timestamp) on delete cascade on update cascade,
    foreign key(VAT_assistant) references assistant(VAT) on delete cascade on update cascade
  );

create table radiography
   (num  int,
    name  varchar(255),
    VAT_owner  int(10),
    date_timestamp timestamp,
    file text,
    primary key(num,name,VAT_owner,date_timestamp),
    foreign key(num,name,VAT_owner,date_timestamp) references operation(num,name,VAT_owner,date_timestamp) on delete cascade on update cascade
  );

create table test_procedure
   (num  int,
    name  varchar(255),
    VAT_owner  int(10),
    date_timestamp timestamp,
    type enum('blood','urine'),
    primary key(num, name,VAT_owner,date_timestamp),
    foreign key(num,name,VAT_owner,date_timestamp) references operation(num,name,VAT_owner,date_timestamp) on delete cascade on update cascade
  );

create table produced_indicator
   (num  int,
    name  varchar(255),
    VAT_owner  int(10),
    date_timestamp timestamp DEFAULT CURRENT_TIMESTAMP,
    indicator_name varchar(255),
    value numeric(10,4),
    primary key(num,name,VAT_owner,date_timestamp,indicator_name),
    foreign key(num,name,VAT_owner,date_timestamp) references test_procedure(num,name,VAT_owner,date_timestamp) on delete cascade on update cascade,
    foreign key(indicator_name) references indicator(name)
  );
