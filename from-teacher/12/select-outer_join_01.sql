-- ジョブを基準にキャラを列挙 (論理削除済みキャラを含む) 
SELECT
  j.job_id,
  j.name AS "job",
  c.name,
  c.deleted_at,
  CASE
    WHEN c.deleted_at IS NULL THEN ''
    ELSE 'YES'
  END AS "is_deleted"
FROM
  y_jobs AS j
  LEFT JOIN y_characters AS c ON j.job_id = c.job_id -- ◀ 外部結合
ORDER BY
  j.job_id;

-- ジョブを基準にキャラ人数を集計 (論理削除済みキャラを含む)
SELECT
  j.job_id,
  MAX(j.name) AS "job",
  COUNT(c.character_id)
FROM
  y_jobs AS j
  LEFT JOIN y_characters AS c ON j.job_id = c.job_id
GROUP BY
  j.job_id
ORDER BY
  j.job_id;
