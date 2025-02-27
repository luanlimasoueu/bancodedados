create database partitions;

use partitions;

create table table1 (
ID int,
Letter varchar(20),
Val varchar(20)
)

insert into table1 (ID, Letter, Val)
values
(1, 'A', 'un2'),
(2, 'B', 'un4'),
(3, 'C', 'un5'),
(4, 'D', 'un8'),
(5, 'A', 'un1')


select * from table1


select *,
	row_number() over (partition by id order by id) partitionId
from table1


insert into table1 (ID, Letter, Val)
values
(1, 'A', 'un2'),
(2, 'A', 'un4'),
(3, 'A', 'un4')


select *,
    -- row_number() over (partition by id order by id) partitionId,
	-- row_number() over (partition by Letter ) partitionLetter,
	-- row_number() over (partition by Letter order by Val ) partitionLetter
       row_number() over (partition by Letter, Val order by Val ) partitionLetter
from table1
