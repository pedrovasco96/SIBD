delimiter $$
create function total_consults(a_name varchar(255), year int)
  returns integer
  begin
    declare total integer;
    select count(*) into total
    from consult C
    where a_name = C.name and year = year(C.date_timestamp);
    return total;
  end$$
  delimiter;
