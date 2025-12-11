-- トランザクションの開始
START TRANSACTION;

-- p_users テーブルの作成 (ここを記述)
-- p_users テーブルにレコードを挿入 (ここを記述)
-- テーブルの確認
SELECT
    *
FROM
    p_users;

-- p_users テーブルを集計 (ここを記述)
-- ロールバックによる処理の取り消し
ROLLBACK;