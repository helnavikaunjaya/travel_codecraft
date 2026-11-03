#  Proyek Aplikasi Web Travel

Deskripsi singkat tentang web
Web travel ini menyediakan layanan perjalanan yang menawarkan berbagai rute perjalanan dan destinasi

#  Nama anggota kelompok
Ketua : Nada Shofia Nadhila (252102003)

Anggota:Helna Vika Bastian(252102011)

Anggota:Dani Hermawan(252102002)

Anggota:Satria Wicaksono(252102013)

# Langkah instal environment
1.Langkah awal kita masuk ke anaconda prompt

2.Membuat eirtual environment baru karna kita travel maka kita ketik("conda create -n travel python=3.9")

3.Saat muncul pertanyaan konfirmasi seperti Proceed ([y]/n)?, ketik huruf y lalu tekan Enter untuk melanjutkan proses pengunduhan dan instalasi paket.

4.Tunggu hingga proses selesai dan kursor kembali menampilkan baris perintah baru.

5.Masuk / Mengaktifkan Virtual Environment

6.Setelah environment berhasil dibuat, ketik perintah berikut untuk masuk ke dalamnya:("conda activate travel")

7.Tekan Enter. Tanda di awal baris terminal Anda akan berubah dari (base) menjadi (travel), yang menandakan Anda sudah berhasil masuk ke dalam virtual environment tersebut.

# Langkah Penggunaan 
1.Buka Anaconda Prompt di komputer Windows Anda

2.Aktifkan virtual environment yang telah dibuat sebelumnya

3.Pastikan indikator di awal baris terminal telah berubah menjadi (travel).

4.Masuk ke Direktori Proyek

5.Arahkan terminal ke folder tempat penyimpanan direktori proyek Anda menggunakan perintah("cd path/ke/folder/travel/proyek-travel")

6.Instalasi Pustaka (Dependensi)

7.Pasang seluruh pustaka Python yang dibutuhkan aplikasi berdasarkan berkas("pip install -r requirements.txt")

8.Jalankan aplikasi Flask:("python app.py")

9.Buka browser dan akses:("http://127.0.0.1:5000/")

10.Konfigurasi dan Penyiapan Database

11.Pastikan server database Anda (seperti MySQL/MariaDB melalui XAMPP atau phpMyAdmin) sudah dalam keadaan aktif.

12.Pastikan database, tabel utama, serta data awal (minimal 20 data per tabel) telah diimpor dengan benar.

13.Pastikan fungsi koneksi database pada kode Anda sudah terhubung dengan baik.

# Struktur Proyek
**Ketik tiga backtick di sini untuk mengawali blok kode:**
```text
proyek-travel/
├── .vscode/
│   └── settings.json
├── app.py
└── requirements.txt
proyek-travel/
├── .vscode/
│   └── settings.json
├── __pycache__/
│   ├── config.cpython-39.pyc
│   └── models.cpython-39.pyc
├── static/
│   └── css/
│       └── style.css
├── templates/
│   ├── 404.html
│   ├── base.html
│   ├── beranda.html
│   ├── destinasi.html
│   ├── form_destinasi.html      # Form kelola destinasi (Admin)
│   ├── form_jadwal.html         # Form kelola jadwal (Admin)
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
# Route dan Halaman Aplikasi
1.beranda.html   / atau /beranda   Halaman utama atau beranda yang menyambut pengguna saat pertama kali mengakses aplikasi.

2.tentang.html   /tentang   Halaman informasi mengenai profil atau deskripsi singkat tentang aplikasi travel.

3.destinasi.html   /destinasi   Halaman yang menampilkan daftar pilihan tujuan atau rute perjalanan wisata.

4.jadwal.html   /jadwal   Halaman yang menampilkan daftar jadwal keberangkatan armada travel.

5.kendaraan.html   /kendaraan   Halaman yang menampilkan data unit armada kendaraan yang tersedia.

6.supir.html   /supir   Halaman yang menampilkan data pengemudi (supir) yang bertugas.

7.transaksi.html   /transaksi   Halaman yang mencatat riwayat serta rincian pembayaran atau transaksi tiket.

8.user.html   /user   Halaman untuk melihat atau mengelola informasi profil akun pengguna.

9.login.html   /login   Halaman masuk sistem bagi pengguna atau administrator.

10.404.html   (Penanganan Error)   Halaman khusus yang otomatis muncul apabila pengguna mengakses URL yang tidak ditemukan di dalam sistem.
