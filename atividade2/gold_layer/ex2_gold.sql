CREATE OR REPLACE TABLE saraiva.ex2_gold AS
SELECT
    c.uf,
    COUNT(*) AS total_pedidos_estado
FROM
    saraiva.orders_silver o
JOIN
    saraiva.clients_silver c ON c.client_id = o.client_id AND c.company_id = o.company_id
WHERE
    o.order_date >= "2024-01-01" AND o.order_date < "2024-02-01"
GROUP BY
    c.uf