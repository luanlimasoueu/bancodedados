use cm3;

CREATE TABLE vendas_produtos (
    id SERIAL PRIMARY KEY,
    nome_produto VARCHAR(100),
    categoria VARCHAR(50),
    subcategoria VARCHAR(50),
    data_venda DATE,
    numero_vendas INT,
    receita DECIMAL(10,2),
    desconto DECIMAL(5,2)
);


-- Vendas entre fevereiro e abril de 2025
INSERT INTO vendas_produtos 
(nome_produto, categoria, subcategoria, data_venda, numero_vendas, receita, desconto) 
VALUES
-- Eletrônicos
('Notebook Ultra', 'Eletrônicos', 'Computadores', '2025-02-05', 4, 12000.00, 10.00),
('Notebook Ultra', 'Eletrônicos', 'Computadores', '2025-03-03', 3, 9000.00, 8.00),
('Smartphone Max', 'Eletrônicos', 'Celulares', '2025-03-08', 12, 9600.00, 6.00),
('Smartphone Max', 'Eletrônicos', 'Celulares', '2025-04-05', 7, 5600.00, 5.00),
('Tablet Plus', 'Eletrônicos', 'Computadores', '2025-02-25', 5, 4000.00, 7.00),
('Tablet Plus', 'Eletrônicos', 'Computadores', '2025-03-30', 6, 4800.00, 6.00),

-- Moda
('Camisa Polo', 'Moda', 'Roupas', '2025-03-12', 10, 1500.00, 11.00),
('Camisa Polo', 'Moda', 'Roupas', '2025-03-27', 7, 1050.00, 9.00),
('Jaqueta Jeans', 'Moda', 'Roupas', '2025-02-15', 6, 1200.00, 12.00),
('Jaqueta Jeans', 'Moda', 'Roupas', '2025-04-08', 8, 1600.00, 14.00),
('Tênis Corrida', 'Moda', 'Calçados', '2025-03-22', 11, 4400.00, 10.00),
('Tênis Corrida', 'Moda', 'Calçados', '2025-04-22', 6, 2400.00, 13.00),

-- Casa
('Cadeira Gamer', 'Casa', 'Móveis', '2025-02-10', 3, 1800.00, 4.00),
('Cadeira Gamer', 'Casa', 'Móveis', '2025-03-01', 2, 1200.00, 6.00),
('Sofá Retrátil', 'Casa', 'Móveis', '2025-03-18', 1, 1500.00, 5.00),
('Sofá Retrátil', 'Casa', 'Móveis', '2025-04-05', 2, 3000.00, 7.00),
('Jogo de Panelas', 'Casa', 'Utensílios', '2025-03-15', 8, 1200.00, 17.00),
('Jogo de Panelas', 'Casa', 'Utensílios', '2025-04-18', 5, 750.00, 20.00),

-- Mix datas e produtos (para criar densidade de dias)
('Tablet Plus', 'Eletrônicos', 'Computadores', '2025-03-05', 3, 2400.00, 10.00),
('Notebook Ultra', 'Eletrônicos', 'Computadores', '2025-04-08', 2, 6000.00, 11.00),
('Camisa Polo', 'Moda', 'Roupas', '2025-04-12', 5, 750.00, 9.00),
('Jaqueta Jeans', 'Moda', 'Roupas', '2025-03-06', 4, 800.00, 13.00),
('Tênis Corrida', 'Moda', 'Calçados', '2025-03-10', 10, 4000.00, 12.00),
('Cadeira Gamer', 'Casa', 'Móveis', '2025-04-05', 1, 600.00, 5.00),
('Sofá Retrátil', 'Casa', 'Móveis', '2025-04-10', 2, 3000.00, 6.00),
('Smartphone Max', 'Eletrônicos', 'Celulares', '2025-02-27', 9, 7200.00, 7.00),
('Notebook Ultra', 'Eletrônicos', 'Computadores', '2025-03-28', 6, 18000.00, 12.00),
('Jogo de Panelas', 'Casa', 'Utensílios', '2025-02-21', 4, 600.00, 19.00),
('Camisa Polo', 'Moda', 'Roupas', '2025-02-28', 12, 1800.00, 10.00),
('Tablet Plus', 'Eletrônicos', 'Computadores', '2025-04-20', 4, 3200.00, 6.00);


select * from vendas_produtos

SELECT 
    vp.nome_produto,
    vp.categoria,
    vp.subcategoria,
    vp.desconto
FROM 
    vendas_produtos vp
WHERE 
    vp.desconto > (
        SELECT AVG(vp2.desconto)
        FROM vendas_produtos vp2
        WHERE vp2.categoria = vp.categoria
          AND vp2.subcategoria = vp.subcategoria
    )
ORDER BY 
    vp.categoria, vp.subcategoria, vp.desconto DESC;

SELECT 
    data_venda,
    SUM(numero_vendas) AS total_vendido
FROM 
    vendas_produtos
WHERE 
    data_venda BETWEEN CURDATE() - INTERVAL 90 DAY AND CURDATE() - INTERVAL 2 DAY
GROUP BY 
    data_venda
ORDER BY 
    data_venda;

SELECT 
    ROUND(SUM(receita) / COUNT(DISTINCT data_venda), 2) AS receita_media_por_dia
FROM 
    vendas_produtos
WHERE 
    data_venda BETWEEN CURDATE() - INTERVAL 90 DAY AND CURDATE() - INTERVAL 2 DAY;

SELECT 
    SUM(receita) AS receita_total_90_dias
FROM 
    vendas_produtos
WHERE 
    data_venda >= CURDATE() - INTERVAL 90 DAY;
    
    
    SELECT 
    SUM(numero_vendas) AS total_vendido_ontem
FROM 
    vendas_produtos
WHERE 
    data_venda = CURDATE() - INTERVAL 1 DAY;
    
    