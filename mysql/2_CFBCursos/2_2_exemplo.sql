use cm3;

DELIMITER $$
CREATE PROCEDURE canal_youtube( )
BEGIN

	declare x varchar(50);
    set x = 'youtube';
    select x;
    
END $$
DELIMITER ;

CALL canal_youtube();




