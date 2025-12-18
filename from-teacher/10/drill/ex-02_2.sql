SELECT
  item_id,
  name,
  description
FROM
  x_items
WHERE
  item_id IN (
    SELECT
      item_id
    FROM
      x_character_items
    GROUP BY
      item_id
    HAVING
      SUM(qty) <= 5
  ) OR
  item_id NOT IN (
    SELECT
      item_id
    FROM
      x_character_items
  )
ORDER BY
  item_id;