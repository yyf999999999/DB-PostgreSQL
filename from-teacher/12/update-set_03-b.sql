START TRANSACTION;

-- 本体: FROM句を用いた更新処理
UPDATE x_characters AS c
SET
  level = c.level + CASE
    WHEN c.level <= a.avg_level THEN 2
    ELSE 1
  END
FROM
  x_guild_characters AS gc
  JOIN x_guilds AS g ON g.guild_id = gc.guild_id
  CROSS JOIN (
    SELECT
      AVG(level) AS avg_level
    FROM
      x_characters
    WHERE
      deleted_at IS NULL
  ) AS a
WHERE
  c.character_id = gc.character_id AND
  c.deleted_at IS NULL AND
  g.name = 'Yamato'
RETURNING
  c.character_id,
  c.name,
  c.level;

ROLLBACK;