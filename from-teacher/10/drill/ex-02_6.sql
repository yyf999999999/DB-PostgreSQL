SELECT
  item_id,
  name,
  weight_kg,
  description
FROM
  x_items
WHERE
  weight_kg = (
    SELECT
      MAX(weight_kg)
    FROM
      x_items
  );