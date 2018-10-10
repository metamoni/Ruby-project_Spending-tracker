DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE tags;
DROP TABLE users;


CREATE TABLE tags (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  description TEXT,
  icon TEXT
);

CREATE TABLE merchants (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);


CREATE TABLE transactions (
  id SERIAL8 PRIMARY KEY,
  value NUMERIC,
  merchant_id INT8 REFERENCES merchants(id) ON DELETE CASCADE,
  tag_id INT8 REFERENCES tags(id) ON DELETE CASCADE
);

CREATE TABLE users (
  id SERIAL8 PRIMARY KEY,
  user_name VARCHAR(255),
  budget NUMERIC
);
