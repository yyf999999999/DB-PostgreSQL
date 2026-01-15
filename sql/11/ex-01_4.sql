SELECT
    j.job_id,
    j.name AS "job",
    MAX(c.character_id),
    MAX(c.name),
    MAX(c.level)
FROM
    x_jobs AS j
    JOIN x_characters AS c ON j.job_id = c.job_id
WHERE
    c.level = (
        SELECT
            MAX(level)
        FROM
            x_characters
        GROUP BY
            job_id
        HAVING
            job_id = c.job_id
    )
GROUP BY
    j.job_id
ORDER BY
    j.job_id;