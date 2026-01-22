START TRANSACTION;

UPDATE x_characters AS c
SET
    level = c.level + 2
WHERE
    c.character_id IN (
        SELECT
            c.character_id
        FROM
            x_characters AS c
            LEFT JOIN x_character_items AS ci ON c.character_id = ci.character_id
            LEFT JOIN x_items AS i ON ci.item_id = i.item_id
        WHERE
            i.name = 'High Mana Potion'
    ) AND
    c.deleted_at IS NULL
RETURNING
    c.character_id,
    c.name,
    c.level AS "updated_level";

ROLLBACK;