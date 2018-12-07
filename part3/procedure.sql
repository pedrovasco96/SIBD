delimiter //
drop procedure if exists change_refs;

create procedure change_refs ()
begin
  update produced_indicator
    set value=value/10
    where produced_indicator.indicator_name IN (select I.name
                                                from indicator I
                                                where I.units='milligrams');
  update indicator
    set units = 'centigrams', reference_value = reference_value/10
    where indicator.units='milligrams';
end//
delimiter ;

-- Call - call change_refs();
