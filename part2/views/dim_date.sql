-- VIEWS
-- 1
CREATE VIEW dim_date AS
SELECT date_timestamp, DAY(date_timestamp) as 'day', MONTH(date_timestamp) as 'month', YEAR(date_timestamp) as 'year'
FROM consult
GROUP BY date_timestamp
ORDER BY YEAR(date_timestamp) DESC;
