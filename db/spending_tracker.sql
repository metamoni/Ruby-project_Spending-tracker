DROP TABLE users;
DROP TABLE accounts;
DROP TABLE merchants;
DROP TABLE tags;
DROP TABLE transactions;

CREATE TABLE users
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) not null,
  account_id INT8 REFERENCES accounts(id)?--,
  -- budget NUMERIC
  -- savings NUMERIC
);

CREATE TABLE accounts
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) not null,
  type VARCHAR(255),
  user_id INT8 REFERENCES user(id)
);

CREATE TABLE merchants
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  tag_id INT8 REFERENCES tags(id)
);

CREATE TABLE tags
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  merchant_id INT8 REFERENCES merchants(id)
);

CREATE TABLE transactions
(
  id SERIAL8 PRIMARY KEY,
  merchant_id INT8 REFERENCES merchants(id),
  tag_id INT8 REFERENCES tags(id),
  value NUMERIC
);
