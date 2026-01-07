SELECT
  c.character_id,
  c.name,
  COALESCE(j.name, '---') AS "job"
FROM
  n_jobs AS j
  RIGHT JOIN n_characters AS c ON c.job_id = j.job_id
ORDER BY
  c.character_id;