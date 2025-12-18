CREATE EXTENSION IF NOT EXISTS pgcrypto;

DROP TABLE IF EXISTS p_characters;

START TRANSACTION;

CREATE TABLE p_characters (
    character_id UUID DEFAULT GEN_RANDOM_UUID() PRIMARY KEY, -- UUID型、自動生成
    name VARCHAR(16) NOT NULL,
    level INTEGER DEFAULT (FLOOR(RANDOM() * 20) + 1) -- デフォルト値：1～20の整数乱数
);

INSERT INTO
    p_characters (name)
VALUES
    ('Alice'),
    ('Bob'),
    ('Carol');

SELECT
    *
FROM
    p_characters;

ROLLBACK;