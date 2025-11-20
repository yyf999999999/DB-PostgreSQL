SELECT
    id,
    name,
    level,
    buff
FROM
    s_characters
WHERE
    NOT buff = 0
ORDER BY
    buff DESC,
    level DESC;