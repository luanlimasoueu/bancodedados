
use sqlnotes;

create table datas(
id int,
Pnome varchar(20),
Lnome varchar(20),
hire_date date 
)


insert into datas(id, Pnome, Lnome, hire_date)
values (1, 'Lucas', 'Manoel', '2005-03-23' ),
(2, 'Jose', 'João', '2010-01-11' )


select *from datas where 
Lnome like '%J%'

