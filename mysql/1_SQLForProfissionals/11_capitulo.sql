create table people
( id int primary key,
name varchar(100) not null,
gender char(1) not null
);

insert people (id,name,gender) values
(1,'Kathy','f'),(2,'John','m'),(3,'Paul','m'),(4,'Kim','f');

select * from  people;

create table pets
( id int auto_increment primary key,
ownerId int not null,
name varchar(100) not null,
color  varchar(100) not null
);

insert pets(ownerId,name,color) values
(1,'Rover','beige'),(2,'Bubbles','purple'),(3,'Spot','black and white'),
(1,'Rover2','white');

DELETE p2
FROM pets p2
WHERE p2.ownerId in (
SELECT p1.id
FROM people p1
WHERE p1.name = 'Paul');


DELETE p2 -- remove only rows from pets
FROM people p1
JOIN pets p2
ON p2.ownerId = p1.id
WHERE p1.name = 'Paul';


ALTER TABLE pets ADD CONSTRAINT `fk_pets_2_people` FOREIGN KEY (ownerId) references people(id) ON
DELETE CASCADE;

SELECT * FROM people;
SELECT * FROM pets;

DELETE FROM people
WHERE name = 'Paul';

SET foreign_key_checks = 0;
DELETE p1, p2 FROM people p1 JOIN pets p2 ON p2.ownerId = p1.id WHERE p1.name = 'Paul';
SET foreign_key_checks = 1;



