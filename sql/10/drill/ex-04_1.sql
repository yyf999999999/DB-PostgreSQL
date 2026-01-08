SELECT
    g.guild_id,
    g.name AS "guild",
    c.name AS "member",
    c.level,
    CASE
        WHEN g.owner_id = c.character_id THEN '*'
        ELSE NULL
    END AS "is_owner"
FROM
    x_guilds AS g
    JOIN x_guild_characters AS gc ON g.guild_id = gc.guild_id
    JOIN x_characters AS c ON gc.character_id = c.character_id
WHERE
    c.deleted_at IS NULL
ORDER BY
    g.guild_id,
    c.level DESC;