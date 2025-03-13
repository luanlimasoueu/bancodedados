use cm3;


CREATE TABLE cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL
);

INSERT INTO cliente (nome, data_nascimento) VALUES
('Ana Souza', '1992-03-10'),
('Bruno Lima', '1988-07-25'),
('Carla Mendes', '1995-11-30'),
('Diego Rocha', '1999-06-18'),
('Elena Castro', '1983-09-05');

SELECT * FROM cliente;

DELIMITER $$
CREATE PROCEDURE idade_1( in idCliente int , out idade int, out res varchar(20))
BEGIN
	DECLARE dt datetime;
    set dt = ( select data_nascimento from cliente where id = idCliente );
	set idade = year( now()) - year( dt);
    
    if ( idade >= 18) then 
		set res =  'maior';
	else
		set res = 'Menor';
	end if;
    
END $$ 
DELIMITER ;


call idade( 1, @idadecliente, @resultado) ;

select @idadecliente, @resultado ;


#https://www.youtube.com/watch?v=Hz_ozlrA9Z8
