CREATE DATABASE homework_1;
USE homework_1;

-- 1

CREATE TABLE phone
(
Id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
ProductName VARCHAR(45) NOT NULL,
Manufacturer VARCHAR(40) NOT NULL,
ProductCount INT,
Price VARCHAR(10)
);

INSERT phone
(
Id, ProductName, Manufacturer, ProductCount, Price
)
VALUES 
(1, "iPhone X", "Apple", "3", "76000"),
(2, "iPhone 8", "Apple", "2", "51000"),
(3, "Galaxy S9", "Samsung", "2", "56000"),
(4, "Galaxy S8", "Samsung", "1", "41000"),
(5, "P20 Pro", "Huawei", "5", "36000");

SELECT * FROM phone;

-- 2

SELECT ProductName, Manufacturer, Price FROM phone
WHERE ProductCount > "2";

-- 3

SELECT * FROM phone
WHERE Manufacturer = "Samsung";

-- 4.1

SELECT * FROM phone
WHERE ProductName LIKE "iPhone%";

-- 4.2

SELECT * FROM phone
WHERE ProductName LIKE "%Samsung";

-- 4.3

SELECT * FROM phone
WHERE ProductName LIKE "%8%";
