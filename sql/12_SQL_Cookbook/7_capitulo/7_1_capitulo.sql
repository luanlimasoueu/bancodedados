use cookbook;

select avg(sal) as avg_sal
from emp

select deptno, avg(sal) as avg_sal
from emp
group by deptno

select avg(sal) 
from t2

select avg(sal)
from emp
group by deptno

select min(sal) as min_sal, max(sal) as max_sal
from emp

select deptno, min(sal) as min_sal, max(sal) as max_sal
from emp
group by deptno


select deptno, comm
from emp
where deptno in (10,30)
order by 1

select deptno, min(comm), max(comm)
from emp
group by deptno

select min(comm), max(comm)
from emp
group by deptno

select deptno, count(*), count(comm), count('hello')
from emp
group by deptno

select ename, sal,
sum(sal) over (order by sal,empno) as running_total
from emp
order by 2

select empno,ename,sal,
exp(sum(ln(sal))over(order by sal,empno)) as running_prod
from emp
where deptno = 10

with rank_tab  as
(
select sal, cume_dist() over (order by sal) as rank_sal
from emp
where deptno=20
),
inter as
(
select sal, rank_sal from rank_tab
where rank_sal>=0.5
union all 
select sal, rank_sal from rank_tab
where rank_sal<=0.5
)
select avg(sal)
from inter

select (sum(
 case when deptno = 10 then sal end)/sum(sal)
 )*100 as pct
 from emp
 
 select deptno,
sum(sal)over() total,
sum(sal)over(partition by deptno) d10
from emp

select ename, comm
from emp
where deptno=30
order by comm desc


select (sum(sal)-min(sal)-max(sal))/(count(*)-2)
from emp


create view V_4 (id,amt,trx)
as
select 1, 100, 'PR' from t1 union all
select 2, 100, 'PR' from t1 union all
select 3, 50, 'PY' from t1 union all
select 4, 100, 'PR' from t1 union all
select 5, 200, 'PY' from t1 union all
select 6, 50, 'PY' from t1
