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

## Struktur Proyek

```text
travel/
└── proyek-travel/
    ├── app.py                     # Main Flask Application
    ├── requirements.txt           # Dependensi Python
    ├── static/
    │   └── css/
    │       └── style.css          # Kustomisasi gaya tampilan UI
    └── templates/                 # Halaman HTML (Jinja2 Templates)
        ├── base.html              # Layout utama
        ├── 404.html               # Halaman error 404
        ├── index.html             # Halaman utama / beranda
        ├── login.html             # Halaman masuk sistem
        ├── destinasi.html         # Daftar destinasi perjalanan
        ├── detail.html            # Detail rute/destinasi
        ├── jadwal.html            # Jadwal keberangkatan
        ├── kendaraan.html         # Daftar unit kendaraan
        ├── supir.html             # Data pengemudi
        ├── pesan.html             # Form pemesanan tiket
        ├── transaksi.html         # Riwayat & rincian transaksi
        ├── user.html              # Profil / manajemen user
        ├── tentang.html           # Informasi aplikasi
        ├── form_destinasi.html    # Form kelola destinasi (Admin)
        └── form_jadwal.html       # Form kelola jadwal (Admin)
# Route dan Halaman Aplikasi
