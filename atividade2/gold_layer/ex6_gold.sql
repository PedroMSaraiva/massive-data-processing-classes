CREATE OR REPLACE TABLE saraiva.ex6_gold AS
SELECT
  uf,
  FORMAT_DATE('%A', order_date) AS dia_semana,
  AVG(valor_total_dia) AS media_valor_total
FROM (
  SELECT 
    c.uf AS uf,
    o.order_date AS order_date,
    SUM(i.items_count * i.sale_price) AS valor_total_dia
  FROM
    `saraiva.items_silver` i,
    `saraiva.clients_silver` c
  JOIN
    `saraiva.orders_silver` o
    ON i.order_id = o.order_id AND c.client_id = i.client_id
  WHERE
    EXTRACT(YEAR FROM o.order_date) = 2024
  GROUP BY
    c.uf, o.order_date
) vendas_diarias
GROUP BY
  uf, dia_semana
ORDER BY
  uf, dia_semana;
