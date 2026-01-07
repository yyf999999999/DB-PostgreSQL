SELECT
  g.guild_id,
  g.name AS "guild",
  c.name AS "member",
  c.level AS "level",
  CASE
    WHEN g.owner_id = c.character_id THEN '*'
    ELSE ''
  END AS "is_owner"
FROM
  x_guild_characters AS gc
  JOIN x_characters AS c ON gc.character_id = c.character_id
  JOIN x_guilds AS g ON gc.guild_id = g.guild_id
WHERE
  c.deleted_at IS NULL
ORDER BY
  g.guild_id,
  CASE
    WHEN g.owner_id = c.character_id THEN 0
    ELSE 1
  END,
  c.level DESC;