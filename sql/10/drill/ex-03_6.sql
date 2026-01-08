SELECT
    j.job_id,
    MAX(j.name) AS "job",
    COUNT(*) AS "count"
FROM
    x_jobs AS j
    JOIN x_characters AS c ON j.job_id = c.job_id
WHERE
    c.deleted_at IS NULL
GROUP BY
    j.job_id
ORDER BY
    j.job_id;