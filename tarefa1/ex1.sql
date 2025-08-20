SELECT
    o.client_id,
    c.nome_fantasia,
    o.company_id,
    COUNT(o.client_id) AS total_pedidos
FROM
    saraiva.orders o
JOIN
    saraiva.clients c ON c.client_id = o.client_id AND c.company_id = o.company_id
WHERE
    o.order_date >= "2021-01-01" AND o.order_date <= "2022-01-01"
GROUP BY
    o.client_id, o.company_id, c.nome_fantasia
ORDER BY
    total_pedidos DESC
LIMIT 10