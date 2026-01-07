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

-- 更新処理
UPDATE x_characters AS c
SET
  level = c.level + 1
FROM
  x_jobs AS j
WHERE
  c.job_id = j.job_id AND
  c.deleted_at IS NULL AND
  j.name NOT IN ('Priest', 'Wizard')
RETURNING
  c.character_id,
  c.name,
  c.level AS "updated_level";

ROLLBACK;