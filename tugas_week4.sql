SELECT DISTINCT kota FROM rakamin_customer_address; 

SELECT * FROM rakamin_order
ORDER BY tanggal_pembelian
LIMIT 10 ;

SELECT COUNT (*) FROM rakamin_customer
WHERE penipu=1;

SELECT 
	email, 
	nama, 
	umur,
	tanggal_registrasi,
	CASE WHEN email LIKE '%@gmail%' THEN 'Google'
		 WHEN email LIKE '%@yahoo%' THEN 'Yahoo'
		 WHEN email LIKE '%@outlook%' THEN 'Outlook'
		 ELSE 'Others'
	END AS email_pltform 
FROM rakamin_customer
WHERE 
	umur > 17 
HAVING tanggal_registrasi IN 2013-01-01 AND 2013-06-31
ORDER BY tanggal_registrasi;



