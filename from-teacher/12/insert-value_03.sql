TRUNCATE TABLE x_gold_transfers RESTART IDENTITY;

START TRANSACTION;

INSERT INTO
  x_gold_transfers (from_character_id, to_character_id, amount)
VALUES
  (NULL, 1, 15000), -- Marvin
  (NULL, 6, 5000), -- Alice
  (NULL, 7, 5000), -- Trudy 
  (NULL, 12, 5000) -- Dave
;

ROLLBACK;