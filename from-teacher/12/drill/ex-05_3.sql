START TRANSACTION;

UPDATE x_items AS i
SET
  price = CEILING(i.price * 1.2 / 10) * 10
FROM
  (
    SELECT
      ci.item_id
    FROM
      x_character_items AS ci
      JOIN x_characters AS c ON c.character_id = ci.character_id
    WHERE
      c.deleted_at IS NULL
    GROUP BY
      ci.item_id
    HAVING
      SUM(ci.qty) >= 6
  ) AS s
WHERE
  i.item_id = s.item_id
RETURNING
  i.item_id,
  i.name,
  i.price AS "updated_price";

ROLLBACK;