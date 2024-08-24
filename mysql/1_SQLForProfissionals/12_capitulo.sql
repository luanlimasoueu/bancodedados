create table costumers_2 (
id int auto_increment primary key,
lastname varchar(20),
email varchar(200)
);

insert into costumers_2 (lastname, email) values ("Lucas", "lucas@email.com")

select * from costumers_2

update costumers_2 set email = 'luan"hotmail.com' where id=1

UPDATE costumers_2
SET lastname =
(CASE id WHEN 1 THEN 'Karl'
WHEN 2 THEN 'Tom'
WHEN 3 THEN 'Mary'
END)
WHERE id IN (1,2,3);

