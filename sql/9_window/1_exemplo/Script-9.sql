use sqlnotes;

CREATE TABLE empregados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    departamento VARCHAR(100),
    nome VARCHAR(100),
    salario DECIMAL(10, 2)
);

INSERT INTO empregados (departamento, nome, salario) VALUES
('Vendas', 'Ana Souza', 3000.00),
('Marketing', 'Carlos Pereira', 3500.00),
('TI', 'João Oliveira', 4500.00),
('TI', 'Fernanda Costa', 5000.00),
('Financeiro', 'Luciana Rocha', 6000.00),
('RH', 'Marcos Silva', 4000.00),
('Marketing', 'Gabriela Almeida', 3800.00),
('Vendas', 'Rafael Santos', 3200.00),
('Financeiro', 'Juliana Lima', 5500.00),
('TI', 'Paulo Martins', 4800.00),
('Vendas', 'Sofia Ferreira', 3100.00),
('RH', 'Luana Oliveira', 3900.00),
('Financeiro', 'Eduardo Souza', 6200.00),
('Marketing', 'Beatriz Gomes', 3600.00),
('Vendas', 'Carlos Silva', 3300.00);


select * from empregados

#ROW_NUMBER()

SELECT 
    nome,
    salario,
    ROW_NUMBER() OVER (ORDER BY Salario DESC) AS Ranking
FROM empregados;


# RANK()

SELECT 
    Nome,
    Salario,
    RANK() OVER (ORDER BY Salario DESC) AS Ranking_2
FROM Empregados;


# DENSE_RANK()

SELECT 
    Nome,
    Salario,
    DENSE_RANK() OVER (ORDER BY Salario DESC) AS Ranking
FROM Empregados;


#NTILE(n)

SELECT 
    Nome,
    Salario,
    NTILE(4) OVER (ORDER BY Salario DESC) AS Quartil
FROM Empregados;

#SUM() 

SELECT 
    Nome,
    Salario,
    SUM(Salario) OVER (ORDER BY Nome) AS Soma_Acumulada
FROM Empregados;

#AVG()

SELECT 
    Nome,
    Salario,
    AVG(Salario) OVER (ORDER BY Nome) AS Media_Acumulada
FROM Empregados;

# MIN() e MAX()

SELECT 
    Nome,
    Salario,
    MIN(Salario) OVER (ORDER BY Nome) AS Min_Acumulado,
    MAX(Salario) OVER (ORDER BY Nome) AS Max_Acumulado,
    MIN(Salario) OVER (ORDER BY Nome) / MAX(Salario) OVER (ORDER BY Nome)
FROM Empregados;

#COUNT()

SELECT 
    Nome,
    COUNT(*) OVER (ORDER BY Nome) AS Contagem_Acumulada
FROM Empregados;


#RANK()

SELECT 
    Departamento,
    Nome,
    Salario,
    RANK() OVER (PARTITION BY Departamento ORDER BY Salario DESC) AS Rank_Departamento
FROM Empregados;


#SUM()


SELECT 
    Departamento,
    Nome,
    Salario,
    SUM(Salario) OVER (PARTITION BY Departamento) AS Soma_Departamento
FROM Empregados;


#LAG()

SELECT 
    Nome,
    Salario,
    LAG(Salario) OVER (ORDER BY Nome) AS Salario_Anterior
FROM Empregados;


#LEAD()

SELECT 
    Nome,
    Salario,
    LEAD(Salario) OVER (ORDER BY Nome) AS Proximo_Salario
FROM Empregados;


#PERCENT_RANK()

SELECT 
    Nome,
    Salario,
    PERCENT_RANK() OVER (ORDER BY Salario DESC) AS Percentual
FROM Empregados;


# CUME_DIST()

SELECT 
    Nome,
    Salario,
    CUME_DIST() OVER (ORDER BY Salario DESC) AS Dist_Acumulada
FROM Empregados;



SELECT 
    Nome,
    Salario,
    SUM(Salario) OVER (ORDER BY Nome ROWS BETWEEN 3 PRECEDING AND CURRENT ROW) AS Soma_Janela
FROM Empregados;


SELECT 
    Nome,
    Salario,
    SUM(Salario) OVER (ORDER BY Nome RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS Soma_Janela
FROM Empregados;






