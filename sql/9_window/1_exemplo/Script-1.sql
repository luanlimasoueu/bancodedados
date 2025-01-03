use sqlnotes;


CREATE TABLE sql_table1 (
    Name varchar(255),
    Age  int ,
    Department varchar(255),
    Salary float
);



INSERT INTO sql_table1 VALUES 
('Ramesh',	20,	'Finance'	,50.000),
('Deep',	25,	'Sales',	30.000),
('Suresh'	,22,	'Finance',	50.000),
('Ram',	28	,'Finance',	20.000),
('Pradeep',	22	,'Sales',	20.000)


SELECT Name, Age, Department, Salary, 
 AVG(Salary) OVER( PARTITION BY Department) AS Avg_Salary,
 max(Salary) OVER( PARTITION BY Department) AS Max_Salary
 FROM sql_table1
 
 
 
 SELECT 
    ROW_NUMBER() OVER (PARTITION BY Department ORDER BY Salary DESC) AS emp_row_no, 
    Name,  
    Department, 
    Salary,
    RANK() OVER(PARTITION BY Department ORDER BY Salary DESC) AS emp_rank,
    DENSE_RANK() OVER(PARTITION BY Department ORDER BY Salary DESC) AS emp_dense_rank
FROM 
    sql_table1;
    
   