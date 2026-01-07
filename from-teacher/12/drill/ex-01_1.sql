-- レコードの全削除（念のため）
TRUNCATE TABLE x_gold_transfers RESTART IDENTITY;

-- トランザクションの開始
START TRANSACTION;

-- リテラル挿入（VALUE句を用いた挿入）
INSERT INTO
  x_gold_transfers (from_character_id, to_character_id, amount, transferred_at)
VALUES
  (6, 8, 1600, '2025-12-28 10:22'),
  (18, 12, 28000, '2025-12-30 01:43'),
  (NULL, 14, 10000, '2026-01-01 00:01');

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
  LEFT JOIN x_characters AS tc ON gt.to_character_id = tc.character_id;

-- ロールバックによる処理の取り消し
ROLLBACK;