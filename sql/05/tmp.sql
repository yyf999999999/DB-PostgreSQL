START TRANSACTION;

-- 更新前のレコードを確認
SELECT
    id,
    name,
    job,
    guild
FROM
    s_characters
ORDER BY
    id;

-- 更新処理
UPDATE s_characters
SET
    job = CASE
        WHEN job = 'Priest' THEN 'Wizard'
        ELSE 'Priest'
    END
WHERE
    job IN ('Wizard', 'Priest');

-- 更新後のレコードを確認
SELECT
    id,
    name,
    job,
    guild
FROM
    s_characters
ORDER BY
    id;

ROLLBACK;