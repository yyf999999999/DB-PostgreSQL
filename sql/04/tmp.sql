SELECT
    id,
    guild AS "所属ギルド",
    name AS "名前",
    level AS "レベル",
    TO_CHAR(last_login_at, 'YYYY"/"MM"/"DD HH24":"MI') AS "最終ログイン"
FROM
    s_characters;