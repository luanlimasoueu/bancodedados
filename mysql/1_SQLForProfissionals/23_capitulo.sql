create table regular (
employee_id int,
firstname varchar(20)
)

insert into regular(employee_id, firstname) values (1, 'Lucas'), (2, 'José')

select * from regular where firstname like '%Jo%'
select * from regular where firstname regexp '^Lu'

select firstname,
if (firstname regexp '^Lu', 'Lu match', 'Does not match') as  matching
from regular 