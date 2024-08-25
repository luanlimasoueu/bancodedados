create table notas (
nome varchar(20),
grades varchar(20)

)

insert into notas(nome, grades) values ('Adam', 'A+'), ('Adam', 'B'), ('Bill', 'A-')


SELECT * FROM notas

SELECT nome, GROUP_CONCAT(grades order by grades desc seperator ' ') as grades
from notas
group by nome

create table employees_2 (
  departament varchar(20),
  salario int
)

SELECT * FROM employees_2

insert into employees_2 (departament, salario) values ('A', 1), ('A', 2), ('B', 1)

SELECT departament, min(salario)
from employees_2
group by departament
limit 2