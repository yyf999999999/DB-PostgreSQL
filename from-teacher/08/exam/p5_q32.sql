SELECT
  id,
  name,
  height
FROM
  users
ORDER BY
  height DESC NULLS LAST,
  name ASC;

-- 第09行目の ASC (昇順指定) は省略可