use sqlnotes;

CREATE TABLE Vendas (
    ID INT PRIMARY KEY,
    Vendedor VARCHAR(50),
    Produto VARCHAR(50),
    Quantidade INT,
    Preco DECIMAL(10, 2),
    Data_Venda DATE
);

INSERT INTO Vendas VALUES
(1, 'Ana', 'Notebook', 2, 2500.00, '2024-01-01'),
(2, 'Bruno', 'Tablet', 5, 1200.00, '2024-01-02'),
(3, 'Carlos', 'Notebook', 3, 2400.00, '2024-01-03'),
(4, 'Ana', 'Smartphone', 10, 1500.00, '2024-01-04'),
(5, 'Bruno', 'Notebook', 1, 2600.00, '2024-01-05');

#1. ROW_NUMBER()

SELECT 
    ID,
    Vendedor,
    Produto,
    ROW_NUMBER() OVER (PARTITION BY Vendedor ORDER BY Data_Venda) AS Num_Linha
FROM Vendas;

#2. RANK()

SELECT 
    ID,
    Vendedor,
    Preco,
    RANK() OVER (PARTITION BY Vendedor ORDER BY Preco DESC) AS Rank_Venda
FROM Vendas;


#3. DENSE_RANK()

SELECT 
    ID,
    Vendedor,
    Preco,
    DENSE_RANK() OVER (PARTITION BY Vendedor ORDER BY Preco DESC) AS Dense_Rank
FROM Vendas;

#4. NTILE(n)


SELECT 
    ID,
    Vendedor,
    Preco,
    NTILE(2) OVER (ORDER BY Preco DESC) AS Grupo
FROM Vendas;

#5. SUM()

SELECT 
    ID,
    Vendedor,
    Preco,
    SUM(Preco) OVER (PARTITION BY Vendedor ORDER BY Data_Venda) AS Total_Acumulado
FROM Vendas;

#6. AVG()

SELECT 
    ID,
    Vendedor,
    Preco,
    AVG(Preco) OVER (PARTITION BY Vendedor ORDER BY Data_Venda) AS Media_Acumulada
FROM Vendas;


#7. MIN() e MAX()

SELECT 
    ID,
    Vendedor,
    Preco,
    MIN(Preco) OVER (PARTITION BY Vendedor ORDER BY Data_Venda) AS Min_Acumulado,
    MAX(Preco) OVER (PARTITION BY Vendedor ORDER BY Data_Venda) AS Max_Acumulado
FROM Vendas;


#7. MIN() e MAX()

SELECT 
    ID,
    Vendedor,
    Preco,
    LAG(Preco) OVER (PARTITION BY Vendedor ORDER BY Data_Venda) AS Preco_Anterior
FROM Vendas;


#8. LAG()


SELECT 
    ID,
    Vendedor,
    Preco,
    LAG(Preco) OVER (PARTITION BY Vendedor ORDER BY Data_Venda) AS Preco_Anterior
FROM Vendas;


#9. LEAD() 

SELECT 
    ID,
    Vendedor,
    Preco,
    LEAD(Preco) OVER (PARTITION BY Vendedor ORDER BY Data_Venda) AS Proximo_Preco
FROM Vendas;







