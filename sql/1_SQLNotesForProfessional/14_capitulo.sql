use sqlnotesweb;

create table indices(
id int,
col1 varchar(5))

insert into indices(id, col1)
values (1, 'a'), (2, 'b'), (3, 'c'), (4, 'd')

select 
	id 
	col1,
	row_number() over (order by id) RowNumber
from indices


