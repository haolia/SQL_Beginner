-- Case 1 


-- Case 2 
SELECT first_name, last_name, email, address_id, 
		cutomer_id 
FROM customer 

-- Case 3 
SELECT COUNT 
	(a.customer_id),
	c.City,
	d.Country
FROM
	customer a
		LEFT JOIN address b ON a.address_id=b.address_id
		LEFT JOIN city c ON b.city_id=c.city_id
		LEFT JOIN country d ON c.country_id=d.country_id
GROUP BY 2,3
