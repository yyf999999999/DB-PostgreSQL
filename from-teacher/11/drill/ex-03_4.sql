SELECT
  i.item_id,
  MAX(i.name) AS "name",
  COUNT(c.character_id) AS "holder_count"
FROM
  n_items AS i
  LEFT JOIN n_character_items AS ci ON i.item_id = ci.item_id
  LEFT JOIN n_characters AS c ON ci.character_id = c.character_id
GROUP BY
  i.item_id
ORDER BY
  i.item_id;