CREATE OR REPLACE TABLE saraiva.camada_silver AS
SELECT
  o.order_id,
  c.nome_fantasia,
  i.product_id,
  i.items_count * i.sale_price AS valor_total,
  o.mes_venda,
  o.ano_venda
FROM
  `saraiva.orders_silver` o
JOIN
  `saraiva.items_silver` i ON o.order_id = i.order_id
JOIN
  `saraiva.clients_silver` c ON o.client_id = c.client_id AND o.company_id = c.company_id