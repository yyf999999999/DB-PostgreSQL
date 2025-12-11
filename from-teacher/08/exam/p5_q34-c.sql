SELECT
  id,
  name,
  dept,
  CASE
    WHEN dept IN ('Sales', 'Marketing') THEN 'Business'
    WHEN dept IS NOT NULL THEN 'Technical'
    ELSE NULL
  END AS "業務区分"
FROM
  users;
