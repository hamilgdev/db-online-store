DROP DATABASE IF EXISTS dbonlinestore;

CREATE DATABASE dbonlinestore;

DROP TABLE IF EXISTS clients;

CREATE TABLE clients (
  id INT NOT NULL,
  name VARCHAR(20) NOT NULL,
  email VARCHAR(30) NOT NULL,
  address VARCHAR(50) NOT NULL,

  CONSTRAINT client_id_pk PRIMARY KEY (id)
);

DROP TABLE IF EXISTS products;

CREATE TABLE products (
  id INT NOT NULL,
  name VARCHAR(30) NOT NULL,
  description VARCHAR(50) NOT NULL,
  price INT NOT NULL,
  stock_number VARCHAR(20),

  CONSTRAINT product_id_pk PRIMARY KEY (id)
);

DROP TABLE IF EXISTS purchases;

CREATE TABLE purchases (
  id INT NOT NULL,
  client_id INT NOT NULL,
  product_id INT NOT NULL,
  purchase_date DATE NOT NULL,
  tracking_number VARCHAR(20),

  CONSTRAINT purchase_id_pk PRIMARY KEY (id),

  CONSTRAINT purchase_client_id_fk FOREIGN KEY (client_id) REFERENCES clients (id),
  CONSTRAINT purchase_product_id_fk FOREIGN KEY (product_id) REFERENCES products (id)
);
