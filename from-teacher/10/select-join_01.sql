SELECT
  character_id,
  x_characters.name,
  level,
  x_jobs.job_id,
  x_jobs.name,
  attack_gain
FROM
  x_characters
  INNER JOIN x_jobs ON x_characters.job_id = x_jobs.job_id;