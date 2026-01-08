SELECT
    g.guild_id,
    g.name AS "guild",
    j.name AS "job",
    COUNT(*) AS "count"
FROM
    x_guilds AS g
    JOIN x_guild_characters AS gc ON g.guild_id = gc.guild_id
    JOIN x_characters AS c ON gc.character_id = c.character_id
    JOIN x_jobs AS j ON c.job_id = j.job_id
WHERE
    c.deleted_at IS NULL
GROUP BY
    g.guild_id,
    j.job_id
ORDER BY
    g.guild_id,
    j.job_id;