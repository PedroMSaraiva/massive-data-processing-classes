CREATE OR REPLACE TABLE saraiva.sellers_silver AS
SELECT
    TRIM(COALESCE(t1.salesman_id, '')) AS salesman_id,
    TRIM(COALESCE(t1.salesman, '')) AS salesman,
    COALESCE(SAFE_CAST(t1.company_id AS INT64), 0) AS company_id
FROM
    saraiva.sellers AS t1
QUALIFY ROW_NUMBER() OVER (PARTITION BY t1.salesman_id, t1.company_id ORDER BY t1.salesman_id) = 1;