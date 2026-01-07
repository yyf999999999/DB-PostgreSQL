START TRANSACTION;

-- 確認: 現在価格と所持するキャラ人数
SELECT
  i.item_id,
  MAX(i.name) AS "item",
  MAX(i.price) AS "price",
  COUNT(ci.item_id) AS "holder_count"
FROM
  x_items AS i
  LEFT JOIN x_character_items AS ci ON i.item_id = ci.item_id
  LEFT JOIN x_characters AS c ON ci.character_id = c.character_id
WHERE
  c.deleted_at IS NULL
GROUP BY
  i.item_id
ORDER BY
  i.item_id;

-- 更新処理 (様々な別解が考えられます)
SELECT
  i.item_id,
  i.name,
  c.character_id,
  c.name,
  c.deleted_at
FROM
  x_items AS i
  LEFT JOIN x_character_items AS ci ON i.item_id = ci.item_id
  LEFT JOIN x_characters AS c ON ci.character_id = c.character_id
WHERE
  c.deleted_at IS NULL
ORDER BY
  i.item_id;

UPDATE x_items AS i
SET
  price = i.price + (
    SELECT
      CASE
        WHEN COUNT(*) > 0 THEN COUNT(*) * 50
        ELSE -100
      END
    FROM
      x_character_items AS ci
      JOIN x_characters AS c
        ON c.character_id = ci.character_id
    WHERE
      ci.item_id = i.item_id
      AND c.deleted_at IS NULL
  )
RETURNING
  i.item_id,
  i.name,
  i.price AS "updated_price";

-- 更新処理 (様々な別解が考えられます)
-- UPDATE x_items AS i
-- SET
--   price = price + (
--     SELECT
--       CASE
--         WHEN COUNT(ci.item_id) > 0 THEN COUNT(ci.item_id) * 50
--         ELSE -100
--       END
--     FROM
--       x_items AS i1
--       LEFT JOIN x_character_items AS ci ON i1.item_id = ci.item_id
--       LEFT JOIN x_characters AS c ON ci.character_id = c.character_id
--     WHERE
--       c.deleted_at IS NULL AND
--       i1.item_id = i.item_id
--     GROUP BY
--       i1.item_id
--   )
-- RETURNING
--   i.item_id,
--   i.name,
--   i.price AS "updated_price";

ROLLBACK;