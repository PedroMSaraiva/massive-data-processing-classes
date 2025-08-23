CREATE OR REPLACE TABLE saraiva.top_10_clientes_2023 AS
SELECT
    o.client_id,
    c.nome_fantasia,
    o.company_id,
    COUNT(o.client_id) AS total_pedidos
FROM
    saraiva.orders_silver o
JOIN
    saraiva.clients_silver c ON c.client_id = o.client_id AND c.company_id = o.company_id
WHERE
    o.order_date >= "2022-01-01" AND o.order_date <= "2023-01-01"
GROUP BY
    o.client_id, o.company_id, c.nome_fantasia
ORDER BY
    total_pedidos DESC
LIMIT 10