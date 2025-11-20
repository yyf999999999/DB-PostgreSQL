SELECT
    id,
    name,
    level,
    guild
FROM
    s_characters
ORDER BY
    LOWER(guild) NULLS FIRST,
    level;

/*
level,
LOWER(guild) NULLS FIRST;
*/