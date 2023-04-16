/* This database includes the following four metrics:
    1). Production Information
    2). Sales information
    3). Inventory Information
    4). Customer behavior information

    Before doing any exercise, you should explore the data first. For Exercise 1, we will focus on the 
    product, which is the film (DVD) in this project. Please explore the product-related tables (actor, 
    film_actor, film, language, film_category, category) by using ‘SELECT *’ – do not forget to limit the 
    number of records
*/

SELECT * FROM actor LIMIT 100;
SELECT * FROM film_actor LIMIT 100;
SELECT * FROM film LIMIT 100;
SELECT * FROM language LIMIT 100;
SELECT * FROM film_category LIMIT 100;
SELECT * FROM category LIMIT 100;

-- Using Table FILM 
-- 1. What is the largest rental_rate for each rating?
SELECT rating, max(rental_rate) FROM film GROUP BY 1;

-- 2. How many films in each rating category? 
SELECT rating, COUNT(DISTINCT film_id) AS film_count FROM film GROUP BY 1;

/* 3. Create a new column film_length to segment different films by length:  
      length < 60 then ‘short’; length < 120 then ‘starndard’ ; lengh >=120 then ‘long’ 
	  then count the number of files in each segment. 
*/

SELECT CASE WHEN length > 0 AND length < 60 THEN 'short'
			WHEN length >= 60 AND length < 120 THEN 'standard'
            WHEN length >= 120 THEN 'long'
			ELSE 'others'
            END AS film_length,
            count(DISTINCT film_id) AS film_count
            FROM film
			GROUP BY 1
            ORDER BY 2;

-- 4. Which actors have the last name ‘Johansson’
SELECT * FROM actor WHERE last_name = 'Johansson';

-- Using Table ACTOR
-- 5. How many distinct actors’ last names are there?
SELECT COUNT(DISTINCT last_name) AS Last_name_count FROM actor;

-- 6. Which last names are not repeated? Hint: use COUNT() and GROUP BY and HAVING 
SELECT last_name, COUNT(*) AS num FROM actor GROUP BY 1
HAVING COUNT(*) = 1;

-- 7. Which last names appear more than once? 
SELECT last_name, COUNT(*) AS num FROM actor GROUP BY 1
HAVING COUNT(*) > 1;

-- Using Table FILM_ACTOR 
-- 8. Count the number of actors in each film, order the result by the number of actors with descending order 
SELECT COUNT(DISTINCT actor_id) AS num_of_actor, film_id FROM film_actor GROUP BY 2 ORDER BY 1 DESC;

-- 9. How many films each actor played in?
SELECT actor_id, COUNT(DISTINCT film_id) AS num_of_film FROM film_actor GROUP BY 1 ORDER BY num_of_film DESC;


--Answer

-- before doing any exercise, you should explore the data first

/*
-- 1
select * from actor limit 100;
select * from film_actor limit 100;
select * from film limit 100;
select * from language limit 100;
select * from film_category limit 100;
select * from category limit 100;

-- 2 
select rating, 
max(rental_rate) from film group by 1;

-- 3
select rating, 
count(distinct film_id) from film group by rating;

-- 4
SELECT CASE WHEN length > 0 and length < 60 THEN 'short'			
		    WHEN length >= 60 and length < 120 THEN 'standard'            
		    WHEN length >=120  THEN 'long'           
                         ELSE 'others'            
                         END as film_length, 
                         count(film_id) from film            
                         group by 1
                         order by 2;
-- 5
select * from actor where last_name= 'Johansson';
-- 6
select count(distinct last_name) from actor;
-- 7
select last_name, 
count(*) as num from actor group by last_name 
having count(*) = 1;
-- 8
select last_name, 
count(*) as num from actor 
group by last_name 
having count(*) > 1;
-- 9
select film_id, 
count(distinct actor_id) as num_of_actor 
from film_actor group by film_id order by num_of_actor desc;
-- 10
select actor_id, 
count(distinct film_id) as num_of_film 
from film_actor group by actor_id order by num_of_film desc;

*/
