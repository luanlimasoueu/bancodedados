use cookbook;

select sal
from (
select row_number() over (order by sal) as rn,
sal
from emp
) x
where rn between 1 and 5


select sal
from (
select row_number() over (order by sal) as rn,
sal
from emp
) x
where rn between 6 and 10

select e.ename, d.deptno, d.dname, d.loc
from dept d, emp e
where d.deptno = e.deptno
and (e.deptno = 10 or e.deptno = 20)
order by 2


select ename, sal, hiredate
  from (
select ename, sal, hiredate,
 lead(sal)over(order by hiredate) next_sal
 from emp
 ) alias
 where sal < next_sal

select job
from (
select job,
row_number()over(partition by job order by job) rn
from emp
) x
 where rn = 1
 
 select job,
row_number()over(partition by job order by job) rn
from emp

select deptno,
ename,
sal,
hiredate,
max(latest_sal)over(partition by deptno) latest_sal
from (
select deptno,
ename,
sal,
hiredate,
case
when hiredate = max(hiredate)over(partition by deptno)
then sal else 0
end latest_sal
from emp
) x
order by 1, 4 desc

with nrows(n) as (
select 1 from t1 union all
select n+1 from nrows where n+1 <= 3
)
select nrows.n,
orders.*
from (
select nrows.n id,
getdate()+nrows.n as order_date,
getdate()+nrows.n+2 as process_date
from nrows
) orders, nrows
order by 2,1



