SELECT
    c.character_id,
    COALESCE(c.name || '(' || MAX(j.name) || ')', c.name) AS "name(job)",
    COALESCE(SUM(ci.qty), 0) AS "total_qty"
FROM
    n_characters AS c
    LEFT JOIN n_jobs AS j ON c.job_id = j.job_id
    LEFT JOIN n_character_items AS ci ON c.character_id = ci.character_id
GROUP BY
    c.character_id
ORDER BY
    c.character_id