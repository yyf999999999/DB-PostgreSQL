SELECT
    i.item_id,
    MAX(i.name),
    SUM(ci.qty) AS "所持総数"
FROM
    x_items AS i
    JOIN x_character_items AS ci ON i.item_id = ci.item_id
GROUP BY
    i.item_id
HAVING
    SUM(ci.qty) >= 6
ORDER BY
    i.item_id;