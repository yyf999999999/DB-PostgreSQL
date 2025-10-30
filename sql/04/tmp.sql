START TRANSACTION;

INSERT INTO
    s_users (name, id) -- カラムの順序に注目
VALUES
    ('Carol', 3), -- 指定したカラム順に対応して値を記述
    ('Dave', 4),
    ('Ellen', 5);

SELECT
    *
FROM
    s_users;

-- 確認
ROLLBACK;