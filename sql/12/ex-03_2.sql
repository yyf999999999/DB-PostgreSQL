START TRANSACTION;

INSERT INTO
    x_gold_transfers (from_character_id, to_character_id, amount, transferred_at)
SELECT
    c.character_id,
    g.owner_id,
    2000,
    '2025-12-15 04:00:00'
FROM
    x_guilds AS g
    LEFT JOIN x_guild_characters AS gc ON g.guild_id = gc.guild_id
    LEFT JOIN x_characters AS c ON gc.character_id = c.character_id
WHERE
    c.character_id <> g.owner_id AND
    c.deleted_at IS NULL;

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