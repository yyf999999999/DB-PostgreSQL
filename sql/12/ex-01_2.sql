SELECT
    i.item_id,
    i.name AS "item",
    c.name,
    ci.qty
FROM
    y_items AS i
    LEFT JOIN (
        y_character_items AS ci
        JOIN y_characters AS c ON ci.character_id = c.character_id AND
        c.deleted_at IS NULL
    ) ON i.item_id = ci.item_id
ORDER BY
    i.item_id;