SELECT
  j.job_id,
  j.name AS "job",
  c.character_id,
  c.name,
  c.level
FROM
  x_characters AS c
  JOIN x_jobs AS j ON c.job_id = j.job_id
WHERE
  level = (
    SELECT
      MAX(level)
    FROM
      x_characters
    GROUP BY
      job_id
    HAVING
      job_id = c.job_id
  )
ORDER BY
  j.job_id;