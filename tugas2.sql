--1. (output hanya 9)
SELECT COUNT (ro.kuantitas) AS jumlah_order, rca.alamat, rca.kota 
FROM rakamin_order AS ro 
	JOIN rakamin_customer_address AS rca
		ON ro.id_pelanggan = rca.id_pelanggan
WHERE rca.kota != 'Depok' AND ro.id_merchant = 5
GROUP BY 3,2
ORDER BY 1 DESC;

-- 2 (1) 
SELECT 	ro.id_pelanggan,
		rc.nama,
		rc.telepon,
		rc.email,
		SUM(ro.kuantitas * ro.harga) AS Total_Payment_Value
	FROM rakamin_customer AS rc 
		 JOIN rakamin_order AS ro 
			ON rc.id_pelanggan = ro.id_pelanggan
		WHERE  rc.email LIKE '%@yahoo.com%' 
			AND rc.penipu = 0
GROUP BY 1,2,3,4
ORDER BY 5 DESC

-- 2 (2) 
WITH customers AS(
	SELECT 	rc.id_pelanggan,
			rc.nama,
			rc.telepon,
			rc.email
	FROM rakamin_customer AS rc 
	JOIN rakamin_customer_address AS rca ON rc.id_pelanggan = rca.id_alamat
	WHERE email LIKE '%yahoo%'
		AND penipu = 0
), 
orders AS (
	SELECT ro.id_pelanggan, SUM(kuantitas*harga) AS Total_Payment_Value
	FROM rakamin_order AS ro
	GROUP BY 1
)
SELECT *
FROM customers AS cs 
JOIN orders AS o ON cs.id_pelanggan = o.id_pelanggan
ORDER BY 1 ASC;

-- 3 (1) 
SELECT 
	rc.nama, 
	rc.email, 
	rc.telepon, 
	rca.alamat,
	ro.metode_bayar,
	SUM (ro.kuantitas) AS jumlah_order 
FROM rakamin_customer AS rc
	JOIN rakamin_customer_address AS rca 
		ON rc.id_pelanggan = rca.id_pelanggan
	JOIN rakamin_order AS ro 
		ON rca.id_pelanggan = ro.id_pelanggan
WHERE 
	rc.konfirmasi_telepon = 1 AND 
	rc.penipu = 0  AND 
	rc.pengguna_aktif = 1 AND 
	ro.metode_bayar = 'cash'
	
GROUP BY 1,2,3,4,5
ORDER BY jumlah_order DESC; 
 
			
-- 3 (2)
WITH customers AS(
	SELECT  rc.id_pelanggan, 
			rc.nama, 
			rc.telepon, 
			rc.email, 
			rca.alamat
	FROM rakamin_customer AS rc 
	JOIN rakamin_customer_address AS rca 
		ON rc.id_pelanggan = rca.id_alamat
	WHERE konfirmasi_telepon = 1
			AND pengguna_aktif = 1
			AND penipu = 0
),
orders AS (
	SELECT 	ro.id_pelanggan, 
			ro.metode_bayar, 
			SUM(id_order) AS jumlah_order
	FROM rakamin_order AS ro
	WHERE metode_bayar = 'cash'
	GROUP BY 1,2 
)
SELECT nama, email, telepon, alamat, metode_bayar, jumlah_order
FROM customers AS cs 
JOIN orders AS o ON cs.id_pelanggan = o.id_pelanggan 
ORDER BY jumlah_order DESc; 
	
-- 4 (hasil masih 79 row) mungkin bisa di analisis lagii 
WITH orders AS( 
	SELECT ro.id_pelanggan, 
		SUM (kuantitas) AS jumlah_order, 
		SUM (kuantitas * harga) AS jumlah_harga, 
	CASE WHEN metode_bayar = 'cash' THEN 'cash'
		ELSE 'digital'
	END AS platform_bayar
	FROM rakamin_order AS ro
	JOIN rakamin_customer_address AS rca ON ro.id_pelanggan = rca.id_pelanggan
	GROUP BY 1,4
)
SELECT 	nama, 
		email, 
		telepon, 
		platform_bayar, 
		jumlah_harga, 
		jumlah_harga
	FROM rakamin_customer AS rc
	JOIN orders AS o ON rc.id_pelanggan = o.id_pelanggan
	ORDER BY jumlah_harga DESC;

-- 5 
WITH orders AS (
	SELECT  ro.id_pelanggan, 
			ro. metode_bayar,
			SUM(ro.kuantitas *ro.harga) AS total_belanja 
		FROM rakamin_order AS ro 
		GROUP BY 1,2
)
SELECT kota,
	CASE WHEN (o.total_belanja/1000) < 10 THEN 'non_member'
		 WHEN (o.total_belanja/1000) BETWEEN 10 AND 100 THEN 'bronze_member'
		 WHEN (o.total_belanja/1000) BETWEEN 100 AND 300 THEN 'silver_member'
		 WHEN (o.total_belanja/1000) > 300 THEN 'gold_member'
	END AS customer_loyalty
	FROM orders as o 
	JOIN rakamin_customer_address AS rca ON o.id_pelanggan = rca.id_pelanggan
	WHERE NOT metode_bayar = 'cash'
	GROUP BY 1,2
	HAVING SUM(total_belanja)>= 1000
	ORDER BY kota ASC;