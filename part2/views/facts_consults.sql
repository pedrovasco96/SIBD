-- VIEWS
-- 3
CREATE VIEW facts_consults AS
(SELECT A.name, A.VAT_owner AS VAT, D.date_timestamp AS timestamp
  FROM dim_animal A, dim_date D, consult C
  WHERE A.name=C.name AND A.VAT_owner=C.VAT_owner AND D.date_timestamp=C.date_timestamp
  GROUP BY A.name, A.VAT_owner, D.date_timestamp
);

(SELECT count(*) FROM procedure WHERE A.name=name
AND A.VAT_owner=VAT_owner AND D.date_timestamp=date_timestamp) AS num_procedures,
(SELECT count(distinct med_name) FROM prescription WHERE A.name=name
AND A.VAT_owner=VAT_owner AND D.date_timestamp=date_timestamp) AS num_medications;
