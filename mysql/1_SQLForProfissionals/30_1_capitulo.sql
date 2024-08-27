CREATE TABLE product
(
id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
type VARCHAR(50) NOT NULL,
name VARCHAR(255) NOT NULL
);
CREATE TABLE product_type
(
name VARCHAR(50) NOT NULL PRIMARY KEY
);
CREATE TABLE product_type_count
(
type VARCHAR(50) NOT NULL PRIMARY KEY,
count INT(10) UNSIGNED NOT NULL DEFAULT 0
);
INSERT INTO product_type (name) VALUES
('dress'),
('food');
INSERT INTO product (type, name) VALUES
('dress', 'T-shirt'),
('dress', 'Trousers'),
('food', 'Apple'),
('food', 'Tomatoes')

DELIMITER //
DROP PROCEDURE IF EXISTS product_count;
CREATE PROCEDURE product_count()
	BEGIN
		DECLARE p_type VARCHAR(255);
		DECLARE p_count INT(10) UNSIGNED;
		DECLARE done INT DEFAULT 0;
		DECLARE product CURSOR FOR
			SELECT
				type,
				COUNT(*)
			FROM product
			GROUP BY type;
		DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
		TRUNCATE product_type;
		OPEN product;
		REPEAT
			FETCH product
			INTO p_type, p_count;
			IF NOT done
			THEN
				INSERT INTO product_type_count
				SET
					type = p_type,
					count = p_count;
			END IF;
			UNTIL done
			END REPEAT;
			CLOSE product;
		END //
DELIMITER ;
CALL product_count();



