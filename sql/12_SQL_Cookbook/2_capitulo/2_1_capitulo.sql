use cookbook;

select ename,job,sal
from emp
where deptno = 10
order by sal asc;

select ename,job,sal
from emp
where deptno = 10
order by 3 desc;

select empno,deptno,sal,ename,job
from emp
order by deptno, sal desc


select ename,job
from emp
order by substr(job,length(job)-1)

create view V
as(
select concat(ename, ' WORKS AS A ',deptno) as data_v
from emp
)
select * from V


select ename,sal,comm
from emp
order by 3


select ename,sal,comm
from (
select ename,sal,comm,
case when comm is null then 0 else 1 end as is_null
from emp
) x
order by is_null desc,comm


select ename,sal,job,comm
from emp
order by case when job = 'SALESMAN' then comm else sal end


select ename,sal,job,comm,
case when job = 'SALESMAN' then comm else sal end as ordered
from emp
order by 5

