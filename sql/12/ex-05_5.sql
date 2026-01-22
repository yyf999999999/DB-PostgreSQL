START TRANSACTION;

UPDATE x_characters AS c
SET
  level = level + dl.delta_lv
FROM
  (
    SELECT
      j.job_id AS "job_id",
      COUNT(c2.character_id) AS "delta_lv"
    FROM
      x_jobs AS j
      LEFT JOIN x_characters AS c2 ON (
        j.job_id = c2.job_id AND
        c2.deleted_at IS NULL
      )
    GROUP BY
      j.job_id
  ) AS dl
WHERE
  c.job_id = dl.job_id
RETURNING
  c.character_id,
  c.name,
  c.job_id,
  c.level AS "updated_level";

ROLLBACK;