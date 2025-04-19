Create Database Company_db;
 ## 1 create a SQL Query to creat the above table with the all constraints
 create table employees(
 emp_id INTEGER PRIMARY KEY NOT NULL,
 emp_name VARCHAR(100) NOT NULL,
 age INTEGER CHECK (age >= 18),
 email VARCHAR(255) UNIQUE,
 salary DECIMAL DEFAULT 30000
 );
 
## 2. Explain the purpose of constraints and how they help maintain data integrity in a database. Provide examples of common types of constraints.
## Constraints ensure that the data in a database remains accurate and reliable. They:
## Prevent invalid data entry (e.g., age < 0).
## Enforce relationships between tables (foreign keys).
## Prevent duplication (e.g., unique emails).
## Common types:
## PRIMARY KEY: Uniquely identifies each record.
## FOREIGN KEY: Links two tables.
## NOT NULL: Ensures a field is never empty.
## UNIQUE: No duplicate values.
## CHECK: Enforces a condition.
## DEFAULT: Assigns a value if none is provided.
 
## 3. Why would you apply the NOT NULL, constraint to a column? Can a primary key contain NULL values? Justify your answer.
## NOT NULL ensures a column must have a value.
## A PRIMARY KEY is both NOT NULL and UNIQUE.
## ❌ A primary key cannot contain NULL values — because it must uniquely identify each row. 

## 4. Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an example for both adding and removing a constraint.
## Add Constraint
alter table employees
add constraint chk_age check(age>=18);

## Remove Constraint
alter table employees
drop constraint chk_age;

## 5. Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints. Provide an example of an error message that might occur when violating a constraint.

## insert
insert into employees(emp_id,emp_name,age, email) values(1,"Abhi",17,"abhiparakhiya@gmail.com");

## Update 
update employees Set emp_name = null , emp_id = 101 ;

## Delete
delete from employees where emp_id = 1;

# 6. You created a products table without constraints as follows:
use company_db;
CREATE TABLE products (
product_id INT,
product_name VARCHAR(50),
price DECIMAL(10, 2));

# Now, you realise that:
# The product_id should be a primary key. 
alter table products
add primary key (product_id );

# The price should have a default value of 50.00
alter table products
modify price decimal(10,2) default 50.00;

# 7. You have two tables:

# Students 
# student_id | student_name | class_id
#     1      |   Alice      |   101
#     2      |    Bob       |   102
#     3      |  Charlie     |   101

# Classes:
# class_id | class_name |
#   101    |   Math     |
#   102    |  Science   |
#   103    |  History   |

# Write a query to fetch the student_name and class_name for each student using an INNER JOIN.
select Students.student_name,Classes.class_name 
from Students 
inner join Classes 
on Students.class_id = Classes.class_id

# 8. Consider the following three tables:

# Orders:
# order_id | order_date | customer_id
#   1      | 2024-01-01 |    101
#   2      | 2024-01-03 |    102

# customers:
# customer_id | customer_name
#    101      |   Alice
#    102      |   Bob

# Products:
# product id | product_name | order id
#    1       |    Laptop    |   1
#    2       |     Phone    | NULL

# Write a query that shows all order_id, customer_name, and product_name, ensuring that all products are listed even if they are not associated with an order
# Hint: (use INNER JOIN and LEFT JOIN).
SELECT 
    Orders.order_id,
    Customers.customer_name,
    Products.product_name
FROM Products p
LEFT JOIN Orders o ON p.order_id = o.order_id
LEFT JOIN Customers c ON o.customer_id = c.customer_id;

# 9. Given the following tables:
# Sales:
# sale_id | product_id | amount
#   1     |    101     | 500
#   2     |    102     | 300
#   3     |    103     | 700

# Products
# product id | product_name
#  101       | Laptop
#  102       | Phone
# Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function.
select product_name, sum(amount) 
from Sales 
Left join Products 
on Sales.product_id = Products.product_id;
  

# 10. You are given three tables:
# Orders:
# order _id | order_date | customer_id
#    1      | 2024-01-02 |    1
#    2      | 2024-01-05 |    2

# Customers:
# customer_id | customer_name
#    1        |   Alice
#    2        |   Bob

