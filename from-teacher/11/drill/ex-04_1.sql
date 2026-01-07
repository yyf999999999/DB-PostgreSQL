SELECT
  COALESCE(c1.item_id, c2.item_id, c3.item_id) AS "i_id",
  COALESCE(c1.item_name, c2.item_name, c3.item_name) AS "item_name",
  c1.qty AS "Marvin",
  c2.qty AS "Jack",
  c3.qty AS "Alice",
  COALESCE(c1.description, c2.description, c3.description) AS "description"
FROM
  (
    SELECT
      i.item_id,
      i.name AS "item_name",
      ci.qty,
      i.description
    FROM
      x_characters AS c
      JOIN x_character_items AS ci ON ci.character_id = c.character_id
      JOIN x_items AS i ON ci.item_id = i.item_id
    WHERE
      c.name = 'Marvin'
  ) AS c1
  FULL OUTER JOIN (
    SELECT
      i.item_id,
      i.name AS "item_name",
      ci.qty,
      i.description
    FROM
      x_characters AS c
      JOIN x_character_items AS ci ON ci.character_id = c.character_id
      JOIN x_items AS i ON ci.item_id = i.item_id
    WHERE
      c.name = 'Jack'
  ) AS c2 ON c1.item_id = c2.item_id
  FULL OUTER JOIN (
    SELECT
      i.item_id,
      i.name AS "item_name",
      ci.qty,
      i.description
    FROM
      x_characters AS c
      JOIN x_character_items AS ci ON ci.character_id = c.character_id
      JOIN x_items AS i ON ci.item_id = i.item_id
    WHERE
      c.name = 'Alice'
  ) AS c3 ON c2.item_id = c3.item_id
ORDER BY
  COALESCE(c1.item_id, c2.item_id, c3.item_id);