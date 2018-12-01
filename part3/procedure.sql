delimiter //
drop procedure if exists change_refs;

create procedure change_refs ()
  begin

  SET FOREIGN_KEY_CHECKS = 0;
  update produced_indicator
    set value=value/10
    where produced_indicator.indicator_name IN (select I.name
                                                from indicator I
                                                where I.units='milligrams');
  SET FOREIGN_KEY_CHECKS = 1;
  update indicator
    set units = 'centigrams', reference_value = reference_value/10
    where indicator.units='milligrams';
  end
  //

/*

drop table if exists mod_indicators;
create temporary table mod_indicators (name varchar(255));
insert into mod_indicators select P.indicator_name
  from produced_indicator P, indicator I
  where I.units='milligrams' and I.name=P.indicator_name;

  update indicator
    set units = 'milligrams', reference_value = reference_value*10
    where indicator.units='centigrams';
  end

  update produced_indicator
    set value=value/10
    where produced_indicator.indicator_name IN (select indicator.name
      from indicator, mod_indicators
      where indicator.name=mod_indicators.name);
*/
