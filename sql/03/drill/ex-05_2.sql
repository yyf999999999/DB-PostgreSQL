SELECT
    id,
    name,
    buff,
    CASE
        WHEN buff > 0 THEN 'buff'
        WHEN buff < 0 THEN 'debuff'
        ELSE '--'
    END AS "battle_position"
FROM
    s_characters;