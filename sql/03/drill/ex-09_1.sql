SELECT
    id,
    name,
    last_login_at,
    '2025-10-15' - CAST(last_login_at AS DATE) || '日前' AS "最終ログイン"
FROM
    s_characters;