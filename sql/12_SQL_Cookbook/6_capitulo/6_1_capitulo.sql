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

