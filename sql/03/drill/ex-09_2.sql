SELECT
    id,
    name,
    last_login_at,
    '2025-10-15' - CAST(last_login_at AS DATE) || 'days ago' AS "Days Since Last Login",
    CASE
        WHEN '2025-10-15' - CAST(last_login_at AS DATE) <= 50 THEN 'Yes'
        ELSE 'No'
    END AS "Is Active User?"
FROM
    s_characters;