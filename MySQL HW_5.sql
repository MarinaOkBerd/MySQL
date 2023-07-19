DROP DATABASE IF EXISTS homework_5;
CREATE DATABASE IF NOT EXISTS homework_5;
USE homework_5;

CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT * FROM cars;

CREATE VIEW view_cars AS
SELECT name, cost
FROM cars
WHERE cost < 25000;

SELECT * FROM view_cars;

ALTER VIEW view_cars AS
SELECT name, cost
FROM cars
WHERE cost < 30000;

SELECT * FROM view_cars;

CREATE VIEW result_cars AS
SELECT *
FROM cars
WHERE name = 'Skoda' OR name = 'Audi';

SELECT * FROM result_cars;

SELECT name, cost,
DENSE_RANK() OVER(ORDER BY cost) AS 'dense_rank'
FROM cars;

/*
#2 NO
*/

SELECT name, cost
FROM (SELECT name, cost, LAG(cost) OVER() AS 'old_cost' FROM cars) AS result
WHERE cost > old_cost;

SELECT name, cost
FROM (SELECT name, cost, LAG(cost) OVER() AS 'old_cost' FROM cars) AS result
WHERE cost < old_cost;

SELECT name, cost, 
LEAD(cost) OVER (ORDER BY cost) - cost AS 'difference' FROM cars
ORDER BY cost;


