CREATE OR REPLACE TABLE saraiva.items_silver AS
SELECT
    client_id,
    COALESCE(SAFE_CAST(items_count AS INT64), 0) AS items_count,
    COALESCE(SAFE_CAST(list_price AS FLOAT64), 0.0) AS list_price,
    order_id,
    product_id,
    COALESCE(SAFE_CAST(sale_price AS FLOAT64), 0.0) AS sale_price,
    salesman_id,
    COALESCE(SAFE_CAST(seq_number AS INT64), 0) AS seq_number,
    COALESCE(SAFE_CAST(company_id AS INT64), 0) AS company_id,
    COALESCE(SAFE_CAST(items_count AS INT64), 0) * COALESCE(SAFE_CAST(sale_price AS FLOAT64), 0.0) AS valor_total
FROM
    saraiva.items
QUALIFY ROW_NUMBER() OVER (PARTITION BY order_id, seq_number, company_id ORDER BY order_id, seq_number) = 1;