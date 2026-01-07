SELECT
  i.item_id,
  i.name,
  c.name AS "holder",
  ci.qty
FROM
  n_items AS i
  LEFT JOIN n_character_items AS ci ON i.item_id = ci.item_id
  LEFT JOIN n_characters AS c ON ci.character_id = c.character_id
ORDER BY
  i.item_id,
  c.character_id;