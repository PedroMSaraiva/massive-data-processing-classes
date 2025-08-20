SELECT 
  s.salesman,
  SUM(o.items_count) AS total_volume,
FROM
  `saraiva.orders` o
JOIN
  `saraiva.sellers` s 
ON
  o.salesman_id = s.salesman_id
GROUP BY
  s.salesman
ORDER BY
  total_volume DESC
LIMIT 1; -- Ele especifica que quer o vendedor com maior volume.