SELECT
    MAX(LENGTH(COALESCE(guild, 'Freelancer')))
FROM
    s_characters;