START TRANSACTION;

DELETE FROM s_characters
WHERE
    last_login_at IS NULL AND
    created_on <= CAST('2023-12-31' AS DATE);

SELECT
    *
FROM
    s_characters;

ROLLBACK;