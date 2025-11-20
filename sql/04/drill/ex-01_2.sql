SELECT
    id,
    guild,
    level AS "Lv.",
    name || ' (' || job || ')' AS "name (job)"
FROM
    s_characters
ORDER BY
    LOWER(guild),
    level DESC;