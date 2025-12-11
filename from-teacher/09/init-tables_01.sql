-- 既に p_characters が存在する場合は削除
DROP TABLE IF EXISTS p_characters;

-- トランザクションの開始
START TRANSACTION;

-- キャラクタテーブルの作成
CREATE TABLE p_characters (
  character_id INTEGER PRIMARY KEY, -- PK指定
  name VARCHAR(16) NOT NULL, -- 非NULL制約
  job VARCHAR(16) NOT NULL, -- 非NULL制約
  guild VARCHAR(16)
);

-- レコードの追加
INSERT INTO
  p_characters (character_id, name, job, guild)
VALUES
  (1, 'Alice', 'Priest', 'Yamato'),
  (2, 'Bob', 'Monk', 'hameln'),
  (3, 'Charlie', 'Wizard', NULL),
  (4, 'Dave', 'Samurai', 'Yamato');

-- テーブルの確認
SELECT
  *
FROM
  p_characters;

-- ロールバックによる処理の取り消し
ROLLBACK;