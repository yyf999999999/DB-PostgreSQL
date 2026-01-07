START TRANSACTION;

SELECT
  *
FROM
  x_jobs
WHERE
  job_id IN (3, 4);

UPDATE x_jobs
SET
  attack_gain = attack_gain + 1, -- ◀ 変更
  defense_gain = 8 - attack_gain - magic_gain -- ◀ 変更
WHERE
  job_id IN (3, 4) -- ◀ 変更
RETURNING
  *;

ROLLBACK;