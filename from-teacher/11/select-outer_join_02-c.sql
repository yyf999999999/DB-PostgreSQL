SELECT
  j.job_id,
  MAX(j.name) AS "name",
  COUNT(c.character_id)
FROM
  n_jobs AS j
  LEFT JOIN n_characters AS c ON c.job_id = j.job_id -- ◀ 注目
GROUP BY
  j.job_id
ORDER BY
  j.job_id;