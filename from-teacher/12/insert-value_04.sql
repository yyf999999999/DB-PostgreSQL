TRUNCATE TABLE x_gold_transfers RESTART IDENTITY;

START TRANSACTION;

INSERT INTO
  x_gold_transfers (from_character_id, to_character_id, amount, transferred_at)
SELECT
  NULL,
  c.character_id,
  1000,
  gs.transfer_month
FROM
  (
    SELECT
      *
    FROM
      x_characters
    WHERE
      name IN ('Eve', 'Jack')
  ) AS c
  CROSS JOIN LATERAL GENERATE_SERIES(
    DATE_TRUNC('month', c.created_at) + INTERVAL '1 month 2 hour', -- 開始値
    DATE '2024-12-31', -- 列挙範囲の上限値
    INTERVAL '1 month' -- 間隔 (ステップ)
  ) AS gs (transfer_month);

-- created_at の確認
SELECT
  character_id,
  name,
  created_at
FROM
  x_characters
WHERE
  name IN ('Eve', 'Jack');

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
  gt.transferred_at;

ROLLBACK;