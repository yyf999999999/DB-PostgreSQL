SELECT
  id,
  name,
  birthday
FROM
  users
WHERE
  birthday >= DATE '1990-04-01' AND
  birthday <= DATE '1999-03-31'
ORDER BY
  birthday;

-- 型付きリテラルを使用するる例