use cookbook;


select * from emp;

select substr(e.ename,iter.pos,1) as C
from (select ename from emp where ename = 'KING') e,
(select id as pos from t10) iter
where iter.pos <= length(e.ename)


select ename, iter.pos
from (select ename from emp where ename = 'KING') e,
(select id as pos from t10) iter

select ename, iter.pos
from (select ename from emp where ename = 'KING') e,
(select id as pos from t10) iter
where iter.pos <= length(e.ename)


select 'g''day mate' qmarks from t1 union all
select 'beavers'' teeth' from t1 union all
select '''' from t1

select (length('10,CLARK,MANAGER')-
length(replace('10,CLARK,MANAGER',',','')))/length(',')
as cnt
from t1

select
(length('HELLO HELLO')-
length(replace('HELLO HELLO','LL','')))/length('LL')
as correct_cnt,
(length('HELLO HELLO')-
length(replace('HELLO HELLO','LL',''))) as incorrect_cnt
from t1


select ename,
replace(
replace(
replace(
replace(
replace(ename,'A',''),'E',''),'I',''),'O',''),'U','')
as stripped1,
sal,
replace(sal,0,'') stripped2
from emp

select data,
translate(lower(data),
'abcdefghijklmnopqrstuvwxyz',
rpad('z',26,'z')) sal
from (select ename||sal data from emp)


select data,
to_number(
replace(
translate(lower(data),
'abcdefghijklmnopqrstuvwxyz',
rpad('z',26,'z')),'z')) sal
from (select ename||sal data from emp)

select data,
replace(translate(data,'0123456789','0000000000'),'0') ename
from (select ename||sal data from emp)

create view V_4 as
select ename as data
from emp
where deptno=10
union all
select concat(ename,', $',sal,'.00') as data
from emp
where deptno=20
union all
select concat(ename,deptno) as data
from emp
where deptno=30

select * from  V_4

select data
from V_4
where translate(lower(data),
'0123456789abcdefghijklmnopqrstuvwxyz',
rpad('a',36,'a')) = rpad('a',length(data),'a')

 select case
 when cnt = 2 then
 trim(trailing '.' from
 concat_ws('.',
 substr(substring_index(name,' ',1),1,1),
 substr(name,
length(substring_index(name,' ',1))+2,1),
substr(substring_index(name,' ',-1),1,1),
 '.'))
else
 trim(trailing '.' from
concat_ws('.',
 substr(substring_index(name,' ',1),1,1),
 substr(substring_index(name,' ',-1),1,1)
 ))
end as initials
from (
select name,length(name)-length(replace(name,' ','')) as cnt
from (
select replace('Stewie Griffin','.','') as name from t1


select substr(substring_index(name, ' ',1),1,1) as a,
substr(substring_index(name,' ',-1),1,1) as b
from (select 'Stewie Griffin' as name from t1) x




