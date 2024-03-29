delimiter //
drop function if exists total_consults;
create function total_consults(v_owner int, a_name varchar(255), year int)
  returns integer
  begin
    declare total integer;
    select count(*) into total
    from consult C
    where a_name = C.name and v_owner = C.VAT_owner and year = year(C.date_timestamp);
    return total;
  end
//
delimiter ;

-- example call:
/*
select total_consults(5938, 'Nel', 2017);
*/
