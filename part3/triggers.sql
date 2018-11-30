-- 1 - update animal's age after new scheduled consult
delimiter //
drop trigger if exists current_age;
create trigger current_age after insert on consult
for each row
begin
declare new_age integer;
set new_age = year(CURRENT_TIMESTAMP) - (select a.birth_year from animal a
                                         where a.VAT_owner = new.VAT_owner and a.name = new.name);
update animal
set animal.age = new_age
where animal.VAT_owner = NEW.VAT_owner and animal.name = NEW.name;
end
//

-- 2 - update animal's age after new scheduled consult
delimiter //
drop trigger if exists check_veterinary;
create trigger check_veterinary before insert on assistant
for each row
begin
IF (SELECT * FROM veterinary WHERE veterinary.VAT=NEW.VAT IS NOT NULL) THEN 
SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning: New assistant is already a veterinary!';
END IF;
end
//

delimiter //
drop trigger if exists check_assistant;
create trigger check_assistant before insert on veterinary
for each row
begin
IF (SELECT * FROM assistant WHERE assistant.VAT=NEW.VAT IS NOT NULL) THEN 
SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning: New veterinary is already an assistant!';
END IF;
end
//

-- 3 - Check if no individuals have the same phone number - AVISO!!
delimiter $$
create trigger dif_pnumber before insert on person
for each row
begin

end$$
delimiter;
