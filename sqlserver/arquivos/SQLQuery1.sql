use teste;

CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(100)
);

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  total_amount DECIMAL(10, 2),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
  order_item_id INT PRIMARY KEY,
  order_id INT,
  product_id INT,
  quantity INT,
  FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO customers(customer_id, customer_name)
VALUES (1, 'Rohan'), (2, 'Viraj'), (3, 'Kartik'), (4, 'Navin');

INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES (101, 1, '2022-12-15', 100.00), (102, 2, '2023-01-05', 75.50),
       (103, 3, '2023-01-20', 250.00), (104, 2, '2023-02-01', 50.00),
       (105, 4, '2023-02-08', 120.00), (106, 1, '2023-02-10', 80.00);

INSERT INTO order_items (order_item_id, order_id, product_id, quantity)
VALUES (1, 101, 1, 2), (2, 101, 3, 1), (3, 102, 2, 3), (4, 103, 4, 1),
       (5, 103, 2, 2), (6, 103, 1, 1), (7, 104, 3, 1), (8, 105, 2, 1),
       (9, 105, 3, 2), (10, 106, 1, 2);


select * from order_items;

with cte as (select customer_name, orders.customer_id, orders.order_id
from customers
inner join orders
on customers.customer_id = orders.customer_id
inner join order_items
on order_items.order_id = orders.order_id)

select customer_name, COUNT(customer_id) as contagem from cte
group by customer_name;


with cte as (select customer_name, orders.customer_id, orders.order_id
from customers
inner join orders
on customers.customer_id = orders.customer_id
inner join order_items
on order_items.order_id = orders.order_id)

select customer_name,
case 
	when customer_name = 'Rohan' then 'Not null'
else
	'null'
end as validacao
from cte



