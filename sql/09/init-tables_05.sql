DROP TABLE IF EXISTS p_users;

START TRANSACTION;

CREATE TABLE p_users (
  user_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(16) NOT NULL CHECK (name <> '') CHECK (name ~ '^[A-Za-z]*$'),
  zip_code CHAR(8) NOT NULL CHECK (zip_code ~ '^[0-9]{3}-[0-9]{4}$'),
  birthday DATE NOT NULL CHECK (birthday BETWEEN '1900-01-01' AND CURRENT_DATE),
  locale VARCHAR(5) NOT NULL CHECK (locale IN ('ja', 'en', 'de', 'ru')),
  created_at TIMESTAMP NOT NULL CHECK (
    created_at >= '2025-12-01' AND
    created_at >= birthday
  ),
  deleted_at TIMESTAMP CHECK (
    deleted_at IS NULL OR
    deleted_at >= created_at
  )
);

INSERT INTO
  p_users (name, zip_code, birthday, locale, created_at)
VALUES
  (
    'Alice',
    '572-8572',
    DATE '2001-03-12',
    'en',
    DATE_TRUNC('second', CURRENT_TIMESTAMP)
  );

SELECT
  *
FROM
  p_users;

ROLLBACK;