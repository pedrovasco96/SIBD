UPDATE indicator
SET reference_value = 1.1 * reference_value
WHERE units='milligrams'
      AND (description LIKE '%blood%'
          OR name IN (SELECT P.indicator_name
                      FROM test_procedure T, produced_indicator P
                      WHERE T.type='Blood'
                      AND T.date_timestamp=P.date_timestamp));
