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
customerid int,
productid int,
quantity int,
price float
)

insert into costumerid (customerid, productid, quantity, price)
values
( 1, 2, 5, 100 ),
( 1, 3, 2, 200),
( 1, 4, 1, 500),
( 2, 1, 4, 50), 
(3, 5, 6, 700)


select customerid
from costumerid 
where productid in (2,3)
group by customerid
having count(distinct productID) = 2

select customerId
from costumerid 
group by customerId
having sum(case when productID = 2 then 1 else 0 end) > 0
and sum(case when productID = 3 then 1 else 0 end) > 0
