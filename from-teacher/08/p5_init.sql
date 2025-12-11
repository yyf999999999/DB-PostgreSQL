DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  name VARCHAR(16) NOT NULL,
  dept VARCHAR(16), -- Department(部署)
  height DECIMAL(4, 1),
  birthday DATE,
  ot_hours INTEGER -- OverTimeHours(残業時間数)
);

INSERT INTO
  users
VALUES
  (1, 'Alice', 'Sales', 162.3, '1998-03-12', 18),
  (2, 'Bob', 'Production', 181.9, '1989-07-08', 32),
  (3, 'Charlie', 'R&D', 179.2, '1995-10-22', 27),
  (4, 'Dora', 'Marketing', 175.5, NULL, 12),
  (5, 'Ellen', NULL, 175.7, '1990-04-01', 5),
  (6, 'Eve', 'Production', NULL, '1999-03-31', 29),
  (7, 'Frank', 'Sales', 175.7, '1985-09-04', 21),
  (8, 'Gyaos', 'Sales', 185.8, '1991-08-27', 34);

SELECT
  *
FROM
  users;
