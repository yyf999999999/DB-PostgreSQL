SELECT
  i.item_id,
  MAX(i.name) AS "name",
  SUM(ci.qty) AS "所持総数"
FROM
  x_character_items AS ci
  JOIN x_items AS i ON ci.item_id = i.item_id
GROUP BY
  i.item_id
HAVING
  SUM(ci.qty) >= 6
ORDER BY
  i.item_id;