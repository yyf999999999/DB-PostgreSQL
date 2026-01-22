START TRANSACTION;

UPDATE x_items AS i
SET
    price = i.price + 50 * (
        SELECT
            CASE
                WHEN COUNT(c.character_id) > 0 THEN COUNT(c.character_id)
                ELSE -2
            END
        FROM
            x_character_items AS ci
            LEFT JOIN x_characters AS c ON ci.character_id = c.character_id
        WHERE
            c.deleted_at IS NULL AND
            i.item_id = ci.item_id
    )
RETURNING
    i.item_id,
    i.name,
    i.price AS "updated_price";

ROLLBACK;