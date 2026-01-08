SELECT
    c.character_id,
    c.name,
    i.item_id,
    i.qty
FROM
    x_characters AS c
    JOIN x_character_items AS i ON c.character_id = i.character_id
ORDER BY
    c.character_id,
    i.item_id;