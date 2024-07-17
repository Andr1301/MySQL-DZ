/*
1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

2. Выведите только чётные числа от 1 до 10.
Пример: 2,4,6,8,10
*/

-- 1

DROP FUNCTION IF EXISTS time_convert;
DELIMITER $$ -- //
CREATE FUNCTION time_convert(num INT)
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
	DECLARE res VARCHAR(200) DEFAULT '';
    DECLARE d INT DEFAULT 0;
    DECLARE h INT DEFAULT 0;
	DECLARE m INT DEFAULT 0;
	DECLARE s INT DEFAULT 0;
    
    SET d = num DIV 86400;
    SET h = num%86400;
    
	SET m = h%3600;
    SET h = h DIV 3600;
    
	SET s = m%60;
    SET m = m DIV 60;
    
    SET res = CONCAT(d, ' days,', h, ' hours,', m, ' minutes,', s, ' seconds');
    
    RETURN res;
END $$ -- //
DELIMITER ;

SELECT time_convert(123456);

-- 2

DROP PROCEDURE IF EXISTS even;
DELIMITER $$ -- //
CREATE PROCEDURE even(num INT)
BEGIN
	DECLARE res VARCHAR(50) DEFAULT '';
    DECLARE i INT;
    SET i = 1;
    WHILE (i <=num) DO
		BEGIN
			IF (i%2=0) THEN
				SET res = CONCAT(res, ' ', i);
			END IF;
            SET i=i+1;
		END;
	END WHILE;
    SELECT res;
END $$ -- //
DELIMITER ;

CALL even(17);
