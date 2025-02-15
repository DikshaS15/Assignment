# SQL COMMANDS

use mavenmovies;

/*
-- 1. Identify the primary keys and foreign keys in maven movies db. Discuss the differences.

Ans-1. In the Maven Movies database, primary keys and foreign keys play crucial roles in maintaining data integrity and establishing relationships between tables.

1. Primary Keys: A primary key is a unique identifier for each record in a table. It ensures that each record can be uniquely identified and prevents duplicate entries. In the Maven Movies database, examples of primary keys include:

customer_id in the customer table

film_id in the film table

rental_id in the rental table

2. Foreign Keys : A foreign key is a field (or a collection of fields) in one table that uniquely identifies a row of another table. It establishes a link between the data in the two tables. In the Maven Movies database, examples of foreign keys include:

customer_id in the rental table, which references customer_id in the customer table

film_id in the rental table, which references film_id in the film table

3. Differences

1. Purpose: Primary keys uniquely identify records within their own table, while foreign keys create relationships between tables.

2. Uniqueness: Primary keys must be unique and cannot contain NULL values. Foreign keys can have duplicate values and can contain NULL values.

3. Table Relationship: Primary keys are defined within a single table, whereas foreign keys link two tables together.*/


-- 2- List all details of actors
select * from actor;

-- 3 -List all customer information from DB.
select * from customer;

-- 4 -List different countries

select country from country;

-- 5 -Display all active customers.

select concat(first_name," ",last_name) as Full_name from customer where active = 1;

-- 6 -List of all rental IDs for customer with ID 1.

select rental_id from rental where customer_id = 1;

-- 7 - Display all the films whose rental duration is greater than 5 .

select title from film where rental_duration > 5;

-- 8 - List the total number of films whose replacement cost is greater than $15 and less than $20.
 
 select  count(film_id) as Total_number from film where replacement_cost between 15 and 20;
 
 -- 9 - Display the count of unique first names of actors
 
 select count(distinct first_name) as Total_distint_names from actor;
 
 -- 10- Display the first 10 records from the customer table .
 
 select * from customer limit 10;
 
 -- 11 - Display the first 3 records from the customer table whose first name starts with ‘b’.
 
 select first_name from customer where first_name like "b%" limit 3;
 
 -- 12 -Display the names of the first 5 movies which are rated as ‘G’.
 
 select title from film where rating = 'G' order by rating desc limit 5;
 
 -- 13-Find all customers whose first name starts with "a".
 
 select first_name from customer where first_name like "a%";

-- 14- Find all customers whose first name ends with "a".
 
 select first_name from customer where first_name like "%a";
 
 -- 15- Display the list of first 4 cities which start and end with ‘a’ .
 
 select city from city where city like "a%a" limit 4; 
 
 -- 16- Find all customers whose first name have "NI" in any position.
 
 select first_name from customer where first_name like "%NI%";
 
 -- 17- Find all customers whose first name have "r" in the second position .
 
 select first_name from customer where first_name like "_r%";
 
 -- 18 - Find all customers whose first name starts with "a" and are at least 5 characters in length.
 
 select first_name from customer where first_name like "a____";
 
 -- 19- Find all customers whose first name starts with "a" and ends with "o".
 
 select first_name from customer where first_name like "a%o";
 
 -- 20 - Get the films with pg and pg-13 rating using IN operator.
 
SELECT 
    title
FROM
    film
WHERE
    rating IN ('pg' , 'pg-13');
 
 -- 21 - Get the films with length between 50 to 100 using between operator.
 
SELECT 
    title
FROM
    film
WHERE
    LENGTH(title) BETWEEN 50 AND 100;
 
 -- 22 - Get the top 50 actors using limit operator.
 
SELECT 
    CONCAT(first_name, ' ', last_name) AS Full_name
FROM
    actor
LIMIT 50;
 
 -- 23 - Get the distinct film ids from inventory table.
 
SELECT DISTINCT
    (film_id)
FROM
    inventory;



