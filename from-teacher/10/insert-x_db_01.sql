CREATE EXTENSION IF NOT EXISTS pgcrypto;

START TRANSACTION;

-- レコードの削除
TRUNCATE TABLE x_gold_transfers,
x_character_items,
x_guild_characters,
x_guilds,
x_characters,
x_jobs,
x_items RESTART IDENTITY;

-- ジョブレコードの挿入
INSERT INTO
  x_jobs (job_id, name, attack_gain, defense_gain, magic_gain)
VALUES
  (1, 'Fighter', 3, 5, -2),
  (2, 'Monk', 4, 0, -1),
  (3, 'Ninja', 5, -1, 0),
  (4, 'Samurai', 3, 3, 2),
  (5, 'Priest', 0, -1, 4),
  (6, 'Wizard', -1, -3, 5);

-- キャラレコードの挿入
INSERT INTO
  x_characters (character_id, name, job_id, level, created_at)
VALUES
  (1, 'Marvin', 5, 35, '2020-09-23 13:32:00'),
  (2, 'Zach', 3, 62, '2020-10-25 21:12:00'),
  (3, 'Charlie', 6, 57, '2020-12-05 10:15:00'),
  (4, 'Tom', 1, 1, '2020-12-05 18:40:00'),
  (5, 'Ivan', 2, 39, '2021-02-15 09:05:00'),
  (6, 'Alice', 5, 42, '2021-06-14 14:20:00'),
  (7, 'Trudy', 1, 48, '2021-11-28 19:10:00'),
  (8, 'Bob', 2, 33, '2022-03-22 11:45:00'),
  (9, 'Walter', 4, 73, '2022-04-06 22:10:00'),
  (10, 'Oscar', 1, 44, '2022-11-10 16:30:00'),
  (11, 'Ellen', 6, 51, '2022-08-30 20:55:00'),
  (12, 'Dave', 4, 68, '2023-01-19 15:08:00'),
  (13, 'Mallet', 6, 64, '2023-02-02 18:50:00'),
  (14, 'Eve', 3, 46, '2023-09-07 10:17:00'),
  (15, 'Trent', 5, 50, '2023-10-04 17:20:00'),
  (16, 'Steve', 4, 70, '2024-01-27 09:14:00'),
  (17, 'Wendy', 1, 56, '2024-03-18 10:56:00'),
  (18, 'Carol', 5, 28, '2024-05-11 11:42:00'),
  (19, 'Jack', 6, 61, '2024-07-12 15:43:00');

-- アイテムレコードの挿入
INSERT INTO
  x_items (item_id, name, price, weight_kg, description)
VALUES
  (1, 'Potion', 200, 0.2, '単体HPを小回復'),
  (2, 'High Potion', 600, 0.2, '単体HPを中回復'),
  (3, 'Mega Potion', 1200, 0.3, '単体HPを大回復'),
  (4, 'Giga Potion', 4000, 0.3, '単体HPを完全回復'),
  (5, 'Mana Potion', 1000, 0.1, '単体MPを小回復'),
  (6, 'High Mana Potion', 5000, 0.2, '単体MPを大回復'),
  (7, 'Antidote', 300, 0.1, '毒状態を回復'),
  (8, 'Paralyze Cure', 600, 0.1, '麻痺状態を回復'),
  (9, 'Angel Feather', 1200, 0.1, '戦闘不能を回復'),
  (10, 'Chimera Wing', 500, 0.1, '指定の街に瞬間移動'),
  (11, 'Torch', 820, 1.5, '洞窟内を明るく照らす'),
  (12, 'Climbing Rope', 1000, 1.5, '崖や段差を乗り越える');

-- ギルドレコードの挿入
INSERT INTO
  x_guilds (guild_id, name, owner_id)
VALUES
  (1, 'Yamato', 1),
  (2, 'D.D.D', 11),
  (3, 'hameln', 8);

-- キャラ/ギルドレコードの挿入
INSERT INTO
  x_guild_characters (guild_id, character_id)
VALUES
  (1, 1), -- Yamato
  (1, 12),
  (1, 15),
  (1, 6),
  (1, 7),
  (2, 11), -- D.D.D
  (2, 2),
  (2, 6),
  (2, 13),
  (2, 14),
  (2, 17),
  (3, 8), -- hameln
  (3, 10),
  (3, 12),
  (3, 16),
  (3, 19);

-- キャラクタの論理削除 
UPDATE x_characters
SET
  deleted_at = '2023-08-31 07:10:00'
WHERE
  name = 'Walter';

UPDATE x_characters
SET
  deleted_at = '2024-01-02 23:25:00'
WHERE
  name = 'Trent';

COMMIT;

INSERT INTO
  x_character_items (character_id, item_id, qty)
VALUES
  (1, 1, 2),
  (1, 7, 1),
  (1, 10, 1),
  (2, 3, 1),
  (2, 11, 2),
  (3, 6, 1),
  (3, 9, 2),
  (4, 1, 1),
  (5, 2, 2),
  (5, 7, 1),
  (6, 5, 2),
  (6, 9, 1),
  (6, 10, 1),
  (7, 1, 10),
  (7, 12, 1),
  (7, 11, 1),
  (9, 1, 1),
  (9, 7, 2),
  (9, 9, 1),
  (9, 10, 1),
  (12, 3, 1),
  (12, 11, 2),
  (13, 6, 2),
  (13, 9, 1),
  (14, 2, 1),
  (14, 5, 3),
  (14, 10, 1),
  (15, 1, 2),
  (15, 11, 3),
  (16, 7, 2),
  (16, 10, 1),
  (17, 5, 4),
  (17, 11, 1),
  (18, 7, 2),
  (19, 3, 1),
  (19, 6, 1),
  (19, 9, 1),
  (19, 10, 2);

-- INSERT INTO
--   x_character_items (character_id, item_id, qty)
-- VALUES
--   (9, 8, 1);  -- Walter , Paralyze Cure, 1個
  
SELECT
  *
FROM
  x_characters
ORDER BY
  character_id;

SELECT
  *
FROM
  x_jobs;

SELECT
  *
FROM
  x_items;

SELECT
  *
FROM
  x_character_items;
