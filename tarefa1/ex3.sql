SELECT
    c.client_id,
    COUNT(o.salesman_id) AS total_vendedor
FROM
    saraiva.orders o
JOIN
    saraiva.clients c ON c.client_id = o.client_id AND c.company_id = o.company_id
WHERE
    o.order_date >= "2023-01-01" AND o.order_date < "2024-01-01"
GROUP BY
    c.client_id
HAVING
    COUNT(o.salesman_id) > 1;