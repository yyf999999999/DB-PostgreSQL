-- ここでは x_**** のテーブル群を使用します。
-- `from-teacher/10/create-x_db.sql` と 
-- `insert-x_db_01.sql` が実行されている前提です。
SELECT
  COALESCE(c1.character_id, c2.character_id) AS "c_id",
  c1.name AS "Yamato",
  c2.name AS "D.D.D"
FROM
  (
    SELECT
      c.character_id,
      c.name
    FROM
      x_characters AS c
      JOIN x_guild_characters AS gc ON gc.character_id = c.character_id
      JOIN x_guilds AS g ON gc.guild_id = g.guild_id
    WHERE
      g.name = 'Yamato'
  ) AS c1
  FULL OUTER JOIN ( -- ◀ 完全外部結合
    SELECT
      c.character_id,
      c.name
    FROM
      x_characters AS c
      JOIN x_guild_characters AS gc ON gc.character_id = c.character_id
      JOIN x_guilds AS g ON gc.guild_id = g.guild_id
    WHERE
      g.name = 'D.D.D'
  ) AS c2 ON c1.character_id = c2.character_id
ORDER BY
  c1.character_id,
  c2.character_id;