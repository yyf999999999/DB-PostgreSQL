SELECT DISTINCT
  COALESCE(guild, '未所属') AS "ギルド",
  job AS "ジョブ"
FROM
  s_characters;

-- 別解 (ORDER BY句を使用)
SELECT DISTINCT
  COALESCE(guild, '未所属') AS "ギルド",
  job AS "ジョブ"
FROM
  s_characters
ORDER BY
  COALESCE(guild, '未所属') , job;
