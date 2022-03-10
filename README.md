#  <p align="center"> 😸😸 SQL_Beginner 😸😸
## 📔 SQL Summary
### SQL Facts
- SQL stands for Structured Query Language 
- SQL is pronounced “sequel” (SQL is declarative language)
- SQL is used to access & manipulate data in databases 
- Top SQL DBs are MS SQL Server, Oracle, MySQL, PostgreSQL

### Database Definitions
- **RDBMS** (Relational Database Management System), Software that stores and manipulates data arranged in relational database tables. 
- **Table** A set of data arranged in columns and rows. The columns represent characteristics of stored data and the rows represent actual data entries.

### SQL Commands Categories
- Data Query Language (DQL) 
	* **SELECT** - Retrieve data from table(s) 
- Data Manipulation Language (DML)  
	* **INSERT** - Insert data into db table 
	* **UPDATE** - Update data in db table 
	* **DELETE** - Delete data from table Data 
- Definition Language (DDL) 
	* **CREATE** - Create db object (table, view, etc.) 
	* **ALTER** - Modify db object (table, view, etc.)  
	* **DROP** - Delete db object (table, view, etc.) 
- Data Control Language (DCL) 
	* **GRANT** - Assign privilege  
	* **REVOKE** - remove privilege

### SQL Data Types
- SQL have more than 40 different data types. But these seven are the most important ones:
	* **Integer** A whole number without a fractional part. Example: 1, 156, 2012412
	* **Decimal** A number with a fractional part. Example:. 3.14, 3.141592654, 961.1241250
	* **Boolean** A binary value. It can be either TRUE or FALSE.
	* **Date**  Example: 2017-12-31
	* **Time** Example: 23:59:59
	* **Timestamp** The date and the time together. Example: 2017-12-31 23:59:59
	* **Text** This is the most general data type. But it can be alphabetical letters only, or a mix of letters and numbers and any other characters. Example: hello, R2D2, Haolia23, 124.765.128.412

### How to select data from a table
```sql
SELECT [Column List]
FROM [Table Name]
WHERE [Search Condition] 
```
Example:
```sql
SELECT FirstName, LastName, OrderDate 
FROM Orders 
WHERE OrderDate > '10/10/2010'
```

### How to insert data in a table
```sql
INSERT INTO [Table Name] ([Column List]) VALUES ([Values]) 
```
Example:
```sql
INSERT INTO Orders (FirstName, LastName, OrderDate) VALUES ('John', 'Smith', '10/10/2010')
```

### How to update data in a table
```sql
UPDATE [Table Name] SET [Column1] = [Value1], [Column2] = [Value2], … 
WHERE [Search Condition]
```
Example:
```sql
UPDATE Orders SET FirstName = 'John', LastName = 'Who' 
WHERE LastName='Wo'
```

### How to delete data from a table
```sql
DELETE FROM [Table Name]
WHERE [Search Condition] 
```
Example: 
```sql
DELETE FROM Orders 
WHERE OrderDate '10/10/2010'
```

### How to group data and use aggregates
```sql
SELECT [Column List], [Aggregate Function]([Column Name]) 
FROM [Table Name] 
WHERE [Search Condition] 
GROUP BY [Column List]
```
Example: 
```sql
SELECT LastName, SUM(OrderValue) 
FROM Orders 
WHERE OrderDate > '10/10/2010' 
GROUP BY LastName
```

### How to order data
```sql
SELECT [Column List] 
FROM [Table Name]
WHERE [Search Condition] 
ORDER BY [Column List] 
```
Example: 
```sql
SELECT FirstName, LastName, OrderDate 
FROM Orders 
WHERE OrderDate > '10/10/2010' 
ORDER BY OrderDate
```

### How to select data from more than one table
```sql
SELECT [Column List]
FROM [Table1] 
JOIN [Table2] ON [Table1].[Column1] = [Table2].[Column1] 
```
Example: 
```sql
SELECT Orders.LastName, Countries.CountryName 
FROM Orders 
JOIN Countries ON Orders.CountryID = Countries.ID
```

