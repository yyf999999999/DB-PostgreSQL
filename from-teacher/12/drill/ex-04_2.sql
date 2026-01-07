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

-- 更新処理
UPDATE x_characters AS c
SET
  level = c.level + 2
FROM
  x_character_items AS ci
  JOIN x_items AS i ON i.item_id = ci.item_id
WHERE
  ci.character_id = c.character_id AND
  c.deleted_at IS NULL AND
  i.name = 'High Mana Potion'
RETURNING
  c.character_id,
  c.name,
  c.level AS "updated_level";

ROLLBACK;