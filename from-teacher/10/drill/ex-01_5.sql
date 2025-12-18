SELECT
  item_id,
  SUM(qty) AS "所持総数"
FROM
  x_character_items
GROUP BY
  item_id
HAVING
  SUM(qty) >= 6
ORDER BY
  item_id;