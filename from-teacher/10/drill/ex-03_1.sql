SELECT
  g.guild_id,
  g.name,
  c.name AS "owner_name",
  c.level AS "owner_level"
FROM
  x_guilds AS g
  JOIN x_characters AS c ON g.owner_id = c.character_id
ORDER BY
  g.guild_id;