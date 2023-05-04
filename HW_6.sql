-- 1 Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DROP FUNCTION IF EXISTS time_formating;

delimiter //
CREATE FUNCTION time_formating(num_sec INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
	DECLARE num_min INT;
    DECLARE num_hour INT;
    DECLARE num_day INT;
    DECLARE result VARCHAR(100);
    
		IF num_sec > 60 THEN 
		SET num_min = floor(num_sec/60);
        SET num_sec = num_sec - num_min*60;
        SET result = CONCAT(num_sec, ' seconds'); 
        ELSE SET result = CONCAT(num_sec, ' seconds');
        RETURN result;
        END IF;
        
        IF num_min > 60 THEN
        SET num_hour = floor(num_min/60);
        SET num_min = num_min - num_hour*60;
        SET result = CONCAT(num_min, ' minutes ', result); 
        ELSE SET result = CONCAT(num_min, ' minutes ', num_sec, ' seconds');
        RETURN result;
        END IF;
        
        IF num_hour > 24 THEN
        SET num_day = floor(num_hour/24);
        SET num_hour = num_hour - num_day * 24;
        SET result = CONCAT(num_day, ' days ', num_hour, ' hours ', result); 
        ELSE SET result = CONCAT(num_hour, ' hours ', result);
        RETURN result;
        END IF;
	RETURN result;
END //
delimiter ;

SELECT time_formating(123456);
SELECT time_formating(1234);
SELECT time_formating(12);

-- 2 Выведите только четные числа от 1 до 10.
-- Пример: 2,4,6,8,10

DROP PROCEDURE IF EXISTS even;

delimiter //
CREATE PROCEDURE even()
BEGIN
	DECLARE num INT DEFAULT 2;
	DECLARE result VARCHAR(12) default 2;
		WHILE num < 10 DO
		SET num = num + 2;
		SET result = CONCAT(result, ' ',num);
		END WHILE;
	SELECT result;
END //
delimiter ;

CALL even();

