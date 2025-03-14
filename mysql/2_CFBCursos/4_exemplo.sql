use cm3;



DELIMITER $$
CREATE  PROCEDURE loopWhile ( OUT soma int)
BEGIN

	DECLARE x int DEFAULT 0;
    
    while ( x < 10) do
		set x = x + 1;
	end while;
    
    set soma = x;
END $$
DELIMITER ;

call loopWhile( @ret);

select @ret;


DELIMITER $$
CREATE  PROCEDURE loopLoop ( in max int,  OUT soma int)
BEGIN

	DECLARE x int DEFAULT 0;
    
    meuloop:LOOP
		IF ( x >= max) THEN
			LEAVE meuloop;
        END IF;
        set x = x +1;
	END LOOP;
    
    set soma = x;
END $$
DELIMITER ;

call loopLoop( 100, @ret);

select @ret;

#https://www.youtube.com/watch?v=tfmmVUDQSXM








