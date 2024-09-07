use sqlnotes;

select concat(Pnome, '_',  Lnome) from datas_1

create table ItemSales (
id int,
saledata date,
quantidade int
)

insert into ItemSales (id, saledata, quantidade)
values (1, '2013-07-01', 10),
(2, '2013-07-01', 15),
(3, '2013-07-23', 15),
(4, '2013-07-26', 30)

select * from ItemSales
where saledata between '2013-06-01' and '2013-07-01'
and quantidade = 10


create table costumerid(
)