SELECT
  MIN(height) AS "最低身長",
  MAX(height) AS "最高身長",
  MAX(height) - MIN(height) AS "最高値-最低値"
FROM
  users;