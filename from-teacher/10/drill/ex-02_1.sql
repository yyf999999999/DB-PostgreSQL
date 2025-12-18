SELECT
  item_id,
  name,
  description
FROM
  x_items
WHERE
  item_id NOT IN (
    SELECT
      item_id
    FROM
      x_character_items
  )
ORDER BY
  item_id;