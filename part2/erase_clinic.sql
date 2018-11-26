/*
* ERASES THE CLINIC'S TABLES FROM THE DATABASE
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

drop trigger if exists current_age;
drop trigger if exists not_assist;
drop trigger if exists not_vet;
drop trigger if exists dif_number;

drop function if exists total_consults;
