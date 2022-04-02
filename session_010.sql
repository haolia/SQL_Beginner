--- Alias
SELECT 
	CASE WHEN umur BETWEEN 0 AND 12 THEN 'Anak- anak'
		 WHEN umur BETWEEN 13 AND 18 THEN 'Remaja'
		 WHEN umur BETWEEN 19 AND 50 THEN 'Dewasa'
		 ELSE 'Lansia'
	END AS Grup_umur, 
	SUM (CASE WHEN pengguna_aktif = 0 THEN 1 ELSE 0 END) AS total_pengguna_nonaktif,
	SUM (CASE WHEN pengguna_aktif = 1 THEN 1 ELSE 0 END) AS total_pengguna_aktif
FROM rakamin_customer AS rc
GROUP BY 1; 
	

---Sub query (setiap subquery harus memiliki alias)
-- Sub Query 1 Tabel Virtual
SELECT nama, email 
FROM 
	(SELECT nama, email, telepon, umur 
	 FROM rakamin_customer 
	 WHERE pengguna_aktif =1) 
AS tmp 
LIMIT 10; 


-- Sub Query 2 Tabel Virtual
SELECT * 
	FROM 
		(SELECT 
			CASE WHEN telepon LIKE '62852%' THEN 'Telkomsel'
		 	 	 WHEN telepon LIKE '62878%' THEN 'XL'
		 	 	 WHEN telepon LIKE '62896%' THEN '3'
		 	 	 ELSE 'Lainnya'
			END AS Provider,
			COUNT(nama) AS Total_pelanggan 
		FROM rakamin_customer
	GROUP BY 1)
	AS rc 
WHERE rc.total_pelanggan >=20;


-- Sub Query 3 Filtering -- (Hasil dari subquery digunakan sebagai filter query utama.)
SELECT nama, email, telepon 
FROM rakamin_customer AS rc WHERE rc.id_pelanggan 
	IN
		(SELECT DISTINCT id_pelanggan 
		FROM rakamin_order AS ro 
		WHERE ro.id_merchant = 5)
LIMIT 5;	


---Join (Menggunakankolom dengan nilai baris yang sama antara 2 tabel)
-- Join (Inner Join/Join)
SELECT 
	rc.nama, rc.telepon, rca.alamat
FROM rakamin_customer AS rc 
JOIN rakamin_customer_address AS rca ON rc.id_pelanggan =rca.id_pelanggan
WHERE rc.telepon LIKE '62852%'
LIMIT 5;

-- Join (Left Join)
SELECT 
	rc.nama, rc.telepon, rca.alamat
FROM rakamin_customer AS rc 
JOIN rakamin_customer_address AS rca ON rc.id_pelanggan =rca.id_pelanggan
LEFT JOIN rakamin_order AS ro ON ro.id_pelanggan = rc.id_pelanggan 
WHERE rc.telepon LIKE '62852%'
LIMIT 5;

--Subquery pada Join 
SELECT *
	FROM (
	(SELECT id_pelanggan SUM (harga) AS total_harga 
		FROM rakamin_order
		GROUP BY 1 
		HAVING SUM (harga)>5000) AS ro 
	LEFT JOIN rakaamin_customer ASrc ON ro.id_pelanggan = rc.id_pelanggan 
);







