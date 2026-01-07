START TRANSACTION;

-- 確認: 全キャラの平均レベル
SELECT
  ROUND(AVG(level), 1) AS "avg_lv"
FROM
  x_characters
WHERE
  deleted_at IS NULL;

-- 確認: Yamato所属キャラの現在レベル
SELECT
  character_id,
  name,
  level
FROM
  x_characters
WHERE
  deleted_at IS NULL AND
  character_id IN (
    SELECT
      c.character_id
    FROM
      x_guild_characters AS gc
      JOIN x_characters AS c ON gc.character_id = c.character_id
      JOIN x_guilds AS g ON gc.guild_id = g.guild_id
    WHERE
      g.name = 'Yamato'
  );

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
  c.deleted_at IS NULL AND
  gc.character_id = c.character_id AND
  g.name = 'Yamato'
RETURNING
  c.character_id,
  c.name,
  c.level;

ROLLBACK;