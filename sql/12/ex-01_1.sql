-- 論理削除済みキャラのみを対象として、ジョブを基準にキャラを列挙
SELECT
    j.job_id,
    j.name AS "job",
    c.name,
    CASE
        WHEN c.deleted_at IS NULL THEN ''
        ELSE 'YES'
    END AS "is_deleted"
FROM
    y_jobs AS j
    LEFT JOIN y_characters AS c ON j.job_id = c.job_id AND
    c.deleted_at IS NOT NULL
ORDER BY
    j.job_id;

-- 論理削除済みキャラのみを対象として、ジョブを基準にキャラ人数を集計
SELECT
    j.job_id,
    MAX(j.name) AS "job",
    COUNT(c.character_id)
FROM
    y_jobs AS j
    LEFT JOIN y_characters AS c ON j.job_id = c.job_id AND
    c.deleted_at IS NOT NULL
GROUP BY
    j.job_id
ORDER BY
    j.job_id;