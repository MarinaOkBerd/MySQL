CREATE DATABASE homework_1;
USE homework_1;

CREATE TABLE phones
(id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
product_name VARCHAR(45) NOT NULL,
manufacturer VARCHAR(45) NOT NULL,
product_count INT,
price INT);

INSERT INTO phones (product_name, manufacturer, product_count, price)
VALUES 
('iPhone X', 'Apple', 3, 76000),
('iPhone 8', 'Apple', 2, 51000),
('Galaxy S9', 'Samsung', 2, 56000),
('Galaxy S8', 'Samsung', 1, 41000),
('P20 Pro', 'Huawei', 5, 36000);

SELECT * FROM phones;

SELECT product_name, manufacturer, price FROM phones
WHERE product_count > 2;

SELECT * FROM phones
WHERE manufacturer = 'Samsung'



