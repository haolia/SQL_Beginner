SELECT nama, email, telepon, pengguna_aktif, penipu
FROM rakamin_customer
WHERE pengguna_aktif <>1 AND konfirmasi_telepon =1;

SELECT nama, email, telepon, bulan_lahir, pengguna_aktif
FROM rakamin_customer
WHERE bulan_lahir = 'Juni' or bulan_lahir = 'Juli';

SELECT nama, email, telepon, bulan_lahir, pengguna_aktif
FROM rakamin_customer
WHERE bulan_lahir in ('Juni','Juli','Agustus');

SELECT nama, email, telepon, pengguna_aktif 
FROM rakamin_customer
WHERE telepon LIKE '%62852%' OR telepon LIKE '%62896%'
ORDER BY RANDOM ()
LIMIT 5; 

SELECT nama, email, telepon, umur, 
	CASE WHEN umur BETWEEN 1 AND 20 THEN 'Anak'
		WHEN umur BETWEEN 21 AND 70 THEN 'Dewasa'
		ELSE 'lansia' 
	END AS kelompok_umur
FROM rakamin_customer
WHERE telepon LIKE '%62852%';

select count (*) from rakamin_customer ;

SELECT bulan_lahir, 
	COUNT(1) AS total_customer
FROM rakamin_customer 
WHERE bulan_lahir = 'Juli'
GROUP BY 1;

SELECT bulan_lahir, 
	COUNT(1) AS total_customer
FROM rakamin_customer 
GROUP BY 1;

SELECT pengguna_aktif, 
	COUNT (1) AS total_customer
FROM rakamin_customer 
GROUP BY pengguna_aktif;

	
	











