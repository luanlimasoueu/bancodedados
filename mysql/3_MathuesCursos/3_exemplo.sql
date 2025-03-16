DELIMITER //
create procedure get_movies_from_category ( category_name VARCHAR ( 100))
BEGIN
	SELECT  f.title , c.name from film f
    join film_category fc using (film_id)
    join category c using (category_id)
    where c.name = category_name;
END //
DELIMITER ;


call get_movies_from_category('Action')


DELIMITER //
create procedure get_films_by_rental_duration ( rt INT)
BEGIN
	SELECT title, rental_duration
    from film
    where rental_duration >= rt;
END//
DELIMITER ; 

call get_films_by_rental_duration (6)