CREATE DATABASE mydb;

USE mydb;

CREATE TABLE mytable(
id int unsigned NOT NULL auto_increment,
username varchar(100) NOT NULL,
email varchar(100) NOT NULL,
PRIMARY KEY (id)
);

select * from  mytable;


INSERT INTO mytable ( username, email )
VALUES ( "myuser", "myuser@example.com" );

INSERT INTO mytable ( username, email )
VALUES ( 'username', 'username@example.com' );

UPDATE mytable SET username="myuser" WHERE id=8;

DELETE FROM mytable WHERE id=8;

SELECT * FROM mytable WHERE username = "myuser";

SHOW databases;

SHOW tables;

DESCRIBE mytable;

SELECT * FROM information_schema.PROCESSLIST ORDER BY INFO DESC, TIME DESC;



