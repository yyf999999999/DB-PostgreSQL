START TRANSACTION;

UPDATE x_items AS i
SET
  price = i.price + pd.price_delta
FROM
  (
    SELECT
      i2.item_id AS "item_id",
      CASE
        WHEN COUNT(c.character_id) > 0 THEN COUNT(c.character_id) * 50
        ELSE -100
      END AS "price_delta"
    FROM
      x_items AS i2
      LEFT JOIN x_character_items AS ci ON i2.item_id = ci.item_id
      LEFT JOIN x_characters AS c ON (
        c.character_id = ci.character_id AND
        c.deleted_at IS NULL
      )
    GROUP BY
      i2.item_id
  ) AS pd
WHERE
  i.item_id = pd.item_id
RETURNING
  i.item_id,
  i.name,
  i.price AS "updated_price";

ROLLBACK;