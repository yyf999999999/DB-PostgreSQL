-- テーブル名のエイリアスを使用したバージョン
SELECT
  character_id,
  name,
  (
    SELECT
      name
    FROM
      n_jobs AS n -- テーブルのエイリアスを設定
    WHERE
      n.job_id = c.job_id -- エイリアス (nとc) を利用した参照
  ) AS "job"
FROM
  n_characters AS c -- テーブルのエイリアスを設定
ORDER BY
  character_id;