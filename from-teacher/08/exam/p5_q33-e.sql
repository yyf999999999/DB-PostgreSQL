SELECT
  id,
  name,
  birthday
FROM
  users
WHERE
  birthday >= '1990-04-01'::DATE AND
  birthday <= '1999-03-31'::DATE
ORDER BY
  birthday;

-- PostgreSQLの独自キャストを使用するる例