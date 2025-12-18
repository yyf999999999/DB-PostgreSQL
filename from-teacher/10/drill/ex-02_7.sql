SELECT
  character_id,
  name,
  (
    SELECT
      COUNT(*)
    FROM
      x_character_items AS ci
    WHERE
      character_id = x_characters.character_id
  ) AS item_kinds
FROM
  x_characters
ORDER BY
  character_id;