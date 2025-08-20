
WITH vendas_estado_produto AS (
  SELECT 
    c.uf,
    i.product_id,
    SUM(i.items_count) AS total_quantidade,
    SUM(i.items_count * i.sale_price) AS valor_total
  FROM
    `saraiva.items` i
  JOIN
    `saraiva.clients` c ON i.client_id = c.client_id
  GROUP BY
    c.uf, i.product_id
),
ranking AS (
  SELECT 
    *,
    ROW_NUMBER() OVER (PARTITION BY uf ORDER BY total_quantidade DESC) AS posicao
  FROM
    vendas_estado_produto
)
SELECT
  uf,
  product_id,
  total_quantidade,
  valor_total
FROM 
  ranking
WHERE
  posicao = 1
ORDER BY
  uf;