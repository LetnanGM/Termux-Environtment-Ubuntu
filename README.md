# TEU: Termux Environment Ubuntu

TEU (Termux Environment Ubuntu) adalah proyek yang memungkinkan pengguna untuk menjalankan Ubuntu 18.04 di dalam Termux menggunakan chroot, memberikan pengalaman yang sangat mirip dengan menjalankan Ubuntu di perangkat Android. Proyek ini menggabungkan beberapa teknologi seperti proot, chroot, dan skrip dari proyek-proyek lain.

## Fitur Utama

- **Ubuntu 18.04**: Jalankan distribusi Ubuntu penuh di perangkat Android Anda.
- **Chroot dan proot**: Teknologi untuk menjalankan lingkungan terisolasi tanpa memerlukan root.
- **Mudah diinstal**: Cukup dengan beberapa langkah sederhana, Anda sudah bisa menjalankan Ubuntu di Termux.

## Persyaratan Sistem

- Termux (pastikan Termux Anda up to date)
- Android 5.0 atau lebih baru
- Koneksi internet untuk mengunduh paket-paket yang diperlukan

## Instalasi

Ikuti langkah-langkah berikut untuk menginstal dan mengatur TEU:

1. **Perbarui dan tingkatkan paket di Termux:**
    ```bash
    apt update && apt upgrade -y
    ```

2. **Instal Git jika belum terpasang:**
    ```bash
    apt install git -y
    ```

3. **Clone repository TEU dari GitHub:**
    ```bash
    git clone https://github.com/LetnanGM/Termux-Environtment-Ubuntu.git
    ```

4. **Pindahkan direktori ke folder TEU dan masuk ke dalamnya:**
    ```bash
    mv Termux-Environtment-Ubuntu TEU
    cd TEU
    ```

5. **Beri izin eksekusi pada skrip instalasi:**
    ```bash
    chmod +x ./ubuntu.sh
    ```

6. **Jalankan skrip instalasi:**
    ```bash
    ./ubuntu.sh
    ```

7. **Mulai Ubuntu:**
   Setelah instalasi selesai, Anda dapat memulai lingkungan Ubuntu dengan perintah berikut:
    ```bash
    ./start-ubuntu.sh
    ```

## Kredit dan Terima Kasih

Proyek ini tidak akan mungkin tanpa kontribusi dari proyek-proyek berikut:

- [Neo-Oli](https://github.com/Neo-Oli) untuk skrip dasar Termux Ubuntu.
- [Andronix dari Techriz](https://github.com/Techriz/Andronix) untuk kontribusi pada chroot dan manajemen lingkungan di Android.
- [proot](https://proot-me.github.io/) untuk menyediakan teknologi yang memungkinkan lingkungan terisolasi berjalan tanpa akses root.

Jika Anda merasa proyek ini berguna, mohon berikan bintang pada repository ini, serta pada proyek-proyek di atas yang telah memberikan kontribusi besar pada pengembangan TEU.

## Bantuan dan Dukungan

Jika Anda mengalami masalah atau memiliki pertanyaan, jangan ragu untuk membuka *issue* di halaman [GitHub Issues](https://github.com/LetnanGM/Termux-Environtment-Ubuntu/issues).

## Lisensi

Proyek ini dilisensikan di bawah [MIT License](LICENSE).
