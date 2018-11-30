delimiter $$
drop procedure if exists change_refs;
drop table if exists prod;
create procedure change_refs ()
  begin

  declare @prod table(name varchar(30));
  select P.indicator_name into @prod
    from produced_indicator P, indicator I
    where I.units='miligrams' and I.name=P.produced_indicator);

  update produced_indicator
    set value=value/10
    where produced_indicator.indicator_name=(select *
      from indicator, prod
      where indicator.name=prod.name);
  drop table if exists prod;

  update indicator
    set units = 'centigrams', reference_value = reference_value/10
    where indicator.units='miligrams';

  end $$
