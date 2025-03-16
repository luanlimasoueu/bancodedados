#Views

create view file_and_category
as
select f.film_id, f.title, c.name
from film f
join film_category fc using (film_id)
join category c
using (category_id)
