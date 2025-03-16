#https://www.youtube.com/watch?v=aYt6pKsBws8

use sakila;

delimiter //
create procedure select_all_activer_users()
begin

  select * from customer
  where active = 1;

end //
delimiter ;


call select_all_activer_users();