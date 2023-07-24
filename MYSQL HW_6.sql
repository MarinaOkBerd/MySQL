DROP DATABASE IF EXISTS homework_6;
CREATE DATABASE IF NOT EXISTS homework_6;
USE homework_6;

-- DROP FUNCTION IF EXISTS convert_seconds;
DELIMITER $$
CREATE FUNCTION convert_seconds(seconds INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
	DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE result VARCHAR(255);

	SET days = seconds DIV (24 * 3600);
    SET seconds = seconds % (24 * 3600);
    SET hours = seconds DIV 3600;
    SET seconds = seconds % 3600;
	SET minutes = seconds DIV 60;
    SET seconds = seconds % 60;
    SET result = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds ');
	
    RETURN result;
END $$
DELIMITER ;

SELECT convert_seconds(123456);


-- DROP PROCEDURE IF EXISTS get_even_numbers;
DELIMITER $$
CREATE PROCEDURE get_even_numbers(x INT)
BEGIN
	DECLARE i INT DEFAULT 2;
    DECLARE j VARCHAR(255) DEFAULT '2';
		WHILE i < x DO
			SET i = i + 2;
		SET j = CONCAT(j, ' ', i);
		END WHILE;
	SELECT j;
END $$;
DELIMITER ;

CALL get_even_numbers(10);