<div align="center">
  <h1>🕌 Muslim ID</h1>
  <p><strong>Aplikasi Islami Modern Berbasis Flutter</strong></p>
</div>

Muslim ID adalah aplikasi islami komprehensif dan modern yang dirancang untuk membantu umat Islam dalam menjalankan ibadah sehari-hari. Dibangun menggunakan teknologi Flutter terbaru, aplikasi ini menawarkan pengalaman pengguna yang mulus, responsif, dan kaya akan fitur di berbagai platform.

## ✨ Fitur Utama

Berikut adalah fitur-fitur yang sudah tersedia dan yang sedang dalam tahap pengembangan:
- 📖 **Al-Quran Digital**: Bacaan Al-Quran lengkap dengan terjemahan.
- 🕒 **Jadwal Sholat Otomatis**: Waktu sholat akurat berdasarkan lokasi pengguna.
- 🔔 **Notifikasi Adzan**: Pemberitahuan audio saat masuk waktu sholat.
- 🔊 **Audio Adzan**: Pilihan suara adzan yang menenangkan.
- ⏰ **Pengingat Sholat**: Notifikasi pengingat sebelum dan sesudah waktu sholat.
- 🧭 **Penunjuk Arah Kiblat**: Deteksi arah kiblat presisi tinggi berbasis GPS dan compass (sensor perangkat).
- 📜 **Hadits Harian**: Kumpulan hadits pilihan setiap harinya.
- 🌟 **Ayat Hari Ini**: Ayat Al-Quran yang berubah otomatis setiap hari untuk motivasi.
- 🤲 **Doa Harian**: Kumpulan doa-doa harian dalam Islam.
- 📿 **Tahlil dan Doa Lengkap**: Panduan tahlil dan doa-doa penting.
- 🧮 **Tasbih Digital**: Penghitung dzikir yang praktis.
- 🌍 **Multi Bahasa**: Mendukung berbagai bahasa, termasuk fitur ganti bahasa secara real-time.
- 🤖 **AI Islamic Helper**: Asisten cerdas untuk pertanyaan seputar Islam.
- 🌙 **Dark Mode**: Tema gelap nyaman untuk mata.
- 📍 **Sinkronisasi Lokasi Otomatis**: Memperbarui lokasi GPS secara otomatis untuk keakuratan jadwal sholat.
- 📱 **Responsive UI**: Tampilan yang menyesuaikan dengan sempurna di berbagai ukuran layar (mobile, tablet).
- 📶 **Offline Mode**: Tetap dapat digunakan tanpa koneksi internet.
- 🔖 **Bookmark Ayat dan Doa**: Simpan bacaan atau doa favorit.
- 📖 **Last Read Quran**: Penanda bacaan Al-Quran terakhir.
- ⚙️ **Settings Modern**: Pengaturan aplikasi yang intuitif.
- 💻 **Dukungan Platform**: Berjalan optimal di Android, iOS, Web, dan Windows.

## 📂 Struktur Folder Project

Aplikasi ini menggunakan struktur folder yang rapi dan terorganisir untuk mempermudah pengembangan:

```text
lib/
├── screens/    # Halaman UI dan tampilan aplikasi
├── providers/  # State management menggunakan Provider
├── services/   # Logika bisnis, API calls, dan background tasks
├── widgets/    # Komponen UI yang dapat digunakan kembali (reusable)
├── models/     # Struktur data dan model objek
├── data/       # Data statis atau lokal
└── assets/     # Resource file seperti gambar, fonts, dan audio
android/        # Konfigurasi native Android
ios/            # Konfigurasi native iOS
web/            # Konfigurasi aplikasi Web
```

## 🛠️ Teknologi yang Digunakan

Aplikasi ini dibangun menggunakan tumpukan teknologi modern:
- **Flutter**: Framework UI utama.
- **Dart**: Bahasa pemrograman.
- **Provider**: State management yang efisien.
- **Geolocator**: Plugin untuk mendapatkan lokasi GPS yang akurat.
- **Flutter Local Notifications**: Sistem notification API dari Flutter.
- **Adhan Package**: Perhitungan waktu sholat presisi tinggi.
- **Compass / Qibla Package**: Akses sensor perangkat untuk arah kiblat.
- **Firebase**: Siap untuk integrasi cloud masa depan (Future ready).

## 🏗️ Sistem Arsitektur

Project ini dirancang untuk kemudahan pemeliharaan dan skalabilitas tinggi:
- **Clean Architecture**: Pemisahan jelas antara layer UI, Business Logic, dan Data.
- **Modular Structure**: Kode dibagi dalam modul-modul spesifik per fitur.
- **Provider State Management**: Mengelola state aplikasi secara terpusat dengan performa tinggi.
- **Service-Based Logic**: Logika abstrak spesifik dipusatkan di layer *Service*.
- **Localization System**: Sistem translasi aplikasi multinasional yang terstruktur.

## 🚀 Roadmap Pengembangan

Kami terus berkomitmen menambahkan fitur-fitur baru di masa depan:
- [ ] 🔐 Login Akun Muslim
- [ ] ☁️ Sinkronisasi Cloud
- [ ] 🧠 AI Tafsir Quran
- [ ] 💬 AI Tanya Jawab Islam
- [ ] 📅 Jadwal Puasa Sunnah
- [ ] 🏠 Widget Homescreen
- [ ] ⌚ Wear OS Support
- [ ] 🔊 Smartwatch Adzan
- [ ] 🤝 Community Muslim
- [ ] 📺 Live Kajian
- [ ] 🎧 Islamic Podcast

## 💻 Cara Install

Ikuti langkah-langkah di bawah ini untuk menginstal dan menjalankan aplikasi secara lokal:

```bash
# Mengunduh semua dependency proyek
flutter pub get

# Menjalankan aplikasi
flutter run
```
