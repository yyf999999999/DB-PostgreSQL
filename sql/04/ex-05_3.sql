SELECT
    id,
    name,
    level,
    created_on
FROM
    s_characters
WHERE
    DATE_PART('year', created_on) BETWEEN '2021' AND '2022'
ORDER BY
    created_on;