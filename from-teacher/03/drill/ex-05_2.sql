SELECT
  id,
  name,
  buff,
  CASE
    WHEN buff = 0 THEN '--'
    WHEN buff < 0 THEN 'debuff'
    ELSE 'buff'
  END AS "status"
FROM
  s_characters;
