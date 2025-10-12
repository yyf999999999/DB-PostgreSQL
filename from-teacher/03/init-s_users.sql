DROP TABLE IF EXISTS s_users;

CREATE TABLE s_users (id INT PRIMARY KEY, name TEXT NOT NULL, age INT);

INSERT INTO
  s_users (id, name, age)
VALUES
  (1, 'Alice', 20),
  (2, 'Bob', 25);

SELECT
  *
FROM
  s_users;