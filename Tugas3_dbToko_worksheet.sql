-- -- -- --
-- SOAL 3.1 
-- -- -- --

-- 1. Tampilkan data produk yang asset nya diatas 20jt
SELECT * FROM produk WHERE harga_beli * stok > 20000000;

-- 2. Tampilkan data produk beserta selisih stok dengan minimal stok
SELECT SUM(stok - min_stok) AS selisih FROM produk;

-- 3. Tampilkan total asset produk secara keseluruhan
SELECT SUM(stok) AS total_asset FROM produk;

-- 4. Tampilkan data pelanggan yang lahirnya antara tahun 1999 sampai 2004
SELECT * FROM pelanggan WHERE YEAR(tgl_lahir) BETWEEN 1999 AND 2004;

-- 5. Tampilkan data pelanggan yang lahirnya tahun 1998
SELECT * FROM pelanggan WHERE YEAR(tgl_lahir)=1998;

-- 6. Tampilkan data pelanggan yang berulang tahun bulan agustus
SELECT * FROM pelanggan WHERE MONTH(tgl_lahir)=08;

-- 7. Tampilkan data pelanggan : nama, tmp_lahir, tgl_lahir dan umur (selisih tahun sekarang dikurang tahun kelahiran)
SELECT nama, tmp_lahir, tgl_lahir, (YEAR(NOW())-YEAR(tgl_lahir)) AS umur FROM pelanggan;


-- -- -- --
-- SOAL 3.2 
-- -- -- --

-- 1. Berapa jumlah pelanggan yang tahun lahirnya 1998
SELECT COUNT (*) AS Jml_palanggan FROM pelanggan WHERE YEAR(tgl_lahir) = 1998;

-- 2. Berapa jumlah pelanggan perempuan yang tempat lahirnya di Jakarta
SELECT COUNT (*) AS Jml_palanggan FROM pelanggan WHERE tmp_lahir = "jakarta";

-- 3. Berapa jumlah total stok semua produk yang harga jualnya dibawah 10rb
SELECT SUM(stok) AS total_stok FROM produk WHERE harga_jual < 10000;

-- 4. Ada berapa produk yang mempunyai kode awal K
SELECT COUNT(*) AS jumlah_produk FROM produk WHERE kode LIKE 'K%';

-- 5. Berapa harga jual rata-rata produk yang diatas 1jt
SELECT AVG(harga_jual) AS rata_rata_harga_jual FROM produk WHERE harga_jual > 1000000;

-- 6. Tampilkan jumlah stok yang paling besar
SELECT MAX(stok) AS jumalah_stok FROM produk;

-- 7. Ada beberapa produk yang stoknya kurang dari minimal stok
SELECT COUNT(*) AS jumalah_produk FROM produk WHERE stok < min_stok;

-- 8. Berapa total asset dari keseluruhan produk
SELECT SUM (harga_beli * stok) AS total_asset FROM produk;


-- -- -- --
-- SOAL 3.3 
-- -- -- --

-- 1. Tampilkan data produk : id, nama, stok dan informasi jika stok telah sampai batas minimal atau kurang dari minimum stok dengan informasi ‘segera belanja’ jika tidak ‘stok aman’.
SELECT id, nama, stok,
CASE
  WHEN stok <= min_stok THEN 'segera belanja'
  ELSE 'stok aman'
END AS info_stok
FROM produk;

-- 2. Tampilkan data pelanggan: id, nama, umur dan kategori umur : jika umur < 17 → ‘muda’ , 17-55 → ‘Dewasa’, selainnya ‘Tua’
SELECT id, nama_pelanggan, tgl_lahir,
CASE
   WHEN tgl_lahir = DATE(2004) THEN 'muda'
   WHEN tgl_lahir > DATE(2000) OR tgl_lahir < DATE(2003) THEN 'Dewasa'
   ELSE 'Tua'
END AS kategori_umur
FROM pelanggan;

-- 3. Tampilkan data produk: id, kode, nama, dan bonus untuk kode ‘TV01’ →’DVD Player’ , ‘K001’ → ‘Rice Cooker’ selain dari diatas ‘Tidak Ada’
SELECT id, kode, nama,
CASE
   WHEN kode = 'TV01' THEN 'DVD Player'
   WHEN kode = 'K001' THEN 'Rice Cooker'
   ELSE 'Tidak Ada'
END AS bonus
FROM produk;

-- -- -- --
-- SOAL 3.4
-- -- -- --

-- 1. Tampilkan data statistik jumlah tempat lahir pelanggan
SELECT tmp_lahir, COUNT(*) AS jumlah_pelanggan FROM pelanggan GROUP BY tmp_lahir;

-- 2. Tampilkan jumlah statistik produk berdasarkan jenis produk
SELECT jenis_produk_id, COUNT(*) AS jumlah_produk FROM produk GROUP BY jenis_produk_id;

-- 3. Tampilkan data pelanggan yang usianya dibawah rata usia pelanggan
SELECT id, nama_pelanggan, tgl_lahir FROM pelanggan WHERE tgl_lahir < (SELECT AVG(DATE(tgl_lahir)) FROM pelanggan);

-- 4. Tampilkan data produk yang harganya diatas rata-rata harga produk
SELECT id, kode, nama, harga_beli FROM produk WHERE harga_beli > (SELECT AVG(harga_beli) FROM produk);

-- 5. Tampikan data pelanggan yang memiliki kartu dimana iuran tahunan kartu diatas 90rb
SELECT kartu AS iuran_tahunan FROM pelanggan WHERE kartu > 90000 ;

-- 6. Tampilkan statistik data produk dimana harga produknya dibawah rata-rata harga produk secara keseluruhan
SELECT COUNT(*) AS total_produk, MIN(harga_beli) AS harga_minimal, MAX(harga_beli) AS harga_maksimal, AVG(harga_beli) AS harga_rata_rata 
FROM produk 
WHERE harga_beli < (SELECT AVG(harga_beli) FROM produk);

-- 7. Tampilkan data pelanggan yang memiliki kartu dimana diskon kartu yang diberikan diatas 3%
SELECT * FROM pelanggan WHERE kartu > 3;