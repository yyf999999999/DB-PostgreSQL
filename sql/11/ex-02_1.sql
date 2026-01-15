SELECT
    c.character_id,
    c.name,
    COALESCE(j.name, '---') AS "job"
FROM
    n_characters AS c
    LEFT JOIN n_jobs AS j ON c.job_id = j.job_id
ORDER BY
    character_id;