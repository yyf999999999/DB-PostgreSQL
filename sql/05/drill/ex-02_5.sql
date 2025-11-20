START TRANSACTION;

SELECT
    id,
    job
FROM
    s_characters
ORDER BY
    id;

UPDATE s_characters
SET
    job = CASE
        WHEN job = 'Fighter' THEN 'Monk'
        WHEN job = 'Monk' THEN 'Samurai'
        WHEN job = 'Samurai' THEN 'Ninja'
        WHEN job = 'Ninja' THEN 'Fighter'
    END
WHERE
    job IN ('Fighter', 'Monk', 'Samurai', 'Ninja');

SELECT
    id,
    job
FROM
    s_characters
ORDER BY
    id;

ROLLBACK;