START TRANSACTION;

-- 確認: 現在レベル
SELECT
  c.character_id,
  c.name,
  j.name AS "job",
  c.level
FROM
  x_characters AS c
  JOIN x_jobs AS j ON c.job_id = j.job_id
WHERE
  c.deleted_at IS NULL AND
  j.name NOT IN ('Priest', 'Wizard')
ORDER BY
  c.character_id;

-- 更新処理 (様々な別解が考えられます)
UPDATE x_characters
SET
  level = level + 1
WHERE
  deleted_at IS NULL AND
  character_id IN (
    SELECT
      c.character_id
    FROM
      x_characters AS c
      JOIN x_jobs AS j ON c.job_id = j.job_id
    WHERE
      c.deleted_at IS NULL AND
      j.name NOT IN ('Priest', 'Wizard')
  )
RETURNING
  character_id,
  name,
  level AS "updated_level";

ROLLBACK;