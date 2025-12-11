SELECT
  id,
  name,
  birthday
FROM
  users
WHERE
  birthday BETWEEN '1990-04-01' AND '1999-03-31'
ORDER BY
  birthday;

-- BETWEEN ～ AND ～ を使用する例。推奨