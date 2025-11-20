START TRANSACTION;

-- 更新前のレコードを確認
SELECT
    buff
FROM
    s_characters;

-- 更新処理
UPDATE s_characters
SET
    buff = 0.0;

-- 更新後のレコードを確認
SELECT
    buff
FROM
    s_characters;

ROLLBACK;