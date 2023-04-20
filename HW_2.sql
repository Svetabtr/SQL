DROP SCHEMA IF EXISTS homework_2;
CREATE SCHEMA IF NOT EXISTS homework_2;
USE homework_2;

-- 1

DROP TABLE IF EXISTS sales;
CREATE TABLE IF NOT EXISTS sales
(
id INT PRIMARY KEY AUTO_INCREMENT,
order_date DATE NOT NULL,
count_product INT
);

INSERT INTO sales (id, order_date, count_product)
VALUES
(1, '2022-01-01', 156),
(2, '2022-01-02', 180),
(3, '2022-01-03', 21),
(4, '2022-01-04', 124),
(5, '2022-01-05', 341);

SELECT * FROM sales;

-- 2

SELECT id,
IF (count_product < 100, 'Маленький заказ',
IF (count_product >= 100 AND count_product <= 300, 'Средний заказ',
IF (count_product > 300, 'Большой заказ', 'Нет заказов')))
AS 'Тип заказа'
FROM sales;

-- 3

DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders
(
id INT PRIMARY KEY AUTO_INCREMENT,
employee_id VARCHAR(10) NOT NULL,
amount FLOAT,
order_status VARCHAR(20)
);

INSERT orders (id, employee_id, amount, order_status)
VALUES
(1, 'e03', 15.00, 'OPEN'),
(2, 'e01', 25.50, 'OPEN'),
(3, 'e05', 100.70, 'CLOSED'),
(4, 'e02', 22.18, 'OPEN'),
(5, 'e04', 9.50, 'CANCELLED');

SELECT *,
CASE 
WHEN order_status = 'OPEN' THEN 'Order is in open state'
WHEN order_status = 'CLOSED' THEN 'Order is closed'
ELSE 'Order is cancelled'
END AS full_order_status
FROM orders;

-- 4 

/* Чем 0 отличается от NULL?
NULL говорит о том, что ячейка пустая, в ней нет ничего, а 0, что значение равно нулю.
