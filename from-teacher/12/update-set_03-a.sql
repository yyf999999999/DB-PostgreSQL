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

-- 本体: サブクエリを用いた更新処理
UPDATE x_characters AS c
SET
  level = c.level + (
    SELECT
      CASE
        WHEN c.level <= AVG(c1.level) THEN 2
        ELSE 1
      END
    FROM
      x_characters as c1
    WHERE
      c1.deleted_at IS NULL
  ) -- ◀ レベルの増分値をサブクエリで指定
WHERE
  c.deleted_at IS NULL AND
  c.character_id IN (
    SELECT
      c2.character_id
    FROM
      x_guild_characters AS gc
      JOIN x_characters AS c2 ON gc.character_id = c2.character_id
      JOIN x_guilds AS g ON gc.guild_id = g.guild_id
    WHERE
      g.name = 'Yamato'
  ) -- ◀ 更新対象のレコードをサブクエリで指定
RETURNING
  c.character_id,
  c.name,
  c.level;

ROLLBACK;