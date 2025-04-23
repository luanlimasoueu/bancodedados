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


select deptno,ename,sal
from emp
where deptno = 20
order by 1,3


update emp
set sal = sal*1.10
where deptno = 20

select deptno,
ename,
sal as orig_sal,
sal*.10 as amt_to_add,
sal*1.10 as new_sal
from emp
where deptno=20
order by 1,5

select empno, ename
from emp_bonus

update emp
set sal=sal*1.20
where empno in ( select empno from emp_bonus )


select *
from new_sal


select deptno,ename,sal,comm
from emp
order by 1

update emp e, new_sal ns
set e.sal=ns.sal,
e.comm=ns.sal/2
where e.deptno=ns.deptno

select deptno,empno,ename,comm
from emp
order by 1

select deptno,empno,ename,comm
from emp_commission
order by 1

create table dupes (id integer, name varchar(10))

insert into dupes values (1, 'NAPOLEON');
insert into dupes values (2, 'DYNAMITE');

insert into dupes values (3, 'DYNAMITE');
insert into dupes values (4, 'SHE SELLS');
insert into dupes values (5, 'SEA SHELLS');
insert into dupes values (6, 'SEA SHELLS');
insert into dupes values (7, 'SEA SHELLS');

select * from dupes order by 1

select min(id)
from dupes
group by name


select name, min(id)
from dupes
group by name

create table dept_accidents
( deptno integer,
accident_name varchar(20) )

insert into dept_accidents values (10,'BROKEN FOOT');
insert into dept_accidents values (10,'FLESH WOUND');
insert into dept_accidents values (20,'FIRE');
insert into dept_accidents values (20,'FIRE');
insert into dept_accidents values (20,'FLOOD');
insert into dept_accidents values (30,'BRUISED GLUTE');

select * from dept_accidents;

delete from emp
where deptno in ( select deptno
from dept_accidents
group by deptno
having count(*) >= 3 )


select deptno
from dept_accidents
group by deptno
having count(*) >= 3

