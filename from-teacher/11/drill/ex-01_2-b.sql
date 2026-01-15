-- テーブル名のエイリアスを使用したバージョン
SELECT
  job_id,
  name,
  (
    SELECT
      COUNT(*)
    FROM
      n_characters AS c -- テーブルのエイリアスを設定
    WHERE
      c.job_id = j.job_id -- エイリアス (cとj) を利用した参照
  ) AS "count"
FROM
  n_jobs AS j -- テーブルのエイリアスを設定
ORDER BY
  job_id;