START TRANSACTION;

-- 現在値の確認
SELECT
  *
FROM
  x_jobs
WHERE
  job_id = 4;

-- 更新処理 (更新後の値の確認)
UPDATE x_jobs
SET
  attack_gain = 5,
  defense_gain = 4
WHERE
  job_id = 4
RETURNING
  *;

ROLLBACK;