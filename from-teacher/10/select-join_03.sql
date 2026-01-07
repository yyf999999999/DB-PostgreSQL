SELECT
  c.character_id,
  c.name AS "character",
  i.item_id,
  i.name AS "item",
  ci.qty
FROM
  x_characters AS c
  JOIN x_character_items AS ci ON c.character_id = ci.character_id
  JOIN x_items AS i ON i.item_id = ci.item_id
ORDER BY
  c.character_id,
  i.item_id;