# OrderDetails:
# order_id | product_id | quantity
#    1     |   101      |   2
#    1     |   102      |   1
#    2     |   101      |   3

# Write a query to display the order_id, customer_name, and the quantity of products ordered by each customer using an INNER JOIN between all three tables.
select order_id, customer_name, quantity as quantiity_of_products_ordered 
from Orders 
inner join OrderDetails on Orders.order_id = OrderDetails.order_id
inner join Customers on Orders.customer_id = Customers.customer_id ;
#  Note-The above-mentioned questions don't require any dataset.

# SQL Commands

# 1-Identify the primary keys and foreign keys in maven movies db. Discuss the differences
# Primary Keys:
# actor.actor_id
# film.film_id
# customer.customer_id
# rental.rental_id
# payment.payment_id
#Foreign Keys:
# film_actor.actor_id → actor.actor_id
# film_actor.film_id → film.film_id
# rental.customer_id → customer.customer_id
# rental.inventory_id → inventory.inventory_id
# payment.rental_id → rental.rental_id
# payment.customer_id → customer.customer_id
# 📌 Difference:
# Primary Key uniquely identifies each record in a table.
# Foreign Key links records across tables (ensures referential integrity).
use sakila;
# 2-List all details of actors
select * from actor;

# 3-List all customer information from DB.
select * from customer;

# 4-List different countries.
select * from country;

# 5-Display all active customers.
select * from customer where active = 1;

# 6-List of all rental IDs for customer with ID 1.
select rental_id from rental where customer_id = 1;

# 7-Display all the films whose rental duration is greater than 5.
select * from film where rental_duration > 5;

# 8-List the total number of films whose replacement cost is greater than $15 and less than $20.
select * from film where replacement_cost > 15 and replacement_cost < 20; 

# 9-Display the count of unique first names of actors.
SELECT COUNT(DISTINCT first_name) FROM actor;

# 10- Display the first 10 records from the customer table.
select * from customer LIMIT 10;

# 11-Display the first 3 records from the customer table whose first name starts with 'b'.
select * from customer where first_name like 'b%' LIMIT 3;

# 12-Display the names of the first 5 movies which are rated as 'G'.
select title from film where rating = 'G' limit 5;

# 13-Find all customers whose first name starts with "a".
select * from customer where first_name like 'a%' ;

# 14-Find all customers whose first name ends with "a".
select * from city where first_name like '%a' ;

# 15-Display the list of first 4 cities which start and end with 'a'.
select city from city where city like 'a%a' limit 4 ;

# 16-Find all customers whose first name have "Ni" in any position.
select * from customer where first_name like '%ni%';

# 17- Find all customers whose first name have "r" in the second position.
select first_name from customer where first_name like '_r%';

# 18- Find all customers whose first name starts with "a" and are at least 5 characters in length.
select first_name from customer where first_name like 'a____';

# 19- Find all customers whose first name starts with "a" and ends with "o".
select first_name from customer where first_name like 'a%o';

# 20-Get the films with pg and pg-13 rating using IN operator.
select * from film where rating in ('PG','PG-13');

# 21-Get the films with length between 50 to 100 using between operator.
select * from film where length between 50 and 100;

# 22-Get the top 50 actors using limit operator.
select * from actor limit 50;

# 23-Get the distinct film ids from inventory table.
select distinct film_id from inventory;

# Functions

# Basic Aggregate Functions:

# Question 1: Retrieve the total number of rentals made in the Sakila database. Hint: Use the COUNT() function.
select count(*) as Total_rentals from rental;

# Question 2: Find the average rental duration (in days) of movies rented from the Sakila database. Hint: Utilize the AVG() function.
select avg(rental_duration) as avg_rental_duration from film;

# String Functions:
# Question 3: Display the first name and last name of customers in uppercase. Hint: Use the UPPER () function.
select upper(first_name) as fname, upper(last_name) as lname from customer;

# Question 4: Extract the month from the rental date and display it alongside the rental ID. Hint: Employ the MONTH() function.
select rental_id, rental_date,month(rental_date) as Months from rental;

# GROUP BY:
# Question 5: Retrieve the count of rentals for each customer (display customer ID and the count of rentals). Hint: Use COUNT () in conjunction with GROUP BY.
select customer_id,count(*) as Count_of_rentals from rental group by customer_id ;

