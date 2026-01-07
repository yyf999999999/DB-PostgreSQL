SELECT
  character_id,
  name,
  COALESCE(
    (
      SELECT
        name
      FROM
        n_jobs AS n
      WHERE
        n.job_id = c.job_id
    ),
    '---'
  ) AS "job"
FROM
  n_characters AS c
ORDER BY
  character_id;