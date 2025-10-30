START TRANSACTION;

INSERT INTO
    s_characters (name, job, level, buff, guild, last_login_at, created_on)
VALUES
    ('Zoe', 'Paladin', 11, 0.00, 'W.Wind', '2025-10-20 15:48:00', '2025-10-12'),
    ('Justin', 'Archer', 2, 0.50, NULL, '2025-10-23 11:28:00', '2025-10-23');

SELECT
    *
FROM
    s_characters;

ROLLBACK;