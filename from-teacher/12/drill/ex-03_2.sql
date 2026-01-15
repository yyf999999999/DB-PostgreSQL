TRUNCATE TABLE x_gold_transfers RESTART IDENTITY;

START TRANSACTION;

-- サブクエリを用いたレコードの挿入
INSERT INTO
  x_gold_transfers (from_character_id, to_character_id, amount, transferred_at)
SELECT
  c.character_id,
  g.owner_id,
  2000,
  '2025-12-15 04:00'
FROM
  x_guild_characters AS gc
  JOIN x_characters AS c ON gc.character_id = c.character_id
  JOIN x_guilds AS g ON gc.guild_id = g.guild_id
WHERE
  c.deleted_at IS NULL AND
  g.owner_id <> c.character_id;

-- 確認
SELECT
  LEFT(gt.transfer_id::TEXT, 8) AS "id",
  COALESCE(fc.name, '_SYS_') AS "from",
  COALESCE(tc.name, '_SYS_') AS "to",
  TO_CHAR(amount, '999,999') AS "amount",
  gt.transferred_at
FROM
  x_gold_transfers AS gt
  LEFT JOIN x_characters AS fc ON gt.from_character_id = fc.character_id
  LEFT JOIN x_characters AS tc ON gt.to_character_id = tc.character_id
ORDER BY
  gt.to_character_id,
  gt.from_character_id;

ROLLBACK;