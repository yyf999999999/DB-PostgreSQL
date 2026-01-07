SELECT
  c.character_id,
  c.name,
  j.name AS "job"
FROM
  n_characters AS c
  LEFT JOIN n_jobs AS j ON c.job_id = j.job_id -- ◀ JOIN から LEFT JOIN に変更
ORDER BY
  c.character_id;