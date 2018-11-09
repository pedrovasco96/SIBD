-- VIEWS
-- 3
CREATE VIEW facts_consults AS
(SELECT dim_animal.name, dim_animal.VAT_owner, dim_date.date_timestamp, count(distinct pro.num) as 'distinct procedures', count(distinct pre.med_name) 'distinct medications'
	FROM
		dim_date, dim_animal, consult
		left outer join test_procedure pro
			on (pro.name, pro.VAT_owner, pro.date_timestamp) = (consult.name, consult.VAT_owner, consult.date_timestamp)
		left outer join prescription pre
			on (pre.name, pre.VAT_owner, pre.date_timestamp) = (consult.name, consult.VAT_owner, consult.date_timestamp)
		where (consult.name, consult.VAT_owner) = (dim_animal.name, dim_animal.VAT_owner)
		and consult.date_timestamp = dim_date.date_timestamp
	group by consult.name, consult.date_timestamp, consult.VAT_owner
);
