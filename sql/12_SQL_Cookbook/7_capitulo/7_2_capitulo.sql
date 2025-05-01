use cookbook;

create table t2(sal integer);
insert into t2 values (10);
insert into t2 values (20);
insert into t2 values (null)

create view V_4 (id,amt,trx)
as(
select 1, 100, 'PR'  union all
select 2, 100, 'PR'  union all
select 3, 50, 'PY' union all
select 4, 100, 'PR'  union all
select 5, 200, 'PY'  union all
select 6, 50, 'PY' 
)


