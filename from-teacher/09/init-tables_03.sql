DROP TABLE IF EXISTS p_characters;

START TRANSACTION;

-- キャラクタテーブルの作成
CREATE TABLE p_characters (
  character_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, -- 自動採番
  name VARCHAR(16) NOT NULL
);

-- レコードの追加
INSERT INTO
  p_characters (name) -- character_id を省略
VALUES
  ('Alice'),
  ('Bob');

-- テーブルの確認 1
SELECT
  *
FROM
  p_characters;

-- レコードの全件削除
DELETE FROM p_characters;

-- レコードの再挿入
INSERT INTO
  p_characters (name)
VALUES
  ('Alice'),
  ('Bob'),
  ('Carol');

-- テーブルの確認 2
SELECT
  *
FROM
  p_characters;

ROLLBACK;