DROP TABLE IF EXISTS n_character_items;

DROP TABLE IF EXISTS n_characters;

DROP TABLE IF EXISTS n_items;

DROP TABLE IF EXISTS n_jobs;

-- アイテムのマスタテーブル
CREATE TABLE n_items (item_id INTEGER PRIMARY KEY, name VARCHAR(32) NOT NULL UNIQUE);

INSERT INTO
  n_items (item_id, name)
VALUES
  (1, 'Potion'),
  (2, 'High Potion'),
  (3, 'Mega Potion'),
  (4, 'Giga Potion'),
  (5, 'Mana Potion');

-- ジョブのマスタテーブル
CREATE TABLE n_jobs (job_id INTEGER PRIMARY KEY, name VARCHAR(16) NOT NULL UNIQUE);

INSERT INTO
  n_jobs (job_id, name)
VALUES
  (1, 'Fighter'),
  (2, 'Monk'),
  (3, 'Ninja'),
  (4, 'Samurai'),
  (5, 'Priest'),
  (6, 'Wizard');

-- キャラクタのマスタテーブル
CREATE TABLE n_characters (
  character_id INTEGER PRIMARY KEY,
  name VARCHAR(16) NOT NULL,
  job_id INTEGER REFERENCES n_jobs (job_id) ON DELETE SET NULL
);

INSERT INTO
  n_characters (character_id, name, job_id)
VALUES
  (1, 'Marvin', 5),
  (2, 'Zach', NULL),
  (3, 'Charlie', 6),
  (4, 'Tom', 1),
  (5, 'Alice', 5);

-- キャラクタが所持するアイテムと数量を管理する中間テーブル
CREATE TABLE n_character_items (
  character_id INTEGER REFERENCES n_characters (character_id) ON DELETE CASCADE,
  item_id INTEGER REFERENCES n_items (item_id),
  qty INTEGER NOT NULL CHECK (qty >= 0),
  PRIMARY KEY (character_id, item_id)
);

INSERT INTO
  n_character_items (character_id, item_id, qty)
VALUES
  (1, 1, 3),
  (1, 2, 2),
  (1, 3, 1),
  (2, 3, 1),
  (4, 1, 2),
  (4, 5, 3);