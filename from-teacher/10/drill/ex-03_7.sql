SELECT
  j.job_id,
  CASE
    WHEN GROUPING(j.job_id) = 1 THEN '(Total)'
    ELSE MAX(j.name)
  END AS "job",
  COUNT(*)
FROM
  x_characters AS c
  JOIN x_jobs AS j ON c.job_id = j.job_id
WHERE
  c.deleted_at IS NULL
GROUP BY
  ROLLUP (j.job_id)
ORDER BY
  j.job_id;