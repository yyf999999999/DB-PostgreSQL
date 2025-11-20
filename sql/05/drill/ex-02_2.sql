START TRANSACTION;

SELECT
    job
FROM
    s_characters
ORDER BY
    id;

UPDATE s_characters
SET
    job = 'Mage'
WHERE
    job = 'Wizard';

SELECT
    job
FROM
    s_characters
ORDER BY
    id;

ROLLBACK;