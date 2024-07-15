-- https://www.w3schools.com/postgresql/postgresql_create_table.php

CREATE TABLE cars (
  brand VARCHAR(255),
  model VARCHAR(255),
  year INT
);

select * from cars;

insert into cars (brand, model, year)
values ('Ford', 'Mustang', 1964)

select * from cars;


insert into cars (brand, model, year)
values ('Volvo', 'p1800', 1968), ('BMW', 'M1', 1978)


select * from cars;


ALTER TABLE cars
ADD color VARCHAR(255);

SELECT * FROM cars;

UPDATE cars
SET color = 'red'
WHERE brand = 'Volvo';


SELECT * FROM cars;


ALTER TABLE cars
ALTER COLUMN year TYPE VARCHAR(4);

SELECT * FROM cars;


ALTER TABLE cars
DROP COLUMN color;


SELECT * FROM cars;

DELETE FROM cars
WHERE brand = 'Volvo';

SELECT * FROM cars;




