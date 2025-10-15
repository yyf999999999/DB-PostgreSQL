SELECT
  4 AS "grade",
  'M' AS "course",
  name,
  age || '歳' AS "age"
FROM
  s_users;