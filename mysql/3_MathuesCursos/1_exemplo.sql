use sakila;

select  min(length) from film;

select title from film where length = 46;

#subquery

select title 
from film
where length = (select  max(length) from film)


select title, rental_duration
from film 
where  rental_duration > (select  avg(rental_duration) from film)

#https://www.youtube.com/watch?v=aYt6pKsBws8


