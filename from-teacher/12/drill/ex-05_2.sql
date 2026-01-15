START TRANSACTION;

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