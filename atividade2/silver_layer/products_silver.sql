CREATE OR REPLACE TABLE saraiva.products_silver AS
SELECT
    TRIM(COALESCE(t1.id, '')) AS id,
    TRIM(COALESCE(t1.name, '')) AS name,
    SAFE_CAST(t1.register_date AS TIMESTAMP) AS register_date,
    COALESCE(SAFE_CAST(t1.company_id AS INT64), 0) AS company_id
FROM
    saraiva.pedidos AS t1
QUALIFY ROW_NUMBER() OVER (PARTITION BY t1.order_id, t1.company_id ORDER BY t1.order_id) = 1;