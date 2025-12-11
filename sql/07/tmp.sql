-- 既に存在するなら削除
DROP TABLE IF EXISTS p_characters;

-- テーブルの作成
CREATE TABLE p_characters (
    character_id INTEGER PRIMARY KEY, -- 整数型、PK
    name VARCHAR(16) NOT NULL, -- 可変長文字列(最大16文字)
    buff DECIMAL(3, 2) NOT NULL, -- 固定小数点数型 (-9.99〜9.99)
    is_online BOOLEAN NOT NULL, -- 真偽値
    notes TEXT, -- 可変長文字列(実質無制限)
    created_on DATE NOT NULL, -- 日付型
    last_login_at TIMESTAMP -- 日時型(タイムゾーンなし)
);

-- レコードの挿入
INSERT INTO
    p_characters (character_id, name, buff, is_online, notes, created_on, last_login_at)
VALUES
    (
        6,
        'Alice',
        0.00,
        TRUE,
        NULL,
        DATE '2021-06-14',
        TIMESTAMP '2025-09-18 14:22:00'
    ),
    (
        8,
        'Bob',
        9.99,
        FALSE,
        'Admin note: Detected abnormal behavior; monitoring enabled.',
        DATE '2022-03-22',
        TIMESTAMP '2025-08-03 09:11:00'
    );

-- レコードの確認
SELECT
    *
FROM
    p_characters;