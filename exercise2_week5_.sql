-- Nomor 1 
--a
SELECT * 
FROM rakamin_customer
JOIN LEFT rakamin_order 
ON rakamin_order.id_pelanggan=rakamin_customer.id_pelanggan;

--b
SELECT * 
FROM rakamin_order
WHERE id_pelanggan = (SELECT id_pelanggan FROM rakamin_customer WHERE penipu = 0);

--c
SELECT * 
FROM rakamin_customer
RIGHT JOIN rakamin_order
ON rakamin_order.id_pelanggan=rakamin_customer.id_pelanggan;

--d
SELECT id_order, kuantitas, harga 
FROM rakamin_order WHERE tanggal_pembelian=2021-11-25;

-- nomor 6 
SELECT 
	nama_merchant, 
	COUNT(DISTINCT id_order) AS total_order 
FROM rakamin_order AS ro 
LEFT JOIN rakamin_merchant AS rm
ON rm.id_merchant = ro.id_merchant 
WHERE 
	bayar_cash = 0 
	AND 
	total_order > 1 -- error karena dibuaut >1 lalu di group by 1 wkwk 
	GROUP BY 1 
	ORDER BY 2 DESC; 
	
-- nomor 7 
SELECT alamat, 
	COUNT(DISTINCT ro.id_order) AS total_order, 
	COUNT(DISTINCT ro.id_pelanggan) AS total_pelanggan
FROM 
rakamin_order ro -- karena ngasih nama aja masih salah gak dikasi sintax as 
-- nomor 8 
CREATE TABLE IF EXISTS rakamin_merchant_inactive AS (
	SELECT * FROM rakamin_merchant WHERE active =0
);