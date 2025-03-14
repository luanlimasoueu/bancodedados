use cm3;

CREATE TABLE venda (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    f_valor_venda DECIMAL(10,2) NOT NULL
);

INSERT INTO venda (nome, f_valor_venda) VALUES
('João Silva', 150.75),
('Maria Souza', 299.99),
('Carlos Oliveira', 89.50),
('Ana Lima', 450.00),
('Pedro Santos', 120.30);



DELIMITER $$
CREATE PROCEDURE somaVendas ( OUT soma float(10,2))
BEGIN

		DECLARE vv float(10, 2 ) default 0;
        DECLARE fimloop int default 0;
        
        declare meucursor cursor for select f_valor_venda from venda;
        declare continue handler for not found set fimloop=1;
        
        set  soma = 0;
        
        open meucursor;
        
        while ( fimloop!= 1) do
			fetch meucursor into vv;
            set soma = soma + vv;
		end while;
        
END $$
DELIMITER ;

call somaVendas ( @ret);

select round(@ret, 2);


SELECT SUM(f_valor_venda) AS total_vendas FROM venda;


#https://www.youtube.com/watch?v=RbmTzbtiBkY

