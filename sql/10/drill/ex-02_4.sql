SELECT
    character_id,
    name,
    job_id,
    deleted_at
FROM
    x_characters
WHERE
    job_id IN (
        SELECT
            job_id
        FROM
            x_jobs
        WHERE
            name IN ('Wizard', 'Priest')
        GROUP BY
            job_id
    ) AND
    deleted_at IS NULL;