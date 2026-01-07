SELECT
  i.item_id,
  i.name,
  COALESCE (c.name, '---') AS "holder",
  COALESCE (j.name, '---') AS "job",
  COALESCE (ci.qty, 0 ) AS "qty"
FROM
  n_items AS i
  LEFT JOIN n_character_items AS ci ON i.item_id = ci.item_id
  LEFT JOIN n_characters AS c ON ci.character_id = c.character_id
  LEFT JOIN n_jobs AS j ON c.job_id = j.job_id
ORDER BY
  i.item_id,
  c.character_id;