CREATE DATABASE stackoverflow;

USE stackoverflow;

Create table stack(
id_user int NOT NULL,
username varchar(30) NOT NULL,
password varchar(30) NOT NULL
);

ALTER TABLE stack ADD COLUMN submit date NOT NULL; -- add new column

select * from stack;

ALTER TABLE stack ADD COLUMN submit date NOT NULL; 

ALTER TABLE stack DROP COLUMN submit;

ALTER TABLE stack MODIFY submit DATETIME NOT NULL; 




