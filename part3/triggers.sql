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
/*year(CURRENT_TIMESTAMP) - (select a.birth_year from animal a
                           where a.VAT = new.VAT_owner and a.name = new.name;)*/

-- 2 - Check if doctor is not assitant
delimiter $$
create trigger not_assist before insert on veterinary
for each row
begin
  delete from assistant
    where assistant.VAT = new.VAT;
end$$
delimiter;

delimiter $$
create trigger not_vet before insert on assistant
for each row
begin
  delete from veterinary
    where veterinary.VAT = new.VAT;
end$$
delimiter;

-- 3 - Check if no individuals have the same phone number - AVISO!!
delimiter $$
create trigger dif_pnumber before insert on person
for each row
begin

end$$
delimiter;
