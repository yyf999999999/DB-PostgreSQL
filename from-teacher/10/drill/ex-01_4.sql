SELECT
  item_id,
  COUNT(*) AS "所持キャラ数",
  SUM(qty) AS "所持総数"
FROM
  x_character_items
GROUP BY
  item_id
ORDER BY
  item_id;