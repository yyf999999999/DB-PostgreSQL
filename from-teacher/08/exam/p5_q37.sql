SELECT
  dept,
  COUNT(dept) AS "人数",
  ROUND(AVG(ot_hours), 1) AS "平均残業時間",
  MAX(ot_hours) AS "最高残業時間(個人)",
  SUM(ot_hours) AS "合計残業時間"
FROM
  users
GROUP BY
  dept
HAVING
  AVG(ot_hours) >= 20
ORDER BY
  AVG(ot_hours) DESC;

-- FROM句のあとに WHERE dept IS NOT NULL を入れても可