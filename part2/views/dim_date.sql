-- VIEWS
-- 1
CREATE VIEW dim_date AS
SELECT date_timestamp, DAY(date_timestamp), MONTH(date_timestamp), YEAR(date_timestamp)
FROM consult
GROUP BY date_timestamp
ORDER BY YEAR(date_timestamp) DESC;
