-- Drop table if exists
DROP TABLE IF EXISTS card_holder;

-- Create table and view column datatypes
CREATE TABLE card_holder (
  card_holder_id INT PRIMARY KEY,
  ch_name VARCHAR(50) NOT NULL
);

SELECT * FROM card_holder;


-- Drop table if exists
DROP TABLE IF EXISTS credit_card;

-- Create table and view column datatypes
CREATE TABLE credit_card (
  card_id VARCHAR(20) PRIMARY KEY,
  card_holder_id int NOT NULL, 
  FOREIGN KEY(card_holder_id) REFERENCES card_holder (card_holder_id)
);

SELECT * FROM card_holder;


-- Drop table if exists
DROP TABLE IF EXISTS merchant_category;

-- Create table and view column datatypes
CREATE TABLE merchant_category (
  id_merchant_category INT PRIMARY KEY,
  cat_name VARCHAR(50) NOT NULL
);

SELECT * FROM merchant_category;


-- Drop table if exists
DROP TABLE IF EXISTS merchant;

-- Create table and view column datatypes
CREATE TABLE merchant (
  merchant_id INT PRIMARY KEY,
  mer_name VARCHAR(50) NOT NULL,
  id_merchant_category INT NOT NULL,
  FOREIGN KEY(id_merchant_category) REFERENCES merchant_category (id_merchant_category)
);

SELECT * FROM merchant;


-- Drop table if exists
DROP TABLE IF EXISTS transaction;

-- Create table and view column datatypes
CREATE TABLE transaction (
  trans_id INT PRIMARY KEY,
  t_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  amount NUMERIC,
  card_id VARCHAR(20) NOT NULL,
  FOREIGN KEY(card_id) REFERENCES credit_card (card_id),
  merchant_id INT NOT NULL,
  FOREIGN KEY(merchant_id) REFERENCES merchant (merchant_id)
);

SELECT * FROM transaction;

