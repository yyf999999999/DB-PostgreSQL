SELECT
    job_id,
    name,
    (
        SELECT
            COUNT(*)
        FROM
            n_characters
        WHERE
            n_jobs.job_id = job_id
    )
FROM
    n_jobs
ORDER BY
    job_id;