SELECT
    g.guild_id,
    g.name,
    (
        SELECT
            name
        FROM
            x_characters
        WHERE
            g.owner_id = character_id
    ) AS "owner",
    COUNT(*) AS "member_count",
    ROUND(AVG(c.level), 1) AS "avg_level"
FROM
    x_guilds AS g
    JOIN x_guild_characters AS gc ON g.guild_id = gc.guild_id
    JOIN x_characters AS c ON gc.character_id = c.character_id
WHERE
    c.deleted_at IS NULL
GROUP BY
    g.guild_id
ORDER BY
    "member_count" DESC;