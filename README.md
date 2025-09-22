# YANSHTER STORE - TOKO ONLINE ATRIBUT PSHT
Pembuat : Brian Evan Fahrezy (24111814110)
---

📱 Deskripsi Aplikasi

Aplikasi ini adalah **aplikasi toko online atribut PSHT** bernama **Yanshter Store**, dibuat menggunakan **Flutter**. Aplikasi ini dirancang untuk memudahkan pengguna dalam melihat, memilih, dan membeli atribut PSHT seperti Sakral, Sabuk, Kaos, dan Hoodie.

🔑 Alur & Fitur Utama:

1. **Splash Screen**

   * Muncul pertama kali saat aplikasi dijalankan.
   * Menampilkan logo, judul aplikasi, teks *“Memuat...”*, serta informasi pembuat.
   * Setelah beberapa detik, otomatis masuk ke halaman Login.

2. **Login Page**

   * Pengguna masuk menggunakan email & password.
   * Setelah login berhasil, diarahkan ke Home Screen.

3. **Home Screen**

   * Menampilkan ucapan *“Selamat Datang, \[nama pengguna]”* (nama diambil dari email sebelum tanda `@`).
   * Terdapat tulisan *“Silahkan pilih:”* diikuti daftar kategori produk (Sakral, Sabuk, Kaos, Hoodie) dalam tampilan list menurun.
   * Ada ikon keranjang di pojok kanan atas dengan indikator jumlah barang.

4. **Kategori Produk**

   * Menampilkan daftar produk per kategori, lengkap dengan gambar, nama, dan harga.
   * Klik produk untuk membuka halaman detail.

5. **Halaman Detail Produk**

   * Menampilkan gambar, nama, deskripsi, kategori, dan harga produk.
   * Produk tertentu (Sakral, Kaos, Hoodie) memiliki opsi ukuran (S, M, L, XL).
   * Pengguna bisa memilih jumlah barang dan menambahkannya ke keranjang.

6. **Keranjang Belanja**

   * Menampilkan semua barang yang sudah dipilih.
   * Barang bisa dihapus langsung dari keranjang.
   * Tombol **Checkout** tersedia untuk melanjutkan pembelian.

7. **Halaman Terima Kasih**

   * Setelah checkout, pengguna diarahkan ke halaman ucapan terima kasih.
   * Terdapat dua opsi:

     * **Beli Barang Lain** → kembali ke HomeScreen dengan keranjang kosong.
     * **Keluar Aplikasi** → kembali ke LoginPage.

🎨 Tampilan

* Tema aplikasi menggunakan **dark mode** dengan aksen warna putih, kuning, dan biru abu-abu.
* UI dibuat dengan komponen Flutter seperti **Scaffold, AppBar, ListView, GridView, Card, ListTile, Dropdown, IconButton, ElevatedButton**.

🛠️ Teknologi

* **Flutter** (Frontend & UI)
* **Dart** (Bahasa Pemrograman)
* Navigasi menggunakan **Navigator.push**, **Navigator.pop**, dan **Navigator.pushReplacement**.
* Data keranjang disimpan secara lokal (in-memory, tanpa database).

---
