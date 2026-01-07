SELECT
  c.character_id,
  c.name,
  CASE
    WHEN c.character_id = g.owner_id THEN '*'
    ELSE ''
  END AS "is_owner"
FROM
  x_guild_characters AS gc
  JOIN x_characters AS c ON gc.character_id = c.character_id
  JOIN x_guilds AS g ON gc.guild_id = g.guild_id
WHERE
  g.name = 'Yamato' AND
  c.deleted_at IS NULL
ORDER BY
  c.character_id;