# Question 6: Find the total revenue generated by each store. Hint: Combine SUM() and GROUP BY.
SELECT store_id, SUM(amount) AS total_revenue
FROM payment
JOIN staff ON payment.staff_id = staff.staff_id
GROUP BY store_id;

# Question 7: Determine the total number of rentals for each category of movies. Hint: JOIN film_category, film, and rental tables, then use COUNT () and GROUP BY.
SELECT c.name AS category_name, COUNT(*) AS rental_count
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name;

# Question 8: Find the average rental rate of movies in each language. Hint: JOIN film and language tables, then use AVG () and GROUP BY.
SELECT l.name AS language, AVG(f.rental_rate) AS avg_rental_rate
FROM film f
JOIN language l ON f.language_id = l.language_id
GROUP BY l.name;

# Joins
# Questions 9: Display the title of the movie, customer s first name, and last name who rented it. Hint: Use JOIN between the film, inventory, rental, and customer tables.
select title, first_name, last_name 
from rental 
join inventory on rental.inventory_id = inventory.inventory_id
join film on inventory.film_id = film.film_id
join customer on rental.customer_id = customer.customer_id;

# Question 10: A Retrieve the names of all actors who have appeared in the film "Gone with the Wind." Hint: Use JOIN between the film actor, film, and actor tables.
 select first_name,last_name 
 from film 
 join film_actor on film.film_id =  film_actor.film_id
 join actor on film_actor.actor_id = actor.actor_id
 where title = 'Gone with The Wind';
 
# Question 11: Retrieve the customer names along with the total amount they've spent on rentals. Hint: JOIN customer, payment, and rental tables, then use SUM() and GROUP BY.
select first_name,last_name,sum(amount) as total_spent_on_rent
from customer 
join payment on customer.customer_id = payment.customer_id
group by first_name,last_name;

# Question 12: List the titles of movies rented by each customer in a particular city (e.g., London').Hint: JOIN customer, address, city, rental, inventory, and film tables, then use GROUP BY.
SELECT c.first_name, f.title
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE ci.city = 'London'
GROUP BY c.first_name, f.title;

# Advanced Joins and GROUP BY:
# Question 13: Display the top 5 rented movies along with the number of times they've been rented. Hint: JOIN film, inventory, and rental tables, then use COUNT () and GROUP BY, and limit the results.
select title, count(*) as time_rented
from film 
join inventory on film.film_id = inventory.film_id
join rental on inventory.inventory_id = rental.inventory_id
group by title 
ORDER BY time_rented DESC
limit 5;

# Question 14: Determine the customers who have rented movies from both stores (store ID 1 and store ID 2). Hint: Use JOINS with rental, inventory, and customer tables and consider COUNT() and GROUP BY.
SELECT customer_id
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
GROUP BY customer_id
HAVING COUNT(DISTINCT i.store_id) = 2;

# Windows Function:
# 1. Rank the customers based on the total amount they've spent on rentals.
SELECT customer_id, SUM(amount) AS total_spent,
       RANK() OVER (ORDER BY SUM(amount) DESC) AS spending_rank
FROM payment
GROUP BY customer_id;
 
# 2. Calculate the cumulative revenue generated by each film over time.
SELECT f.title, r.rental_date, SUM(p.amount) OVER (PARTITION BY f.title ORDER BY r.rental_date) AS cumulative_revenue
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id;

# 3. Determine the average rental duration for each film, considering films with similar lengths.
SELECT f.title, f.length,
       AVG(rental_duration) OVER (PARTITION BY f.length) AS avg_duration
FROM film f;

# 4. Identify the top 3 films in each category based on their rental counts.
WITH film_rents AS (
  SELECT f.film_id, f.title, c.name AS category,
         COUNT(*) AS rental_count,
         RANK() OVER (PARTITION BY c.name ORDER BY COUNT(*) DESC) AS rank_in_category
  FROM rental r
  JOIN inventory i ON r.inventory_id = i.inventory_id
  JOIN film f ON i.film_id = f.film_id
  JOIN film_category fc ON f.film_id = fc.film_id
  JOIN category c ON fc.category_id = c.category_id
  GROUP BY f.film_id, f.title, c.name
)
SELECT * FROM film_rents
WHERE rank_in_category <= 3;

