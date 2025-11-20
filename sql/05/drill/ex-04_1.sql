SELECT
    COALESCE(guild, '無所属'),
    COUNT(*) AS "num",
    MAX(level) AS "max_lv",
    MIN(level) AS "min_lv",
    MAX(buff) AS "max_buff",
    MIN(buff) AS "min_buff"
FROM
    s_characters
WHERE
    guild <> 'Yamato' OR
    guild IS NULL
GROUP BY
    guild
ORDER BY
    LOWER(guild) NULLS FIRST;
