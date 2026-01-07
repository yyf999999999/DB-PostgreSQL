SELECT
  c.character_id,
  c.name,
  i.name,
  ci.qty
FROM
  n_characters AS c
  LEFT JOIN n_character_items AS ci ON c.character_id = ci.character_id
  LEFT JOIN n_items AS i ON ci.item_id = i.item_id
ORDER BY
  c.character_id;