START TRANSACTION;

UPDATE x_characters AS c
SET
    level = c.level + (
        SELECT
            COUNT(c1.character_id)
        FROM
            x_characters AS c1
            LEFT JOIN x_jobs AS j ON c1.job_id = j.job_id AND
            c1.deleted_at IS NULL
        GROUP BY
            j.job_id
        HAVING
            c.job_id = j.job_id
    )
RETURNING
    c.character_id,
    c.name,
    c.job_id,
    c.level AS "updated_level";

ROLLBACK;