SELECT
  id,
  name,
  dept,
  CASE
    WHEN dept IN ('Sales', 'Marketing') THEN 'Business'
    WHEN dept IN ('R&D', 'Production') THEN 'Technical'
    ELSE NULL
  END AS "業務区分"
FROM
  users;

-- IN を使用する例。推奨