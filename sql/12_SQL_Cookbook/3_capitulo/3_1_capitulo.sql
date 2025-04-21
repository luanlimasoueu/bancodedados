use cookbook;

select ename as ename_and_dname, deptno
from emp
where deptno = 10
union all
 select '----------', null
from t1
union all
select dname, deptno
from dept;


select deptno
from emp
union
select deptno
from dept;

select e.ename, d.loc
from emp e, dept d
 where e.deptno = d.deptno
and e.deptno = 10;


select e.ename, d.loc,
e.deptno as emp_deptno,
d.deptno as dept_deptno
from emp e, dept d
where e.deptno = 10;

select e.ename, d.loc,
e.deptno as emp_deptno,
d.deptno as dept_deptno
from emp e, dept d
where e.deptno = d.deptno
and e.deptno = 10;

select e.ename, d.loc
from emp e inner join dept d
on (e.deptno = d.deptno)
where e.deptno = 10


create view V_1
as (
select ename,job,sal
from emp
where job = 'CLERK'
)

select * from V_1

select e.empno,e.ename,e.job,e.sal,e.deptno
from emp e,  V_1 v
where e.ename = v.ename
and e.job = v.job
and e.sal = v.sal


select e.empno,e.ename,e.job,e.sal,e.deptno
from emp e join V_1 v
 on ( e.ename = v.ename
and e.job = v.job
and e.sal = v.sal )

select deptno
from dept
where deptno not in (select deptno from emp)

create table new_dept(deptno integer)
insert into new_dept values (10)
insert into new_dept values (50)
insert into new_dept values (null)


select *
from dept
where deptno not in (select deptno from new_dept)


select deptno
from dept
where deptno in ( 10,50,null );


select d.deptno
from dept d
where not exists (
select 1
from emp e
where d.deptno = e.deptno
)

select d.deptno
from dept d
where not exists (
select 1
from new_dept nd
where d.deptno = nd.deptno
)

select d.*
from dept d left outer join emp e
on (d.deptno = e.deptno)
where e.deptno is null

select e.ename, e.deptno as emp_deptno, d.*
from dept d left join emp e
on (d.deptno = e.deptno)


select e.ename, d.loc
from emp e, dept d
where e.deptno=d.deptno


select * from emp;

select * from dept;

select e.ename, d.loc
from emp e, dept d
where e.deptno=d.deptno

select e.ename, d.loc,eb.received
from emp e, dept d, emp_bonus eb
where e.deptno=d.deptno
and e.empno=eb.empno



