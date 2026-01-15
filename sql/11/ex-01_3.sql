SELECT
    character_id,
    name,
    COALESCE(
        (
            SELECT
                name
            FROM
                n_jobs
            WHERE
                n_characters.job_id = job_id
        ),
        '---'
    ) AS "job"
FROM
    n_characters
ORDER BY
    character_id;