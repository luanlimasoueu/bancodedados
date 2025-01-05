drop table Vendas;

-- Criação da tabela base
CREATE TABLE Vendas (
    Id INT PRIMARY KEY,
    Produto VARCHAR(50),
    Categoria VARCHAR(50),
    Valor DECIMAL(10, 2),
    Data DATE
);

-- Inserção de dados na tabela base
INSERT INTO Vendas VALUES
(1, 'Produto A', 'Eletrônicos', 1500.00, '2024-01-01'),
(2, 'Produto B', 'Eletrônicos', 2000.00, '2024-01-02'),
(3, 'Produto C', 'Eletrodomésticos', 500.00, '2024-01-03'),
(4, 'Produto D', 'Eletrodomésticos', 800.00, '2024-01-04'),
(5, 'Produto E', 'Eletrônicos', 1200.00, '2024-01-05');

-- Exemplos de uso do método OVER

-- 1. Soma acumulada (Cumulative Sum)
SELECT 
    Id,
    Produto,
    Valor,
    SUM(Valor) OVER (ORDER BY Valor desc ) AS Soma_Acumulada
FROM Vendas;

-- Resultado esperado:
-- Id | Produto    | Valor  | Soma_Acumulada
--  1 | Produto A  | 1500.00| 1500.00
--  2 | Produto B  | 2000.00| 3500.00
--  3 | Produto C  | 500.00 | 4000.00
--  4 | Produto D  | 800.00 | 4800.00
--  5 | Produto E  | 1200.00| 6000.00

-- 2. Média móvel (Moving Average)
SELECT 
    Id,
    Produto,
    Valor,
    AVG(Valor) OVER (ORDER BY Valor  ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) AS Media_Movel
FROM Vendas;

-- Resultado esperado:
-- Id | Produto    | Valor  | Media_Movel
--  1 | Produto A  | 1500.00| 1500.00
--  2 | Produto B  | 2000.00| 1750.00
--  3 | Produto C  | 500.00 | 1250.00
--  4 | Produto D  | 800.00 | 650.00
--  5 | Produto E  | 1200.00| 1000.00

-- 3. Rank (Classificação por valor)
SELECT 
    Id,
    Produto,
    Valor,
    RANK() OVER (ORDER BY Valor DESC) AS Ranking
FROM Vendas;

-- Resultado esperado:
-- Id | Produto    | Valor  | Ranking
--  2 | Produto B  | 2000.00| 1
--  1 | Produto A  | 1500.00| 2
--  5 | Produto E  | 1200.00| 3
--  4 | Produto D  | 800.00 | 4
--  3 | Produto C  | 500.00 | 5

-- 4. Percentual acumulado (Running Total Percentage)
SELECT 
    Id,
    Produto,
    Valor,
    100.0 * SUM(Valor) OVER (ORDER BY Valor) / SUM(Valor) OVER () AS Percentual_Acumulado
FROM Vendas;

-- Resultado esperado:
-- Id | Produto    | Valor  | Percentual_Acumulado
--  1 | Produto A  | 1500.00| 25.00
--  2 | Produto B  | 2000.00| 58.33
--  3 | Produto C  | 500.00 | 66.67
--  4 | Produto D  | 800.00 | 80.00
--  5 | Produto E  | 1200.00| 100.00

SELECT 
    Id,
    Produto,
    Valor,
    Valor/SUM(Valor) OVER () AS Percentual_Acumulado,
   #SUM(Valor) OVER ()
    #,
   #100.0 * SUM(Valor) OVER (ORDER BY Valor) / SUM(Valor) OVER () AS Percentual_Acumulado
FROM Vendas;


-- 5. Número de linhas dentro de uma partição (Count by Category)
SELECT 
    Id,
    Produto,
    Categoria,
    COUNT(*) OVER (PARTITION BY Categoria) AS Contagem_Por_Categoria
FROM Vendas;

-- Resultado esperado:
-- Id | Produto    | Categoria         | Contagem_Por_Categoria
--  1 | Produto A  | Eletrônicos       | 3
--  2 | Produto B  | Eletrônicos       | 3
--  5 | Produto E  | Eletrônicos       | 3
--  3 | Produto C  | Eletrodomésticos  | 2
--  4 | Produto D  | Eletrodomésticos  | 2

-- 6. Valor máximo por categoria (Max by Category)
SELECT 
    Id,
    Produto,
    Categoria,
    Valor,
    MAX(Valor) OVER (PARTITION BY Categoria) AS Max_Valor_Categoria
FROM Vendas;

-- Resultado esperado:
-- Id | Produto    | Categoria         | Valor  | Max_Valor_Categoria
--  1 | Produto A  | Eletrônicos       | 1500.00| 2000.00
--  2 | Produto B  | Eletrônicos       | 2000.00| 2000.00
--  5 | Produto E  | Eletrônicos       | 1200.00| 2000.00
--  3 | Produto C  | Eletrodomésticos  | 500.00 | 800.00
--  4 | Produto D  | Eletrodomésticos  | 800.00 | 800.00

-- Esses exemplos cobrem os principais casos de uso do método OVER no SQL.
