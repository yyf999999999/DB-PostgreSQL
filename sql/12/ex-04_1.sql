START TRANSACTION;

UPDATE x_characters AS c
SET
    level = c.level + 1
WHERE
    c.character_id IN (
        SELECT
            character_id
        FROM
            x_characters AS c
            LEFT JOIN x_jobs AS j ON c.job_id = j.job_id
        WHERE
            j.name NOT IN ('Priest', 'Wizard')
    ) AND
    c.deleted_at IS NULL
RETURNING
    c.character_id,
    c.name,
    c.level AS "updated_level";

ROLLBACK;