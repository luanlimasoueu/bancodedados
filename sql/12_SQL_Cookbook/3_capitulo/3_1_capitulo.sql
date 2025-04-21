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

select e.ename, d.loc, eb.received
from emp e join dept d
on (e.deptno=d.deptno)
left join emp_bonus eb
on (e.empno=eb.empno)
order by 2

select e.ename, d.loc,
(select eb.received from emp_bonus eb
where eb.empno=e.empno) as received
from emp e, dept d
where e.deptno=d.deptno
order by 2

create view V_2
as (
select * from emp where deptno != 10
union all
select * from emp where ename = 'WARD'
)

select * from V_2


select e.ename, d.loc
from emp e, dept d
where e.deptno = 10


select e.ename, d.loc
from emp e, dept d
where e.deptno = 10
and d.deptno = e.deptno



select e.empno,
	e.ename,
	e.sal,
	e.deptno,
	e.sal*case when eb.type = 1 then .1
		when eb.type = 2 then .2
		else .3
	end as bonus
from emp e, emp_bonus eb
where e.empno = eb.empno
and e.deptno = 10


select deptno,
	sum(sal) as total_sal,
	sum(bonus) as total_bonus
from (
select e.empno,
	e.ename,
	e.sal,
	e.deptno,
	e.sal*case when eb.type = 1 then .1
				when eb.type = 2 then .2
				else .3
			end as bonus
from emp e, emp_bonus eb
where e.empno = eb.empno
and e.deptno = 10
) x
group by deptno

select sum(sal) from emp where deptno=10

select e.ename,
e.sal
from emp e, emp_bonus eb
where e.empno = eb.empno
and e.deptno = 10


 select deptno,
	sum(distinct sal) as total_sal,
	sum(bonus) as total_bonus
 from (
 select e.empno,
	e.ename,
	e.sal,
	e.deptno,
	e.sal*case when eb.type = 1 then .1
			when eb.type = 2 then .2
			else .3
		end as bonus
from emp e, emp_bonus eb
where e.empno = eb.empno
and e.deptno = 10
 ) x
group by deptno


select d.deptno,
d.total_sal,
sum(e.sal*case when eb.type = 1 then .1
when eb.type = 2 then .2
else .3 end) as total_bonus
from emp e,
emp_bonus eb,
(
select deptno, sum(sal) as total_sal
from emp
where deptno = 10
group by deptno
) d
where e.deptno = d.deptno
and e.empno = eb.empno
group by d.deptno,d.total_sal


select * from emp_bonus

select e.empno,
e.ename,
e.sal,
e.deptno,
e.sal*case when eb.type = 1 then .1
when eb.type = 2 then .2
else .3 end as bonus
from emp e, emp_bonus eb
where e.empno = eb.empno
and e.deptno = 10


select deptno,
sum(distinct sal) as total_sal,
sum(bonus) as total_bonus
from (
 select e.empno,
e.ename,
e.sal,
 e.deptno,
 e.sal*case when eb.type is null then 0
 when eb.type = 1 then .1
 when eb.type = 2 then .2
 else .3 end as bonus
 from emp e left outer join emp_bonus eb
 on (e.empno = eb.empno)
 where e.deptno = 10
)
group by deptno


select deptno,
sum(distinct sal) as total_sal,
sum(bonus) as total_bonus
from (
select e.empno,
e.ename,
e.sal,
e.deptno,
e.sal*case when eb.type is null then 0
when eb.type = 1 then .1
when eb.type = 2 then .2
else .3 end as bonus
from emp e left outer join emp_bonus eb
on (e.empno = eb.empno)
where e.deptno = 10
)
 group by deptno


select distinct deptno,total_sal,total_bonus
from (
	select e.empno,
	e.ename,
	sum(distinct e.sal) over (partition by e.deptno) as total_sal,
    e.deptno,
 sum(e.sal*case when eb.type is null then 0
			when eb.type = 1 then .1
			when eb.type = 2 then .2
			else .3 end) over (partition by deptno) as total_bonus
 from emp e left outer join emp_bonus eb
 on (e.empno = eb.empno)
 where e.deptno = 10
 ) x


select d.deptno,
d.total_sal,
sum(e.sal*case when eb.type = 1 then .1
when eb.type = 2 then .2
else .3 end) as total_bonus
from emp e,
emp_bonus eb,
(
select deptno, sum(sal) as total_sal
from emp
where deptno = 10
group by deptno
) d
where e.deptno = d.deptno
and e.empno = eb.empno
group by d.deptno,d.total_sal

select d.deptno,d.dname,e.ename
from dept d left outer join emp e
on (d.deptno=e.deptno)

select d.deptno,d.dname,e.ename
from dept d right outer join emp e
on (d.deptno=e.deptno)

select d.deptno,d.dname,e.ename
from dept d full outer join emp e
on (d.deptno=e.deptno)

select d.deptno,d.dname,e.ename
from dept d right outer join emp e
on (d.deptno=e.deptno)
union
select d.deptno,d.dname,e.ename
from dept d left outer join emp e
on (d.deptno=e.deptno)


select d.deptno,d.dname,e.ename
from dept d left outer join emp e
on (d.deptno = e.deptno)

select d.deptno,d.dname,e.ename
from dept d right outer join emp e
on (d.deptno = e.deptno)

select ename,comm
from emp
 where coalesce(comm,0) < ( select comm
 from emp
 where ename = 'WARD' )
 
 select ename,comm,coalesce(comm,0)
from emp
where coalesce(comm,0) < ( select comm
from emp
where ename = 'WARD' )
