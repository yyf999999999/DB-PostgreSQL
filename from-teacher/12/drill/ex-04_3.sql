START TRANSACTION;

-- 確認: 現在価格
SELECT
  i.item_id,
  MAX(i.name) AS "item",
  MAX(i.price) AS "price",
  SUM(ci.qty) AS "total"
FROM
  x_items AS i
  JOIN x_character_items AS ci ON i.item_id = ci.item_id
  JOIN x_characters AS c ON ci.character_id = c.character_id
WHERE
  c.deleted_at IS NULL
GROUP BY
  i.item_id
HAVING
  SUM(ci.qty) >= 6
ORDER BY
  i.item_id;

-- 更新処理
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