# 5. Calculate the difference in rental counts between each customer's total rentals and the average rentals across all customers.
SELECT 
    customer_id,
    COUNT(rental_id) AS total_rentals,
    AVG(COUNT(rental_id)) OVER () AS avg_rentals,
    COUNT(rental_id) - AVG(COUNT(rental_id)) OVER () AS difference_from_avg
FROM rental
GROUP BY customer_id;

# 6. Find the monthly revenue trend for the entire rental store over time.
SELECT 
    DATE_FORMAT(payment_date, '%Y-%m') AS month,
    SUM(amount) AS monthly_revenue,
    SUM(SUM(amount)) OVER (ORDER BY DATE_FORMAT(payment_date, '%Y-%m')) AS cumulative_revenue
FROM payment
GROUP BY DATE_FORMAT(payment_date, '%Y-%m');

# 7. Identify the customers whose total spending on rentals falls within the top 20% of all customers.
WITH customer_spending AS (
    SELECT 
        customer_id,
        SUM(amount) AS total_spent,
        NTILE(5) OVER (ORDER BY SUM(amount) DESC) AS spending_percentile
    FROM payment
    GROUP BY customer_id
)
SELECT *
FROM customer_spending
WHERE spending_percentile = 1;

# 8. Calculate the running total of rentals per category, ordered by rental count.
WITH category_rentals AS (
    SELECT 
        c.name AS category,
        COUNT(r.rental_id) AS rental_count
    FROM rental r
    JOIN inventory i ON r.inventory_id = i.inventory_id
    JOIN film f ON i.film_id = f.film_id
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    GROUP BY c.name
)
SELECT 
    category,
    rental_count,
    SUM(rental_count) OVER (ORDER BY rental_count DESC) AS running_total
FROM category_rentals;

# 9. Find the films that have been rented less than the average rental count for their respective categories.
WITH film_rentals AS (
  SELECT f.film_id, f.title, c.name AS category, COUNT(r.rental_id) AS rentals
  FROM film f
  JOIN film_category fc ON f.film_id = fc.film_id
  JOIN category c ON fc.category_id = c.category_id
  LEFT JOIN inventory i ON f.film_id = i.film_id
  LEFT JOIN rental r ON i.inventory_id = r.inventory_id
  GROUP BY f.film_id, f.title, c.name
),
category_avg AS (
  SELECT category, AVG(rentals) AS avg_rentals
  FROM film_rentals
  GROUP BY category
)
SELECT fr.film_id, fr.title, fr.category, fr.rentals
FROM film_rentals fr
JOIN category_avg ca ON fr.category = ca.category
WHERE fr.rentals < ca.avg_rentals;

# 10. Identify the top 5 months with the highest revenue and display the revenue generated in each month.
SELECT 
  DATE_FORMAT(payment_date, '%Y-%m') AS month,
  SUM(amount) AS total_revenue
FROM payment
GROUP BY month
ORDER BY total_revenue DESC
LIMIT 5;

# Normalisation & CTE

# 1. First Normal Form (INF): 
# a. Identify a table in the Sakila database that violates 1NF. Explain how you would normalize it to achieve 1NF.
# Violation in Sakila:
# et’s assume there's a table like:
# let customer_orders
# ---------------
# customer_id | orders
# ------------|-----------------------------
# 1           | DVD, Blu-ray
# Here, orders contains multiple values — violates 1NF.
# To Normalize to 1NF: Break into atomic values:

# customer_id | order_type
# ------------|------------
# 1           | DVD
# 1           | Blu-ray

# 2. Second Normal Form (2NF):
# a. Choose a table in Sakila and describe how you would determine whether it is in 2NF. If it violates 2NF, explain the steps to normalize it.
# A table is in 2NF if:
# It's in 1NF
# No partial dependency on part of a composite key
# If a table like:
# rental_details (rental_id, film_id, film_name)
# Here, film_name depends only on film_id, not the whole key → violates 2NF
#  Fix: Split into two tables:
# rental_details(rental_id, film_id)
# films(film_id, film_name)

