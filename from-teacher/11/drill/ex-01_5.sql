SELECT
  i1.name || ' (' || i1.price || ')' AS "item_1 (price)",
  i2.name || ' (' || i2.price || ')' AS "item_2 (price)",
  ROUND((i1.price + i2.price) * 0.7) AS "discounted_price"
FROM
  x_items AS i1
  JOIN x_items AS i2 ON i1.item_id < i2.item_id -- 組み合わせの重複防止
WHERE
  ROUND((i1.price + i2.price) * 0.7) >= 3500
ORDER BY
  i1.item_id,
  i2.item_id;