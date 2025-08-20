SELECT
    c.uf,
    COUNT(*) AS total_pedidos_estado
FROM
    saraiva.orders o
JOIN
    saraiva.clients c ON c.client_id = o.client_id AND c.company_id = o.company_id
WHERE
    o.order_date >= "2022-01-01" AND o.order_date < "2022-02-01"
GROUP BY
    c.uf