select *
from emp;


select empno,ename,job,sal,mgr,hiredate,comm,deptno
from emp;


select *
from emp
where deptno = 10;


select *
from emp
where deptno = 10
or comm is not null
or sal <= 2000 and deptno=20;


select *
from emp
where ( deptno = 10
or comm is not null
or sal <= 2000
)
and deptno=20;

select sal as salary, comm as commission
from emp;


select ename,deptno,sal
from emp;

select sal as salary, comm as commission
from emp
where salary < 5000;


select *
from (
select sal as salary, comm as commission
from emp
) x
where salary < 5000;


select ename, job
from emp
where deptno = 10;


select concat(ename, ' WORKS AS A ',job) as msg
from emp
where deptno=10


select ename,sal,
	case when sal <= 2000 then 'UNDERPAID'
		 when sal >= 4000 then 'OVERPAID'
		 else 'OK'
	end as status
from emp

select *
from emp limit 5


