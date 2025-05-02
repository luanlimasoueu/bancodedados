use cookbook;

select deptno,
sum(case when deptno=10 then 1 else 0 end) as deptno_10,
sum(case when deptno=20 then 1 else 0 end) as deptno_20,
sum(case when deptno=30 then 1 else 0 end) as deptno_30
from emp
group by deptno

select max(case when job='CLERK'
then ename else null end) as clerks,
max(case when job='ANALYST'
then ename else null end) as analysts,
max(case when job='MANAGER'
then ename else null end) as mgrs,
max(case when job='PRESIDENT'
then ename else null end) as prez,
max(case when job='SALESMAN'
then ename else null end) as sales
from emp


select deptno dno, job,
max(case when deptno=10
then ename else null end) as d10,
max(case when deptno=20
then ename else null end) as d20,
max(case when deptno=30
then ename else null end) as d30,
max(case when job='CLERK'
then ename else null end) as clerks,
max(case when job='ANALYST'
then ename else null end) as anals,
max(case when job='MANAGER'
then ename else null end) as mgrs,
max(case when job='PRESIDENT'
then ename else null end) as prez,
max(case when job='SALESMAN'
then ename else null end) as sales
from (
Select deptno,
job,
ename,
row_number()over(partition by job order by ename) rn_job,
row_number()over(partition by job order by ename) rn_deptno
from emp
) x
group by deptno, job, rn_deptno, rn_job
order by 1

select dept.deptno,
emp_cnts.deptno_10,
emp_cnts.deptno_20,
emp_cnts.deptno_30
from (
Select sum(case when deptno=10 then 1 else 0 end) as deptno_10,
sum(case when deptno=20 then 1 else 0 end) as deptno_20,
sum(case when deptno=30 then 1 else 0 end) as deptno_30
from emp
) emp_cnts,
(select deptno from dept where deptno <= 30) dept







