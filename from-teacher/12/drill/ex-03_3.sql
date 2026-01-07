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

-- 更新処理 (様々な別解が考えられます)
UPDATE x_items
SET
  price = CEILING(price * 1.2 / 10) * 10
WHERE
  item_id IN (
    SELECT
      i.item_id
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
  )
RETURNING
  item_id,
  name,
  price AS "updated_price";

ROLLBACK;