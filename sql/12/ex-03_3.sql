START TRANSACTION;

INSERT INTO
    x_gold_transfers (from_character_id, to_character_id, amount, transferred_at)
SELECT
    NULL,
    character_id,
    1000,
    created_at + INTERVAL '5 minutes'
FROM
    x_characters;

SELECT
    LEFT(gt.transfer_id::TEXT, 8) AS "id",
    COALESCE(fc.name, '_SYS_') AS "from",
    COALESCE(tc.name, '_SYS_') AS "to",
    gt.amount,
    gt.transferred_at
FROM
    x_gold_transfers AS gt
    LEFT JOIN x_characters AS fc ON gt.from_character_id = fc.character_id
    LEFT JOIN x_characters AS tc ON gt.to_character_id = tc.character_id;

ROLLBACK;