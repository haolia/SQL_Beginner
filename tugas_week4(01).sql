						---Haolia--Group 6--DS20---
-- 1
SELECT DISTINCT kota FROM rakamin_customer_address; 

--2
SELECT * FROM rakamin_order
ORDER BY tanggal_pembelian DESC
LIMIT 10 ;

-- 3
SELECT COUNT (penipu) AS Total_penipu
FROM rakamin_customer 
WHERE penipu=1 ;

--4
SELECT 
	CASE WHEN email LIKE '%@gmail%' THEN 'Google'
		 WHEN email LIKE '%@yahoo%' THEN 'Yahoo'
		 WHEN email LIKE '%@outlook%' THEN 'Outlook'
		 ELSE 'Others'
	END AS email_platform, email, umur, tanggal_registrasi
FROM rakamin_customer
WHERE 
	umur >= 17
	AND tanggal_registrasi BETWEEN '2013-01-01' AND '2013-06-30'
ORDER BY email_platform;

--5
SELECT metode_bayar, COUNT (*) AS jumlah_transaksi,
	MAX (harga) AS Spending_tertinggi, 
	MIN (harga) AS Spending_terendah, 
	AVG (harga) AS Ratarata_spending, 
	SUM (harga) AS Total_harga_spending 
FROM rakamin_order
WHERE 
	id_merchant IN (3,5,6) AND
	metode_bayar IN ('ovo','gopay')
GROUP BY metode_bayar;

--6
SELECT metode_bayar, 
	CASE WHEN ((harga* 0.1)+harga) < 30000 THEN 'low spending'
		 WHEN ((harga* 0.1)+harga) BETWEEN 30000 AND 50000 THEN 'medium spending'
		 WHEN ((harga* 0.1)+harga) > 50000 THEN 'high spending'
	END AS spending_group, COUNT (DISTINCT id_pelanggan) AS jumlah_customer_unik
FROM rakamin_order
WHERE NOT metode_bayar = 'cash'
GROUP BY spending_group, metode_bayar
ORDER BY metode_bayar ASC;

	


