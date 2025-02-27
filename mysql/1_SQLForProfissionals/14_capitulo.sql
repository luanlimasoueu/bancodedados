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
limit 3

SELECT departament, min(salario)
from employees_2
group by departament;


create table orders_3 (
orderid int auto_increment primary key,
customerid varchar(20),
customer varchar(20),
total int,
items int
)

insert into orders_3 (customerid, customer, total, items) values ('1', 'Bob', 1300, 10), ('3', 'Bob', 500, 2), ('1', 'Fred', 400, 4)

SELECT * from orders_3

select customer, count(*) as orders
from orders_3
group by customer

select customer, sum(total) as sum_items
from orders_3
group by customer

