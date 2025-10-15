SELECT
  id,
  name,
  last_login_at,
  (CAST('2025-10-15' AS DATE) - CAST(last_login_at AS DATE)) || '日前' AS "最終ログイン"
FROM
  s_characters;