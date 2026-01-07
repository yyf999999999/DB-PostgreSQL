SELECT
  character_id,
  name,
  (
    SELECT
      name
    FROM
      n_jobs
    WHERE
      n_jobs.job_id = n_characters.job_id
  ) AS "job" -- SELECT句でサブクエリを利用
FROM
  n_characters
ORDER BY
  character_id;