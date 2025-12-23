SELECT
  j.job_id,
  MAX(j.name) AS "job",
  COUNT(*)
FROM
  x_characters AS c
  JOIN x_jobs AS j ON c.job_id = j.job_id
WHERE
  c.deleted_at IS NULL
GROUP BY
  j.job_id
ORDER BY
  j.job_id;