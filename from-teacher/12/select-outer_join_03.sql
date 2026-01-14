-- ジョブを基準にキャラを列挙 (論理削除済みキャラを含めない) 
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
  LEFT JOIN y_characters AS c ON (
    j.job_id = c.job_id AND
    c.deleted_at IS NULL -- ◀ ON句で論理削除してないキャラのみを選択
  ) -- ◀ 括弧は省略可
ORDER BY
  j.job_id;

-- ジョブを基準にキャラ人数を集計 (論理削除済みキャラを含めない) 
SELECT
  j.job_id,
  MAX(j.name) AS "job",
  COUNT(c.character_id)
FROM
  y_jobs AS j
  LEFT JOIN y_characters AS c ON (
    j.job_id = c.job_id AND
    c.deleted_at IS NULL -- ◀ ON句で論理削除してないキャラのみを選択
  ) -- ◀ 括弧は省略可
GROUP BY
  j.job_id
ORDER BY
  j.job_id;
