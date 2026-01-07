SELECT
  g.guild_id,
  MAX(g.name) AS "guild",
  MAX(j.name) AS "job",
  COUNT(*) AS "count"
FROM
  x_guild_characters AS gc
  JOIN x_characters AS c ON gc.character_id = c.character_id
  JOIN x_guilds AS g ON gc.guild_id = g.guild_id
  JOIN x_jobs AS j ON j.job_id = c.job_id
WHERE
  c.deleted_at IS NULL
GROUP BY
  g.guild_id,
  j.job_id
ORDER BY
  g.guild_id,
  j.job_id;