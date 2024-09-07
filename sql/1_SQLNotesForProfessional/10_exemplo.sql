use sqlnotes;

create table datas(
id int not null ,
data1 date,
data2 date
)

insert into datas(id, data1, data2) values (1, '2017-01-01', '2017-01-31'),(2, '2017-01-31', '2017-01-03')

select * from datas

select coalesce (data1, '1753-01-01')
from datas