
-- Membuat Database Toko
CREATE DATABASE dbToko;

-- Membuat Tabel Kartu
CREATE TABLE kartu (
id INTEGER AUTO_INCREMENT PRIMARY KEY,
kode VARCHAR(4) UNIQUE,
nama VARCHAR(30) NOT NULL,
diskon DOUBLE DEFAULT 0,
iuran DOUBLE DEFAULT 0
);

-- Membuat Tabel Pelanggan
CREATE TABLE pelanggan(
id INT AUTO_INCREMENT PRIMARY KEY,
kode VARCHAR(10) UNIQUE,
nama VARCHAR(45),
jk CHAR(1),
tmp_lahir VARCHAR(30),
tgl_lahir DATE,
email VARCHAR(45),
kartu_id INT NOT NULL REFERENCES kartu(id)
);

-- Membuat Tabel Pesanan
CREATE TABLE pesanan(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
tanggal DATE,
total DOUBLE,
pelanggan_id INT NOT NULL REFERENCES pelanggan(id)
);

-- Membuat Tabel Pembayaran
CREATE TABLE pembayaran(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nokuitansi VARCHAR(10) UNIQUE,
tanggal DATE,
jumlah DOUBLE,
ke INT,
pesanan_id INT NOT NULL REFERENCES pesanan(id)
);

-- Membuat Tabel Jenis Produk
CREATE TABLE jenis_produk(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nama VARCHAR(45)
);

-- Membuat Tabel Produk
CREATE TABLE produk(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
kode VARCHAR(10) UNIQUE,
nama VARCHAR(45) NOT NULL,
harga_beli DOUBLE DEFAULT 0,
harga_jual DOUBLE DEFAULT 0,
stok INT(11),
min_stok INT(11),
jenis_produk_id INT NOT NULL REFERENCES jenis_produk(id)
);

-- Membuat Tabel Pesanan Item
CREATE TABLE pesanan_item(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
produk_id INT NOT NULL REFERENCES produk(id),
pesanan_id INT NOT NULL REFERENCES pesanan(id),
qty INT(11),
harga DOUBLE DEFAULT 0
);

-- Membuat Tabel Vendor
CREATE TABLE vendor(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nomor VARCHAR(4) UNIQUE,
nama VARCHAR(40) NOT NULL,
kota VARCHAR(30),
kontak VARCHAR(30)
);

-- Membuat Tabel Pembelian
CREATE TABLE pembelian(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
tanggal DATE,
nomor VARCHAR(10) UNIQUE,
produk_id INT REFERENCES produk(id),
jumlah INT(11),
harga DOUBLE DEFAULT 0,
vendor_id INT REFERENCES vendor(id)
);

-- Menambahkan kolom Alamat pada Tabel Pelanggan
ALTER TABLE pelanggan
ADD COLUMN alamat VARCHAR(10);

-- Mengubah kolom nama menjadi nama_pelanggan
ALTER TABLE pelanggan
CHANGE nama nama_pelanggan VARCHAR(45);
	
-- Mengubah tipe data nama_pelanggan
ALTER TABLE pelanggan
MODIFY nama_pelanggan VARCHAR(50);





