DROP TABLE IF EXISTS p_characters;
DROP TABLE IF EXISTS p_users;
DROP TABLE IF EXISTS p_jobs;

-- テーブル定義・作成
CREATE TABLE p_jobs (
  job_id INTEGER PRIMARY KEY,
  name VARCHAR(16) NOT NULL,
  attack_gain INTEGER NOT NULL,
  defense_gain INTEGER NOT NULL,
  magic_gain INTEGER NOT NULL
);

CREATE TABLE p_users (
  user_id INTEGER PRIMARY KEY,
  name VARCHAR(16) NOT NULL,
  email VARCHAR(32) NOT NULL
);

CREATE TABLE p_characters (
  character_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(16) NOT NULL,
  level INTEGER NOT NULL,
  job_id INTEGER NOT NULL REFERENCES p_jobs (job_id) ON DELETE CASCADE,
  user_id INTEGER NOT NULL REFERENCES p_users (user_id) ON DELETE CASCADE
);

-- レコード挿入
INSERT INTO
  p_jobs (job_id, name, attack_gain, defense_gain, magic_gain)
VALUES
  (1, 'Fighter', 3, 5, -2),
  (2, 'Monk', 4, 0, -1),
  (3, 'Ninja', 5, -1, 0),
  (4, 'Samurai', 3, 3, 2),
  (5, 'Priest', 0, -1, 4),
  (6, 'Wizard', -1, -3, 5);

INSERT INTO
  p_users (user_id, email, name)
VALUES
  (1, 'sarah.s@example.com', 'Sarah Smith'),
  (2, 'james.m@example.com', 'James Miller');

INSERT INTO
  p_characters (name, level, job_id, user_id)
VALUES
  ('Alice', 42, 5, 1),
  ('Bob', 33, 2, 2),
  ('Charlie', 33, 6, 1);

-- レコードの確認
SELECT * FROM p_jobs;
SELECT * FROM p_users;
SELECT * FROM p_characters;

-- 演習: ON DELETE CASCADE の動作確認(1)
DELETE FROM p_jobs WHERE job_id=5; -- Alice が job_id=5 を参照
SELECT * FROM p_characters;

-- 演習: ON DELETE CASCADE の動作確認(2)
DELETE FROM p_users WHERE user_id=2; -- Bob が user_id=2 を参照
SELECT * FROM p_characters;

