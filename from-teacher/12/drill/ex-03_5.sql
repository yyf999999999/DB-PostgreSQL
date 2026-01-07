START TRANSACTION;

-- 確認: ジョブごとのキャラ人数（論理削除済みキャラを除く）
SELECT
  j.job_id,
  MAX(j.name) AS "job",
  COUNT(c.character_id) AS "count"
FROM
  x_jobs AS j
  LEFT JOIN x_characters AS c ON j.job_id = c.job_id
WHERE
  c.deleted_at IS NULL
GROUP BY
  j.job_id
ORDER BY
  j.job_id;

-- 確認: 現在のキャラレベル
SELECT
  c.character_id,
  c.name,
  j.name AS "job",
  level,
  CASE
    WHEN c.deleted_at IS NULL THEN ''
    ELSE '*'
  END AS "is_deleted"
FROM
  x_jobs AS j
  LEFT JOIN x_characters AS c ON j.job_id = c.job_id
ORDER BY
  c.character_id;

-- 更新処理 (様々な別解が考えられます)
UPDATE x_characters AS c
SET
  level = level + (
    SELECT
      COUNT(c1.character_id)
    FROM
      x_jobs AS j
      LEFT JOIN x_characters AS c1 ON j.job_id = c1.job_id
    WHERE
      c1.deleted_at IS NULL
    GROUP BY
      j.job_id
    HAVING
      j.job_id = c.job_id
  )
WHERE
  c.deleted_at IS NULL
RETURNING
  c.character_id,
  c.name,
  c.job_id,
  c.level AS "updated_level";

ROLLBACK;