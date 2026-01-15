START TRANSACTION;

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