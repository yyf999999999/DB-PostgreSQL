SELECT
  id,
  name,
  birthday
FROM
  users
WHERE
  birthday >= CAST('1990-04-01' AS DATE) AND
  birthday <= CAST('1999-03-31' AS DATE)
ORDER BY
  birthday;

-- CAST を明示する例