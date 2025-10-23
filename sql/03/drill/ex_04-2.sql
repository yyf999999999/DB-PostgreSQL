SELECT
    id,
    level AS "Level",
    CEIL(level * 1.2) AS "Boosted Level"
FROM
    s_characters;