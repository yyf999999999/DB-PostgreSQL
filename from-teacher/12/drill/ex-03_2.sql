START TRANSACTION;

-- 確認: 現在レベル
SELECT
  c.character_id,
  c.name,
  c.level
FROM
  x_items AS i
  JOIN x_character_items AS ci ON i.item_id = ci.item_id
  JOIN x_characters AS c ON ci.character_id = c.character_id
WHERE
  c.deleted_at IS NULL AND
  i.name = 'High Mana Potion'
ORDER BY
  c.character_id;

-- 更新処理 (様々な別解が考えられます)
UPDATE x_characters
SET
  level = level + 2
WHERE
  deleted_at IS NULL AND
  character_id IN (
    SELECT
      ci.character_id
    FROM
      x_items AS i
      JOIN x_character_items AS ci ON i.item_id = ci.item_id
    WHERE
      i.name = 'High Mana Potion'
  )
RETURNING
  character_id,
  name,
  level AS "updated_level";

ROLLBACK;