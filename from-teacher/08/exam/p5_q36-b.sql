SELECT
  dept,
  COUNT(dept) AS "所属人数",
  ROUND(AVG(height), 1) AS "平均身長"
FROM
  users
GROUP BY
  dept
HAVING
  dept IS NOT NULL
ORDER BY
  dept;

-- 非推奨ではるが、HAVING でも同等の結果は取得可能