CREATE TABLE Department (
Dept_Code CHAR (5) PRIMARY KEY,
Dept_Name VARCHAR (20) UNIQUE
);

select * from Department;

INSERT INTO Department VALUES ('CS205', 'Computer Science');

select * from Department;

