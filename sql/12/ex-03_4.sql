START TRANSACTION;

INSERT INTO
    x_gold_transfers (from_character_id, to_character_id, amount)
SELECT
    NULL,
    c.character_id,
    1000 * level
FROM
    x_characters AS c
    LEFT JOIN x_jobs AS j ON c.job_id = j.job_id
WHERE
    j.name IN ('Priest', 'Wizard') AND
    deleted_at IS NULL;

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