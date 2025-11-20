START TRANSACTION;

SELECT
    job,
    guild,
    buff
FROM
    s_characters
ORDER BY
    id;

UPDATE s_characters
SET
    buff = buff + 0.25
WHERE
    guild IS NULL AND
    job IN ('Fighter', 'Monk', 'Samurai', 'Ninja');

SELECT
    job,
    guild,
    buff
FROM
    s_characters
ORDER BY
    id;

ROLLBACK;