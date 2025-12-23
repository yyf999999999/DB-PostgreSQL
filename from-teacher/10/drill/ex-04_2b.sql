-- 相関サブクエリを併用して実装する例
SELECT
  g.guild_id,
  MAX(g.name) AS "name",
  (
    SELECT
      name
    FROM
      x_characters
    WHERE
      character_id = g.owner_id
  ) AS "owner",
  COUNT(*) AS "member_count",
  ROUND(AVG(c.level), 1) AS "avg_level"
FROM
  x_guild_characters AS gc
  JOIN x_characters AS c ON gc.character_id = c.character_id
  JOIN x_guilds AS g ON gc.guild_id = g.guild_id
WHERE
  c.deleted_at IS NULL
GROUP BY
  g.guild_id
ORDER BY
  COUNT(*) DESC;