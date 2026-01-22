SELECT
    i.item_id,
    i.name AS "item",
    COALESCE(SUM(ci.qty), 0) AS "total_qty",
    COUNT(c.character_id) AS "holder_cnt"
FROM
    y_items AS i
    LEFT JOIN (
        y_characters AS c
        JOIN y_character_items AS ci ON c.character_id = ci.character_id AND
        c.deleted_at IS NULL
    ) ON i.item_id = ci.item_id
GROUP BY
    i.item_id
ORDER BY
    i.item_id;