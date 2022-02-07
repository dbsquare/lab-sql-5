#Drop column picture from staff.
ALTER TABLE staff DROP COLUMN picture; 


#Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. 
select customer_id from sakila.customer where first_name = 'CHARLOTTE' and last_name = 'HUNTER'; # to find the customer_id
select film_id from film where title = "Academy Dinosaur"; #to find the film_id = 1
select inventory_id from inventory where film_id = 1; # to find how many inventories there are
insert into rental values (231298, now(), 9, 403, now(), 1, now()); # to insert a new rental
select * from rental where rental_id = 231298;

#A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
insert into staff (staff_id, `active`, `password`, username, store_id, first_name, last_name, address_id, email, last_update)
select '3', '1', '', 'Tammy', store_id, first_name, last_name, address_id, email, last_update
from customer
where first_name = 'Tammy' and last_name = 'Sanders';

select * from staff where first_name = 'Tammy';

#Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted.
#Check if there are any non-active users
select * from customer where active =0;

#Create a table backup table as suggested
create table deleted_users(
  customer_id int(8),
  email text default null,
  date text);
  
  #Insert the non active users in the table backup table
  insert into deleted_users (customer_id,email,date)
  select customer_id, email, last_update
  from customer
  where active = 0;
  SELECT * FROM DELETED_USERS; # just to see the backup table
  
  
  #Delete the non active users from the table customer
  Delete from CUSTOMER where ACTIVE=0;