### Using UNION
```sql
SELECT [Column List] 
FROM [Table1]
UNION 
SELECT [Column List] 
FROM [Table2] 
```
Example: 
```sql
SELECT FirstName, LastName 
FROM Orders2010 
UNION 
SELECT FirstName, LastName 
FROM Orders2011
```

### Create Table
```sql
CREATE TABLE [Table Name] ( Column1 DataType, Column2 DataType, Column3 DataType, …. )
```
Example:
```sql
CREATE TABLE Orders ( FirstName CHAR(100), LastName CHAR(100), OrderDate DATE, OrderValue Currency )
```

## 📔 Challenge 
**Challenge Structures**
 - Business Situation
 - Challenge Question
 - Solution

### Tools :
- [x] PostgreSQL
* Business Task
* Analyse dvdrental data.

### Dataset :
- [x] dvdrental [dvdrental.zip](https://github.com/haolia/SQL_Beginner/files/8202252/dvdrental.zip)
- Before diving straight into solution mode for the business requirements, I need to take a look at the data with EDR (Entity-Relationship Diagrams) to identify different data relationships between tables. The EDR of these datasets can be viewed as below:
<kbd><img width="980" alt="image" src="https://user-images.githubusercontent.com/36781269/156906380-00966454-aefa-442e-94eb-1900dba58a43.png"></kbd>

#### 1. SELECT 
* Situation
  - **We want to send out a promotional email to our existing customers!**
* Challenge
  - **Use a SELECT statement to grab the first and last names of every customer and their email address.**
* Solution

```sql
SELECT first_name, last_name, email FROM customer;
```

#### 2. SELECT DISTINCT
* Situation
  - **An Australian visitor isn’t familiar with MPAA movie ratings (e.g. PG , PG-13, R, etc…)**
  - **We want to know the types of ratings we have in our database.**
  - **What ratings do we have available?**
* Challenge
  - **Use what you’ve learned about SELECT DISTINCT to retrieve the distinct rating types our films could have in our database.**
* Solution

```sql
SELECT DISTINCT rating FROM film;
```

#### 3. SELECT WHERE
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

#### 4. SELECT WHERE
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

#### 5. SELECT WHERE
* Situation
  - **A customer is late on their movie return, and we’ve mailed them a letter to their address at ‘259 Ipoh Drive’. We should also call them on the phone to let them know.**
* Challenge
   - **Can you get the phone number for the customer who lives at ‘259 Ipoh Drive’?**
* Solution

```sql
SELECT phone FROM address
WHERE address = '259 Ipoh Drive'
```

#### 6. ORDER BY and LIMIT
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

#### 7. ORDER BY and LIMIT
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

#### 8. SELECT COUNT
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

#### 9. HAVING
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

#### 10. LIKE and ILIKE
* Challenge
   - **How many films begin with the letter J?**
* Solution

```sql
SELECT COUNT(title) 
FROM film 
WHERE title  LIKE'J%';
```

#### 11. LIKE and ILIKE
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

#### 12. INNER JOIN
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

#### 13.  2 JOINs
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

#### 14. Timestamps and Extract 
* Situation
  - **During which months did payments occur?**
* Challenge
  - **Format your answer to return back the full month name.**
* Solution

```sql
SELECT 
	DISTINCT (TO_CHAR (payment_date, 'MONTH')) 
FROM payment;
```

#### 15. Timestamps and Extract 
* Situation
  - **How many payments occurred on a Monday?**
* Informaation 
  - **PostgreSQL considers Sunday the start of a week (indexed at 0).**
* Solution
Review the [dow keyword](https://help.highbond.com/helpdocs/analytics/151/en-us/Content/analytics/scripting/functions/r_dow.htm#:~:text=YEAR(%C2%A0)-,DOW(%C2%A0)%20function,-Returns%20a%20numeric). 
 
```sql
SELECT COUNT(*)
FROM payment
	WHERE EXTRACT(dow FROM payment_date) = 1
```


