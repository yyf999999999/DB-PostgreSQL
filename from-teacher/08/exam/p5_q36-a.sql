SELECT
  dept,
  COUNT(dept) AS "所属人数",
  ROUND(AVG(height), 1) AS "平均身長"
FROM
  users
WHERE
  dept IS NOT NULL
GROUP BY
  dept
ORDER BY
  dept;

-- 第03行目は  COUNT(*) AS "所属人数" でも可