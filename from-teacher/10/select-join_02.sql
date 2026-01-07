SELECT
  c.character_id,
  c.name,
  c.level,
  j.job_id,
  j.name,
  j.attack_gain
FROM
  x_characters AS c
  JOIN x_jobs AS j ON c.job_id = j.job_id;