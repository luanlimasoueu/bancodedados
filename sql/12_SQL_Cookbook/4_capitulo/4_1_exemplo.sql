use cookbook;

insert into dept (deptno,dname,loc)
values (50,'PROGRAMMING','BALTIMORE')

insert into dept (deptno,dname,loc)
values (1,'A','B'),
(2,'B','C')

create table D (id integer default 0, foo VARCHAR(10))

insert into D (id, foo) values (null, 'Brighten')

insert into D (foo) values ('Brighten')

SELECT * FROM  D

 CREATE TABLE dept_east( deptno INT ,dname VARCHAR(120) ,loc VARCHAR(120))

insert into dept_east (deptno,dname  ,loc )
select deptno,dname,loc
from dept
where loc in ( 'NEW YORK','BOSTON' )


SELECT * FROM dept_east


create table dept_2
as
select *
from dept
where 1 = 0

