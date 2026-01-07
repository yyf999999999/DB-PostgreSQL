TRUNCATE TABLE x_gold_transfers RESTART IDENTITY;

START TRANSACTION;

-- サブクエリを用いたレコードの挿入
INSERT INTO
  x_gold_transfers (from_character_id, to_character_id, amount, transferred_at)
SELECT
  NULL,
  character_id,
  500,
  created_at + INTERVAL '5 minute'
FROM
  x_characters;

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
  gt.to_character_id;

ROLLBACK;