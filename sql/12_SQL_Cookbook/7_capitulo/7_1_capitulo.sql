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


select ward_hd, allen_hd
from (
select hiredate as ward_hd
from emp
where ename = 'WARD'
)x ,
(
select hiredate as allen_hd
from emp
where ename = 'ALLEN'
) y


1 select sum(case when date_format(
2 date_add(jones_hd,
3 interval t500.id-1 DAY),'%a')
4 in ( 'Sat','Sun' )
5 then 0 else 1
6 end) as days
7 from (
8 select max(case when ename = 'BLAKE'
9 then hiredate
10 end) as blake_hd,
11 max(case when ename = 'JONES'
12 then hiredate
13 end) as jones_hd
14 from emp
15 where ename in ( 'BLAKE','JONES' )
16 ) x,
17 t500
18 where t500.id <= datediff(blake_hd,jones_hd)+1


select case when ename = 'BLAKE'
then hiredate
end as blake_hd,
case when ename = 'JONES'
then hiredate
end as jones_hd
from emp
where ename in ( 'BLAKE','JONES' )


select max(case when ename = 'BLAKE'
then hiredate
end) as blake_hd,
max(case when ename = 'JONES'
then hiredate
end) as jones_hd
from emp
where ename in ( 'BLAKE','JONES' )


select x.*, t500.*, jones_hd+t500.id-1
from (
select max(case when ename = 'BLAKE'
then hiredate
end) as blake_hd,
max(case when ename = 'JONES'
then hiredate
end) as jones_hd
from emp
where ename in ( 'BLAKE','JONES' )
) x,
t500
where t500.id <= blake_hd-jones_hd+1


select mnth, mnth/12
from (
select (year(max_hd) - year(min_hd))*12 +
(month(max_hd) - month(min_hd)) as mnth
from (
select min(hiredate) as min_hd, max(hiredate) as max_hd
from emp
) x
) y

select year(max_hd) as max_yr, year(min_hd) as min_yr,
month(max_hd) as max_mon, month(min_hd) as min_mon
from (
select min(hiredate) as min_hd, max(hiredate) as max_hd
from emp
) x

 select datediff(day,allen_hd,ward_hd)*24 hr,
 datediff(day,allen_hd,ward_hd)*24*60 min,
 datediff(day,allen_hd,ward_hd)*24*60*60 sec
 from (
 select max(case when ename = 'WARD'
 then hiredate
 end) as ward_hd,
 max(case when ename = 'ALLEN'
 then hiredate
 end) as allen_hd
from emp
) x
