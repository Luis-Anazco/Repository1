CREATE DATABASE gameshop;
USE gameshop;
CREATE TABLE customers(
  customer_id int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
  name varchar(40) NOT NULL,
  email varchar(60) NOT NULL,
  house_number int NOT NULL,
  postcode varchar(8) NOT NULL
);
CREATE TABLE products(
  product_id int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
  title varchar(60) NOT NULL,
  price decimal(6,2) NOT NULL,
  stock int NOT NULL
);
CREATE TABLE orders(
  order_id int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
  customer_id int NOT NULL FOREIGN KEY REFERENCES customers(customer_id),
  product_id int NOT NULL FOREIGN KEY REFERENCES products(product_id),
  date_placed date NOT NULL
);

INSERT INTO customers(name,email,house_number,postcode)
VALUES('Luis','luis@av.com','3','M14 9PE'),
('Oli','oli@av.com','2','M13 8TF'),
('Steph','steph@av.com','6','M19 4RF'),
('Maria','maria@av.com','5','M4 7HF'),
('Alex','alex@av.com','10','M1 8PQ');

INSERT INTO products(title,price,stock)
VALUES('GTAV',59.99,20),
('CoD',49.99,103),
('Forza',39.99,81),
('SIMS',9.99,63),
('Final Fantasy',39.99,16);

INSERT INTO orders(customer_id,product_id,date_placed)
VALUES(3,2,'2022-10-10'),
(4,1,'2022-09-30'),
(1,3,'2022-09-18'),
(3,5,'2022-10-12'),
(2,1,'2022-10-10');

ALTER TABLE products
ADD genre varchar(20) NULL;

INSERT INTO products(genre)
VALUES('Horror') 
WHERE product_id=1;

INSERT INTO products(genre)
VALUES('Fantasy') 
WHERE product_id=2

INSERT INTO products(genre)
VALUES('Horror') 
WHERE product_id=3

INSERT INTO products(genre)
VALUES('Thriller') 
WHERE product_id=4

INSERT INTO products(genre)
VALUES('Sci-fi') 
WHERE product_id=5


UPDATE customers
SET name='Lu', email_address='lu@av.com' 
WHERE customer_id=1

SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;


UPDATE products
SET genre NOT NULL;

SELECT price FROM products
SELECT DISTINCT order_id FROM orders
SELECT email_address FROM customers WHERE name='Oli';
SELECT email_address FROM customers WHERE name!='Oli';
SELECT * FROM products WHERE price <=49.99
SELECT * FROM orders WHERE date_placed BETWEEN '2022-09-29' AND '2022-10-10';
SELECT * FROM customers WHERE name LIKE '%l';
SELECT * FROM customers WHERE name LIKE 'l%';
SELECT * FROM customers WHERE name LIKE 'L%';
SELECT * FROM customers WHERE name LIKE '%l%';
SELECT * FROM customers WHERE name IN('Lu','Oli');
SELECT * FROM customers WHERE name NOT IN('Lu','Oli');
SELECT * FROM customers WHERE email_address IS NOT NULL;
SELECT email_address AS e_address FROM customers;
SELECT name,house_number FROM customers ORDER BY house_number DESC;
SELECT TOP 2 * FROM customers WHERE customer_id IN(1,2);


USE gameshopdb
	SELECT COUNT(order_id) FROM orders;
	SELECT SUM(price) FROM products;
	SELECT MIN(price) FROM products;
	SELECT MAX(price) FROM products;
	SELECT AVG(price) FROM products;
	SELECT customer_id, COUNT(order_id) FROM orders GROUP BY customer_id;


SELECT * FROM customers WHERE customer_id=(
	SELECT customer_id FROM orders WHERE order_id=3
	)

SELECT * FROM customers WHERE customer_id IN(
	SELECT customer_id FROM orders
	)

CREATE VIEW male_customers AS SELECT customer_id
FROM customers
WHERE name IN('Oli','Luis','Alex')

SELECT * FROM male_customers

ALTER VIEW male_customers AS SELECT customer_id
FROM customers
WHERE name IN('Oli','Luis','Alex','Sean')

SELECT * FROM male_customers

SELECT c.customer_id, c.name, c.email, o.order_id, o.product_id FROM customers c 
	INNER JOIN orders o ON c.customer_id=o.customer_id

SELECT * FROM customers c 
	LEFT OUTER JOIN orders o ON c.customer_id=o.customer_id

SELECT * FROM customers c
	RIGHT OUTER JOIN orders o ON c.customer_id=o.customer_id

