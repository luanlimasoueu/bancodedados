CREATE TABLE CUSTOMERS (
   ID INT NOT NULL,
   NAME VARCHAR (20) NOT NULL,
   AGE INT NOT NULL,
   ADDRESS CHAR (25),
   SALARY DECIMAL (18, 2),
   PRIMARY KEY (ID)
);

INSERT INTO CUSTOMERS VALUES 
(1, 'Ramesh', 32, 'Ahmedabad', 2000.00),
(2, 'Khilan', 25, 'Delhi', 1500.00),
(3, 'Kaushik', 23, 'Kota', 2000.00),
(4, 'Chaitali', 25, 'Mumbai', 6500.00),
(5, 'Hardik', 27, 'Bhopal', 8500.00),
(6, 'Komal', 22, 'Hyderabad', 4500.00),
(7, 'Muffy', 24, 'Indore', 10000.00);

SELECT * FROM CUSTOMERS;

COMMIT;
START TRANSACTION;
DELETE FROM CUSTOMERS WHERE AGE = 25;
COMMIT;

SELECT * FROM CUSTOMERS;

ROLLBACK;


SELECT * FROM CUSTOMERS;


DELETE FROM CUSTOMERS WHERE AGE = 25;

SELECT * FROM CUSTOMERS;


-- Transation

CREATE TABLE order_history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    quantity INT
);


START TRANSACTION;


INSERT INTO order_history (product_id, quantity) 
VALUES (1, 10),(2,50),(3,100);


select * from order_history

COMMIT;

select * from order_history

ROLLBACK;

select * from order_history

INSERT INTO order_history (product_id, quantity) 
VALUES (4, 10);













