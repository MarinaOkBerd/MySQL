DROP DATABASE IF EXISTS homework_3;
CREATE DATABASE IF NOT EXISTS homework_3;
USE homework_3;

DROP TABLE IF EXISTS staff;
CREATE TABLE IF NOT EXISTS staff
(id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
firstname VARCHAR(30) NOT NULL,
lastname VARCHAR(30) NOT NULL,
post VARCHAR(30) NOT NULL,
seniority INT NOT NULL,
salary INT NOT NULL,
age INT NOT NULL);

INSERT INTO staff (firstname, lastname, post, seniority, salary, age)
VALUES
('Вася', 'Петров', 'Начальник', 40, 100000, 60),
('Петр', 'Власов', 'Начальник', 8, 70000, 30),
('Катя', 'Катина', 'Инженер', 2, 70000, 25),
('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
('Иван', 'Иванов', 'Рабочий', 40, 30000, 59),
('Петр', 'Петров', 'Рабочий', 20, 25000, 40),
('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
('Максим', 'Максимов', 'Рабочий', 2, 11000, 22),
('Юрий', 'Галкин', 'Рабочий', 3, 12000, 24),
('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);

SELECT * FROM staff;

SELECT * FROM staff
ORDER BY salary DESC;

SELECT * FROM staff
ORDER BY salary;

SELECT * FROM staff
ORDER BY salary DESC
LIMIT 5;

SELECT SUM(salary), post
FROM staff
GROUP BY post;

SELECT post, COUNT(post)
FROM staff
WHERE post = 'Рабочий' AND (age >= 24 AND age <= 49);

SELECT COUNT(DISTINCT post) AS 'количество специальностей'
FROM staff;

SELECT post
FROM staff
GROUP BY post
HAVING AVG(age) <= 30;

DROP TABLE IF EXISTS activity_staff;
CREATE TABLE IF NOT EXISTS activity_staff
(id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
staff_id INT,
FOREIGN KEY (staff_id) REFERENCES staff(id),
date_activaty DATE,
count_pages INT);

INSERT INTO activity_staff (staff_id, date_activaty, count_pages)
VALUES
(1, '2022-01-01', 250),
(2, '2022-01-01', 220),
(3, '2022-01-01', 170),
(1, '2022-01-02', 100),
(2, '2022-01-01', 220),
(3, '2022-01-01', 300),
(7, '2022-01-01', 350),
(1, '2022-01-03', 168),
(2, '2022-01-03', 62),
(3, '2022-01-03', 84);

SELECT * FROM activity_staff;

SELECT staff_id, SUM(count_pages)
FROM activity_staff
GROUP BY staff_id
HAVING SUM(count_pages) > 500;

SELECT date_activaty, COUNT(staff_id) AS 'сотрудники'
FROM activity_staff
GROUP BY date_activaty
HAVING COUNT(staff_id) > 3;

SELECT post, AVG(salary) AS 'средняя заработная плата'
FROM staff
GROUP BY post
HAVING AVG(salary) > 30000;

