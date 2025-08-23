CREATE OR REPLACE TABLE saraiva.pedidos_silver AS
SELECT
    t1.client_id,
    COALESCE(SAFE_CAST(t1.items_count AS INT64), 0) AS items_count,
    t1.order_date,
    t1.order_id,
    t1.salesman_id,
    COALESCE(SAFE_CAST(t1.company_id AS INT64), 0) AS company_id,
    EXTRACT(YEAR FROM t1.order_date) AS ano_venda,
    EXTRACT(MONTH FROM t1.order_date) AS mes_venda
FROM
    saraiva.pedidos AS t1
QUALIFY ROW_NUMBER() OVER (PARTITION BY t1.order_id, t1.company_id ORDER BY t1.order_id) = 1;