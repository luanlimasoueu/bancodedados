use sqlnotes;

create schema dbsqlnotes;

create table dbsqlnotes.carlistprices( 
car_make varchar(50),
car_mode varchar(50),
car_type varchar(50),
car_price  float); 
 

select * from dbsqlnotes.carlistprices;

insert into dbsqlnotes.carlistprices (car_make, car_mode, car_type, car_price )
values ('Ford'	,  'Mondeo'	,'premium'	,18200);
​

insert into dbsqlnotes.carlistprices (car_make, car_mode, car_type, car_price )
values
('Renault', 'Fuego'	, 'sport'	,16500),
('Citroen'	,'Cactus'	,'premium',	19000),
('Ford'	,'Falcon',	'low cost'	,8990),
('Ford'	,'Galaxy'	,'standard',	12400),
('Renault'	,'Megane'	,'standard',	14300),
('Citroen',	'Picasso'	,'premium', 	23400);


SELECT
    car_make,
    car_mode,
    car_price,
    AVG(car_price) OVER() AS "overall average price",
    AVG(car_price) OVER (PARTITION BY car_type) AS "car type average price"
FROM dbsqlnotes.carlistprices;


SELECT car_make,
       AVG(car_price) AS average_price,
       MAX(car_price) AS top_price
FROM   dbsqlnotes.carlistprices
GROUP BY car_make

