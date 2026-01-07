SELECT
  j.job_id,
  MAX(j.name) AS "name",
  COUNT(c.character_id)
FROM
  n_characters AS c
  RIGHT JOIN n_jobs AS j ON c.job_id = j.job_id -- ◀ JOIN から RIGHT JOIN に変更
GROUP BY
  j.job_id
ORDER BY
  j.job_id;