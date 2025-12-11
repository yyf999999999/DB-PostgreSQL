SELECT
  id,
  name,
  birthday
FROM
  users
WHERE
  birthday >= '1990-04-01' AND
  birthday <= '1999-03-31'
ORDER BY
  birthday;

-- AND を使用する例