START TRANSACTION;

UPDATE x_items AS i
SET
    price = CEILING(i.price * 1.2 / 10) * 10
WHERE
    i.item_id IN (
        SELECT
            i.item_id
        FROM
            x_items AS i
            LEFT JOIN x_character_items AS ci ON i.item_id = ci.item_id
            LEFT JOIN x_characters AS c ON ci.character_id = c.character_id
        WHERE
            c.deleted_at IS NULL
        GROUP BY
            i.item_id
        HAVING
            SUM(ci.qty) >= 6
    )
RETURNING
    i.item_id,
    i.name,
    i.price AS "updated_price";

ROLLBACK;