 --
 -- Buat fungsi inputPelanggan(), setelah itu panggil fungsinya
 --

 DELIMITER $$
 CREATE PROCEDURE inputPelanggan(kode VARCHAR(20), nama VARCHAR(50), alamat VARCHAR(50), jk VARCHAR(1), tmp_lahir VARCHAR(50), tgl_lahir DATE, email VARCHAR(50), kartu_id INT)
 BEGIN
	 INSERT INTO pelanggan (kode, nama_pelanggan, alamat, jk, tmp_lahir, tgl_lahir, email, kartu_id) 
	 VALUES (kode, nama, alamat, jk, tmp_lahir, tgl_lahir, email, kartu_id);
 END$$
 
DELIMITER ;
CALL inputPelanggan('C011', 'Tina', 'Semarang', 'P', 'Semarang', '2000-07-08', 'tina@gmail.com', 5);

--
-- Buat fungsi showPelanggan(), setelah itu panggil fungsinya
--

DELIMITER $$
CREATE PROCEDURE showPelanggan()
BEGIN
SELECT * FROM pelanggan;
END$$

DELIMITER ;
CALL showPelanggan();

--
-- Buat fungsi inputProduk(), setelah itu panggil fungsinya
--

DELIMITER $$
CREATE PROCEDURE inputProduk(kode_produk VARCHAR(10), nama_produk VARCHAR(50), harga_beli DOUBLE, harga_produk DOUBLE, stok_produk INT, min_stock INT, jenis_produk INT)
BEGIN
   INSERT INTO produk(kode_produk, nama_produk, harga_beli, harga_produk, stok_produk, min_stock, jenis_produk)
   VALUES(kode_produk, nama_produk, harga_beli, harga_produk, stok_produk, min_stock, jenis_produk);
END$$

DELIMITER ;
CALL inputProduk('M003', 'Meja', 200000, 500000, 10, 5, 2);

SELECT * FROM produk;

--
-- Buat fungsi showProduk(), setelah itu panggil fungsinya
--

DELIMITER $$
CREATE PROCEDURE showProduk()
BEGIN 
    SELECT * FROM produk;
END $$
DELIMITER ;

CALL showProduk();

--
-- Buat fungsi totalPesanan(), setelah itu panggil fungsinya
--

DELIMITER $$
CREATE PROCEDURE totalPesanan()
BEGIN
	DECLARE total_pesanan DECIMAL(10,2);
	SELECT SUM(total) INTO total_pesanan FROM pesanan;
	SELECT total_pesanan;
END $$

CALL totalPesanan();

--
-- Tampilkan seluruh pesanan dari semua pelanggan
--

DELIMITER $$
CREATE PROCEDURE seluruhPesanan()
BEGIN
  SELECT pesanan.tanggal, pelanggan.nama_pelanggan, pesanan.total
  FROM pesanan INNER JOIN pelanggan ON pesanan.pelanggan_id = pelanggan.id;
END $$
DELIMITER ;

CALL seluruhPesanan();

--
-- Buatkan QUERY panjang di atas menjadi sebuah VIEW baru: pesanan_produk_vw (menggunakan JOIN dari TABLE pesanan,pelanggan dan produk)
--

CREATE VIEW pesanan_produk_vw AS 
SELECT pesanan.id, pesanan.tanggal, pesanan.total, pelanggan.nama_pelanggan, pelanggan.jk, pelanggan.email, produk.nama AS nama_produk, produk.harga_jual
FROM pesanan 
INNER JOIN pelanggan ON pesanan.pelanggan_id = pelanggan.id
INNER JOIN pesanan_items ON pesanan.id = pesanan_items.pesanan_id
INNER JOIN produk ON pesanan_items.produk_id = produk.id;

SELECT * FROM pesanan_produk_vw;


