SELECT
  id,
  name,
  dept,
  CASE
    WHEN dept = 'Sales' OR
    dept = 'Marketing' THEN 'Business'
    WHEN dept = 'R&D' OR
    dept = 'Production' THEN 'Technical'
    ELSE NULL
  END AS "業務区分"
FROM
  users;

-- OR を使用する例。