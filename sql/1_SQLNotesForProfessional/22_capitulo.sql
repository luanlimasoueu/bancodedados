DELIMITER $$
CREATE FUNCTION isEligible(
age INTEGER
)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
	IF age > 18 THEN
			RETURN ("yes");
			ELSE
				RETURN ("No");
	END IF;
END$$
DELIMITER ;
SELECT isEligible(20);
