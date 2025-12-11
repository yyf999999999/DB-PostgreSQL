-- 既に p_characters が存在する場合は削除
DROP TABLE IF EXISTS p_characters;

-- トランザクションの開始
START TRANSACTION;

-- キャラクタテーブルの作成
CREATE TABLE p_characters (
  character_id INTEGER PRIMARY KEY,
  name VARCHAR(16) NOT NULL,
  job VARCHAR(16) NOT NULL,
  level INTEGER NOT NULL DEFAULT 1, -- 1 を デフォルト値に設定
  guild VARCHAR(16) DEFAULT NULL, -- NULL を 〃
  created_on DATE DEFAULT CURRENT_DATE, -- 現在日付を 〃
  updated_at TIMESTAMP DEFAULT LOCALTIMESTAMP(0) -- 現在日時(TZなし)を 〃
);

-- レコードの追加 1
INSERT INTO
  p_characters (character_id, name, job)
VALUES
  (1, 'Alice', 'Priest');

-- レコードの追加 2
INSERT INTO
  p_characters (character_id, name, job, guild)
VALUES
  (2, 'Bob', 'Priest', 'hameln');

-- レコードの追加 3
INSERT INTO
  p_characters (character_id, name, job, level, created_on)
VALUES
  (3, 'Charlie', 'Wizard', 5, '2025-10-30'),
  (4, 'Dave', 'Samurai', 20, '2025-08-10');

-- テーブルの確認
SELECT
  character_id,
  name,
  job,
  level,
  guild,
  created_on,
  updated_at AS updated_at
FROM
  p_characters;

-- ロールバックによる処理の取り消し
ROLLBACK;