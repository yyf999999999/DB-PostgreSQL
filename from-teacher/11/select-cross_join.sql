SELECT
  c.character_id,
  c.name,
  j.job_id,
  j.name AS "job"
FROM
  n_characters AS c
  CROSS JOIN n_jobs AS j
ORDER BY
  c.character_id,
  j.job_id;
