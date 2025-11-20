START TRANSACTION;

DELETE FROM s_characters
WHERE
    CAST('2025-10-15' AS DATE) - CAST(last_login_at AS DATE) >= 60 OR
    last_login_at IS NULL;

SELECT
    *
FROM
    s_characters;

ROLLBACK;