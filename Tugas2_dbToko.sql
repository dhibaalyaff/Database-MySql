--
-- Soal 2.1
--

-- Menampilkan seluruh data produk diurutkan berdasarkan harga_jual mulai dari yang termahal
SELECT * FROM produk ORDER BY harga_jual DESC;

-- Menampilkan data kode, nama, tmp_lahir, tgl_lahir dari table pelanggan
SELECT kode, nama, tmp_lahir, tgl_lahir FROM pelanggan;

-- Menampilkan kode,nama,stok dari table produk yang stok-nya hanya 4
SELECT kode,nama, stok FROM produk WHERE stok=4;

-- Menampilkan seluruh data pelanggan yang tempat lahirnya Jakarta
SELECT * FROM pelanggan WHERE tmp_lahir='jakarta';

-- Menampilkan kode, nama, tmp_lahir, tgl_lahir dari pelanggan diurutkan dari yang paling muda usianya
SELECT kode, nama, tmp_lahir, tgl_lahir FROM pelanggan ORDER BY tgl_lahir DESC;


--
-- Soal 2.2
--

-- Menampilkan data produk yang stoknya 3 dan 10
SELECT * FROM produk WHERE stok=3 OR stok=10;

-- Menampilkan data produk yang harga jualnya kurang dari 5 juta tetapi lebih dari 500 ribu
SELECT * FROM produk WHERE harga_jual < 5000000 AND harga_jual > 500000;

-- Menampilkan data produk yang harus segera ditambah stoknya
SELECT * FROM produk WHERE min_stok > stok;

-- Menampilkan data pelanggan mulai dari yang paling muda
SELECT * FROM pelanggan ORDER BY tgl_lahir DESC;

-- Menampilkan data pelanggan yang lahirnya di Jakarta dan gendernya perempuan
SELECT * FROM pelanggan WHERE tmp_lahir='jakarta' AND jk='P';

-- Menampilkan data pelanggan yang ID nya 2, 4 dan 6
SELECT * FROM pelanggan WHERE id IN (2,4,6);

-- Menampilkan data produk yang harganya antara 500 ribu sampai 6 juta
SELECT * FROM produk WHERE harga_jual >= 500000 AND harga_jual<= 6000000;


--
-- Soal 2.3
--

-- Menampilkan produk yang kode awalnya huruf K dan huruf M
SELECT * FROM produk WHERE kode LIKE 'K%' OR kode LIKE 'M%';

-- Menampilkan produk yang kode awalnya bukan huruf M
SELECT * FROM produk WHERE kode LIKE 'M%';

-- Menampilkan produk-produk televisi
SELECT * FROM produk WHERE nama='tv';

-- Menampilkan pelanggan mengandung huruf 'SA'
SELECT * FROM pelanggan WHERE nama_pelanggan LIKE '%SA%';

-- Menampilkan pelanggan yang lahirnya bukan di Jakarta dan mengandung huruf ‘yo‘
SELECT * FROM pelanggan WHERE NOT tmp_lahir='jakarta' AND tmp_lahir LIKE '%YO%';

-- Menampilkan pelanggan yang karakter huruf ke – 2 nya adalah A
SELECT * FROM pelanggan WHERE nama_pelanggan LIKE '_A%';


--
-- Soal 2.4
--

-- Menampilkan 2 data produk termahal
SELECT * FROM produk ORDER BY harga_beli DESC LIMIT 2;

-- Menampilkan produk yang paling murah
SELECT * FROM produk ORDER BY harga_beli ASC LIMIT 1;

-- Menampilkan produk yang stoknya paling banyak
SELECT * FROM produk ORDER BY stok DESC LIMIT 1;

-- Menampilkan dua produk yang stoknya paling sedikit
SELECT * FROM produk ORDER BY stok ASC LIMIT 2;

-- Menampilkan pelanggan yang paling muda
SELECT * FROM pelanggan ORDER BY tgl_lahir DESC;

-- Menampilkan pelanggan yang paling tua
SELECT * FROM pelanggan ORDER BY tgl_lahir ASC;