#  Proyek Aplikasi Web Travel

Deskripsi singkat tentang web
Web travel ini menyediakan layanan perjalanan yang menawarkan berbagai rute perjalanan dan destinasi

#  Nama anggota kelompok
Ketua : Nada Shofia Nadhila (252102003):Sebagai Pengembang route Flask, Pengembang template dan tampilan

Anggota: Helna Vika Bastian(252102011):Sebagai Pengembang route Flask, Pengembang template dan tampilan

Anggota: Dani Hermawan(252102002):Sebagai Pengelola database, Pengembang template dan tampilan

Anggota: Satria Wicaksono(252102013):Sebagai Pengembang template dan tampilan, Dokumentator

https://github.com/helnavikaunjaya/travel_codecraft/blame/main/app.py

# Langkah instal environment
1.Langkah awal kita masuk ke anaconda prompt

2.Membuat eirtual environment baru karna kita travel maka kita ketik("conda create -n travel python=3.9")

3.Saat muncul pertanyaan konfirmasi seperti Proceed ([y]/n)?, ketik huruf y lalu tekan Enter untuk melanjutkan proses pengunduhan dan instalasi paket.

4.Tunggu hingga proses selesai dan kursor kembali menampilkan baris perintah baru.

5.Masuk / Mengaktifkan Virtual Environment

6.Setelah environment berhasil dibuat, ketik perintah berikut untuk masuk ke dalamnya:("conda activate travel")

7.Tekan Enter. Tanda di awal baris terminal Anda akan berubah dari (base) menjadi (travel), yang menandakan Anda sudah berhasil masuk ke dalam virtual environment tersebut.

# Alur Demonstrasi
1. Tunjukkan versi Flask (`flask --version`) dan jalankan `python app.py`.
   
2. Buka beranda dan halaman Tentang.
   
3. Buka daftar destinasi, coba pencarian, lalu buka satu detail.
   
4. Buka detail dengan id yang tidak ada (contoh: `/destinasiD25`) untuk menunjukkan halaman 404.
   
5. Login sebagai **admin**: lihat supir, kendaraan, jadwal, transaksi, dan user
    
6. Login sebagai **user**: lihat jadwal dan transaksi

7. Contoh:usn: admin pw:admin123 dan usn:uwon pw: uwon123
    
# Struktur Proyek
**Ketik tiga backtick di sini untuk mengawali blok kode:**
```text
proyek-travel/
├── static/
│   └── css/
│       └── style.css
├── templates/
│   ├── 404.html
│   ├── base.html
│   ├── index.html
│   ├── destinasi.html
│   ├── jadwal.html
│   ├── kendaraan.html
│   ├── login.html
│   ├── supir.html
│   ├── tentang.html
│   ├── transaksi.html
│   └── user.html
├── app.py
├── config.py
├── models.py
└── requirements.txt

#**Route dan Halaman Aplikasi**
1.index.html   / atau /beranda   Halaman utama atau beranda yang menyambut pengguna saat pertama kali mengakses aplikasi.

2.tentang.html   /tentang   Halaman informasi mengenai profil atau deskripsi singkat tentang aplikasi travel.

3.destinasi.html   /destinasi   Halaman yang menampilkan daftar pilihan tujuan atau rute perjalanan wisata.

4.jadwal.html   /jadwal   Halaman yang menampilkan daftar jadwal keberangkatan armada travel.

5.kendaraan.html   /kendaraan   Halaman yang menampilkan data unit armada kendaraan yang tersedia.

6.supir.html   /supir   Halaman yang menampilkan data pengemudi (supir) yang bertugas.

7.transaksi.html   /transaksi   Halaman yang mencatat riwayat serta rincian pembayaran atau transaksi tiket.

8.user.html   /user   Halaman untuk melihat atau mengelola informasi profil akun pengguna.

9.login.html   /login   Halaman masuk sistem bagi pengguna atau administrator.

10.404.html   (Penanganan Error)   Halaman khusus yang otomatis muncul apabila pengguna mengakses URL yang tidak ditemukan di dalam sistem.

11. Detail.html /detail Halaman Menampilkan Jadwal,Jam Keberangkatan,Supir,Sisa Kursi dan juga Kendaraan

12. Base.html / Base berisi tentang Fitur khusus untuk admin(supir,kendaraan ,user) , untuk umum yang sudah login
   (jadwal,transaksi,profil,keluar) dan umum yang belum login (beranda,tentang,destinasi,login)
