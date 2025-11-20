START TRANSACTION;

SELECT
    buff,
    CAST('2025-10-15' AS DATE) - CAST(last_login_at AS DATE) || '日前' AS "最終ログイン"
FROM
    s_characters
ORDER BY
    id;

UPDATE s_characters
SET
    buff = CASE
        WHEN CAST('2025-10-15' AS DATE) - CAST(last_login_at AS DATE) >= 60 THEN 0.40
        WHEN CAST('2025-10-15' AS DATE) - CAST(last_login_at AS DATE) >= 40 THEN 0.30
        WHEN CAST('2025-10-15' AS DATE) - CAST(last_login_at AS DATE) >= 20 THEN 0.20
        WHEN CAST('2025-10-15' AS DATE) - CAST(last_login_at AS DATE) >= 10 THEN 0.10
        ELSE 0.00
    END;

SELECT
    buff,
    CAST('2025-10-15' AS DATE) - CAST(last_login_at AS DATE) || '日前' AS "最終ログイン"
FROM
    s_characters
ORDER BY
    id;

ROLLBACK;