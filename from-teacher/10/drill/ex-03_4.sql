SELECT
  c.character_id,
  c.name,
  j.name AS "job",
  c.deleted_at
FROM
  x_characters AS c
  JOIN x_jobs AS j ON c.job_id = j.job_id
WHERE
  j.name IN ('Wizard', 'Priest') AND
  c.deleted_at IS NULL
ORDER BY
  c.character_id