use cookbook;

select avg(sal) as avg_sal
from emp

select deptno, avg(sal) as avg_sal
from emp
group by deptno


