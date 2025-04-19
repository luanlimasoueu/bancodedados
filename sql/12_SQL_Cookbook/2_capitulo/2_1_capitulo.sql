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