# 3. Third Normal Form (3NF):
# a. Identify a table in Sakila that violates 3NF. Describe the transitive dependencies present and outline the steps to normalize the table to 3NF.
#  A table is in 3NF if:
# It’s in 2NF
# No transitive dependency (non-key column depends on another non-key)
# Example Violation:
# customer(customer_id, name, address, city, postal_code)
# postal_code depends on city → transitive dependency.
# Fix: Create a separate city table:
# customer(customer_id, name, address, city_id)
# city(city_id, city_name, postal_code)

# 4. Normalization Process:
# a. Take a specific table in Sakila and guide through the process of normalizing it from the initial unnormalized form up to at least 2NF.
# Let’s say we have:
# orders(order_id, customer_name, product_1, product_2)
# UNF → 1NF: Split multiple products into rows
# 1NF → 2NF: Move customer info to a customers table
# 2NF → 3NF: Remove any city → postal code type dependencies

# 5. CTE Basics:
# a. Write a query using a CTE to retrieve the distinct list of actor names and the number of films they have acted in from the actor and film actor tables.
WITH actor_film_count AS (
    SELECT a.actor_id, CONCAT(a.first_name, ' ', a.last_name) AS actor_name, COUNT(fa.film_id) AS film_count
    FROM actor a
    JOIN film_actor fa ON a.actor_id = fa.actor_id
    GROUP BY a.actor_id
)
SELECT * FROM actor_film_count;

# 6. CTE with Joins:
# a. Create a CTE that combines information from the film and language tables to display the film title, language name, and rental rate.
WITH film_info AS (
    SELECT f.title, l.name AS language, f.rental_rate
    FROM film f
    JOIN language l ON f.language_id = l.language_id
)
SELECT * FROM film_info;

# 7. CTE for Aggregation:
# a. Write a query using a CTE to find the total revenue generated by each customer (sum of payments) from the customer and payment tables. I
WITH customer_revenue AS (
    SELECT customer_id, SUM(amount) AS total_spent
    FROM payment
    GROUP BY customer_id
)
SELECT * FROM customer_revenue;

# 8. CTE with Window Functions:
# a. Utilize a CTE with a window function to rank films based on their rental duration from the film table.
WITH ranked_films AS (
    SELECT title, rental_duration,
           RANK() OVER (ORDER BY rental_duration DESC) AS duration_rank
    FROM film
)
SELECT * FROM ranked_films;

# 9. CTE and Filtering:
# a. Create a CTE to list customers who have made more than two rentals, and then join this CTE with the customer table to retrieve additional customer details.
WITH frequent_customers AS (
    SELECT customer_id, COUNT(*) AS rental_count
    FROM rental
    GROUP BY customer_id
    HAVING COUNT(*) > 2
)
SELECT fc.*, c.first_name, c.last_name
FROM frequent_customers fc
JOIN customer c ON fc.customer_id = c.customer_id;

# 10. CTE for Date Calculations:
# a. Write a query using a CTE to find the total number of rentals made each month, considering the rental date from the rental table.
WITH monthly_rentals AS (
    SELECT MONTH(rental_date) AS rental_month, COUNT(*) AS total_rentals
    FROM rental
    GROUP BY MONTH(rental_date)
)
SELECT * FROM monthly_rentals;

# 11. CTE and Self-Join:
# a. Create a CTE to generate a report showing pairs of actors who have appeared in the same film together, using the film_actor table.
WITH actor_pairs AS (
    SELECT fa1.film_id, fa1.actor_id AS actor1, fa2.actor_id AS actor2
    FROM film_actor fa1
    JOIN film_actor fa2 ON fa1.film_id = fa2.film_id
    WHERE fa1.actor_id < fa2.actor_id
)
SELECT * FROM actor_pairs;

# 12. CTE for Recursive Search:
# a. Implement a recursive CTE to find all employees in the staff table who report to a specific manager, considering the reports_to column
WITH RECURSIVE subordinates AS (
    SELECT staff_id, first_name, last_name, reports_to
    FROM staff
    WHERE reports_to = 1  -- starting manager

    UNION ALL

    SELECT s.staff_id, s.first_name, s.last_name, s.reports_to
    FROM staff s
    INNER JOIN subordinates sub ON s.reports_to = sub.staff_id
)
SELECT * FROM subordinates;
