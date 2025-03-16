#trigger

create trigger before_update_costumer
	before update on customer
    for each row
    set new.last_update = now(); 

update  customer
set first_name = 'Joaquim'
where customer_id = 2;


select * from  customer


#https://www.youtube.com/watch?v=aYt6pKsBws8