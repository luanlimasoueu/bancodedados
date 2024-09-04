-- Criação da tabela de clientes
CREATE TABLE clientes (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    cidade VARCHAR(100)
);

-- Inserção de dados na tabela de clientes
INSERT INTO clientes (nome, cidade) VALUES
('Alice', 'São Paulo'),
('Bruno', 'Rio de Janeiro'),
('Carla', 'Belo Horizonte'),
('Daniel', 'Porto Alegre');

-- Criação da tabela de pedidos
CREATE TABLE pedidos (
    pedido_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    produto VARCHAR(100),
    quantidade INT
);

-- Inserção de dados na tabela de pedidos
INSERT INTO pedidos (cliente_id, produto, quantidade) VALUES
(1, 'Notebook', 1),
(2, 'Teclado', 2),
(3, 'Mouse', 3),
(1, 'Monitor', 2);

select * from pedidos ;
select * from clientes;

-- INNER JOIN
SELECT clientes.nome, pedidos.produto, pedidos.quantidade
FROM clientes
INNER JOIN pedidos ON clientes.cliente_id = pedidos.cliente_id;

-- RIGHT JOIN
SELECT clientes.nome, pedidos.produto, pedidos.quantidade
FROM clientes
LEFT JOIN pedidos ON clientes.cliente_id = pedidos.cliente_id;

-- FULL JOIN

SELECT clientes.nome, pedidos.produto, pedidos.quantidade
FROM clientes
LEFT JOIN pedidos ON clientes.cliente_id = pedidos.cliente_id
UNION
SELECT clientes.nome, pedidos.produto, pedidos.quantidade
FROM clientes
RIGHT JOIN pedidos ON clientes.cliente_id = pedidos.cliente_id;
