# SQL_Beginner
* Business Task
* Analyse dvdrental data.
### Tools :
- [x] PostgreSQL

### Dataset :
- [x] dvdrental data from https://www.postgresqltutorial.com/, cek for more tutorial ! 
<kbd><img width="980" alt="image" src="https://user-images.githubusercontent.com/36781269/156906380-00966454-aefa-442e-94eb-1900dba58a43.png"></kbd>


# Challenge 
**Challenge Structures**
 - Business Situation
 - Challenge Question
 - Solution

## SQL Statement Fundamentals
1. SELECT 
* Situation
  - **We want to send out a promotional email to our existing customers!**
* Challenge
  - **Use a SELECT statement to grab the first and last names of every customer and their email address.**
* Solution

```sql
SELECT first_name, last_name, email FROM customer;
```

2. SELECT DISTINCT
* Situation
  - **An Australian visitor isn’t familiar with MPAA movie ratings (e.g. PG , PG-13, R, etc…) **
  - **We want to know the types of ratings we have in our database.**
  - **What ratings do we have available?**
* Challenge
  - **Use what you’ve learned about SELECT DISTINCT to retrieve the distinct rating types our films could have in our database.**
* Solution

```sql
SELECT DISTINCT rating FROM film;
```

3. SELECT WHERE
* Situation
  - **A customer forgot their wallet at our store! We need to track down their email to inform them.**
* Challenge
   - **What is the email for the customer with the name Nancy Thomas?**
* Solution

```sql
SELECT email 
FROM customer
WHERE first_name = 'Nancy'
AND last_name = 'Thomas';
```

4. SELECT WHERE
* Situation
  - **A customer wants to know what the movie “Outlaw Hanky” is about.**
* Challenge
   - **Could you give them the description for the movie “Outlaw Hanky”?**
* Solution

```sql
SELECT description 
FROM film
WHERE title = 'Outlaw Hanky'
```

5. SELECT WHERE
* Situation
  - **A customer is late on their movie return, and we’ve mailed them a letter to their address at ‘259 Ipoh Drive’. We should also call them on the phone to let them know.**
* Challenge
   - **Can you get the phone number for the customer who lives at ‘259 Ipoh Drive’?**
* Solution

```sql
SELECT phone FROM address
WHERE address = '259 Ipoh Drive'
```

6. ORDER BY and LIMIT
* Situation
  - **We want to reward our first 10 paying customers.**
* Challenge
   - **What are the customer ids of the first 10 customers who created a payment?**
* Solution

```sql
SELECT customer_id 
FROM payment
ORDER BY payment_date ASC
LIMIT 10
```

7. ORDER BY and LIMIT
* Situation
  - **A customer wants to quickly rent a video to watch over their short lunch break.**
* Challenge
   - **What are the titles of the 5 shortest (in length of runtime) movies?**
* Solution

```sql
SELECT title,length 
FROM film
ORDER BY length ASC
LIMIT 5
```

8. SELECT COUNT
* Situation
  - **If the previous customer can watch any movie that is 50 minutes or less in run time, how many options does she have?**
* Challenge
   - **Use a SELECT COUNT(title) to grab all the title of the movie that is 50 minutes or less in run time.**
* Solution

```sql
SELECT COUNT(title) 
FROM film
WHERE length <= 50
```

9. HAVING
* Challenge
   - **Return the customer IDs of customers who have spent at least $110 with the staff member who has an ID of 2.**
* Solution

```sql
SELECT customer_id, SUM (amount) 
FROM payment 
WHERE staff_id = 2 
GROUP BY customer_id 
HAVING SUM(amount) >110;
```

10. LIKE and ILIKE
* Challenge
   - **How many films begin with the letter J?**
* Solution

```sql
SELECT COUNT(title) 
FROM film 
WHERE title  LIKE'J%';
```

11. LIKE and ILIKE
* Challenge
   - **What customer has the highest customer ID number whose name starts with an 'E' and has an address ID lower than 500?**
* Solution

```sql
SELECT first_name,last_name 
FROM customer 
WHERE first_name LIKE 'E%'AND address_id <500
ORDER BY customer_id DESC 
LIMIT 1;
```

12. INNER JOIN
* Situation
  - **California sales tax laws have changed and we need to alert our customers to this through email.**
* Challenge
   - **What are the emails of the customers who live in California?**
* Solution

```sql
SELECT district, email 
FROM address 
  INNER JOIN customer ON address.address_id = customer.address_id
WHERE district = 'California';
```

13.  2 JOINs
* Situation
  - **A customer walks in and is a huge fan of the actor “Nick Wahlberg” and wants to know which movies he is in.**
* Challenge
   - **Get a list of all the movies “Nick Wahlberg” has been in**
* Solution

```sql
SELECT title, first_name,last_name
FROM film_actor 
	INNER JOIN actor ON film_actor.actor_id = actor.actor_id 
	INNER JOIN film ON film_actor.film_id = film.film_id
WHERE first_name ='Nick' AND last_name = 'Wahlberg';
```


## Advanced SQL Commands


