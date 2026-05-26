import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrayerGuide {
  final String title;
  final String description;
  final List<PrayerStep> steps;
  final String niatArabic;
  final String niatLatin;
  final String niatTranslation;

  PrayerGuide({
    required this.title,
    required this.description,
    required this.steps,
    required this.niatArabic,
    required this.niatLatin,
    required this.niatTranslation,
  });
}

class PrayerStep {
  final String title;
  final String description;
  final String? arabic;

  PrayerStep({required this.title, required this.description, this.arabic});
}

final List<PrayerGuide> prayerGuides = [
  PrayerGuide(
    title: 'Sholat Jum\'at',
    description: 'Sholat dua rakaat yang dilakukan secara berjamaah pada waktu dzuhur di hari Jumat.',
    niatArabic: 'أُصَلِّي فَرْضَ الْجُمُعَةِ رَكْعَتَيْنِ أَدَاءً مَأْمُوْمًا لِلّٰهِ تَعَالَى',
    niatLatin: 'Ushalli fardhal jumu\'ati rak\'ataini ada-an ma\'muman lillahi ta\'ala.',
    niatTranslation: 'Aku niat sholat fardu Jumat dua rakaat tunai sebagai makmum karena Allah Ta\'ala.',
    steps: [
      PrayerStep(title: 'Niat', description: 'Membaca niat sholat Jumat dalam hati.'),
      PrayerStep(title: 'Takbiratul Ihram', description: 'Mengangkat kedua tangan sejajar telinga sambil membaca Allahu Akbar.'),
      PrayerStep(title: 'Mendengarkan Khutbah', description: 'Sebelum sholat, jamaah wajib mendengarkan dua khutbah Jumat dengan khidmat.'),
      PrayerStep(title: 'Rakaat Pertama', description: 'Dilakukan seperti sholat fardu lainnya (Al-Fatihah, Surah, Ruku, Iktidal, Sujud).'),
      PrayerStep(title: 'Rakaat Kedua', description: 'Dilakukan seperti rakaat pertama, diakhiri dengan Tahiyat Akhir dan Salam.'),
    ],
  ),
  PrayerGuide(
    title: 'Sholat Jenazah',
    description: 'Sholat yang dilakukan untuk mendoakan mayit muslim. Dilakukan dengan 4 takbir tanpa ruku dan sujud.',
    niatArabic: 'أُصَلِّي عَلَى هٰذَا الْمَيِّتِ أَرْبَعَ تَكْبِيْرَاتٍ فَرْضَ كِفَايَةِ مَأْمُوْمًا لِلّٰهِ تَعَالَى',
    niatLatin: 'Ushalli \'ala hadzal mayyiti arba\'a takbiratin fardha kifayatin ma\'muman lillahi ta\'ala.',
    niatTranslation: 'Aku niat sholat atas jenazah ini empat takbir fardu kifayah sebagai makmum karena Allah Ta\'ala.',
    steps: [
      PrayerStep(title: 'Takbir Pertama', description: 'Membaca Al-Fatihah setelah takbir pertama.'),
      PrayerStep(title: 'Takbir Kedua', description: 'Membaca Shalawat Nabi setelah takbir kedua.', arabic: 'اللّٰهُمَّ صَلِّ عَلَى سَيِّدِنَا مُحَمَّدٍ...'),
      PrayerStep(title: 'Takbir Ketiga', description: 'Mendoakan jenazah setelah takbir ketiga.', arabic: 'اللّٰهُمَّ اغْفِرْ لَهُ وَارْحَمْهُ وَعَافِهِ وَاعْفُ عَنْهُ...'),
      PrayerStep(title: 'Takbir Keempat', description: 'Berdoa untuk jenazah dan orang yang ditinggalkan.', arabic: 'اللّٰهُمَّ لَا تَحْرِمْنَا أَجْرَهُ وَلَا تَفْتِنَّا بَعْدَهُ...'),
      PrayerStep(title: 'Salam', description: 'Menoleh ke kanan dan ke kiri seperti sholat biasa.'),
    ],
  ),
  PrayerGuide(
    title: 'Sholat Idul Fitri',
    description: 'Sholat sunnah dua rakaat yang dilakukan berjamaah pada pagi hari raya Idul Fitri.',
    niatArabic: 'أُصَلِّي سُنَّةً لِعِيْدِ الْفِطْرِ رَكْعَتَيْنِ مَأْمُوْمًا لِلّٰهِ تَعَالَى',
    niatLatin: 'Ushalli sunnatan li\'idil fithri rak\'ataini ma\'muman lillahi ta\'ala.',
    niatTranslation: 'Aku niat sholat sunnah Idul Fitri dua rakaat sebagai makmum karena Allah Ta\'ala.',
    steps: [
      PrayerStep(title: 'Takbiratul Ihram', description: 'Niat dan takbir pertama.'),
      PrayerStep(title: '7 Kali Takbir rakaat pertama', description: 'Mengucapkan takbir sebanyak 7 kali pada rakaat pertama, di sela-sela takbir membaca tasbih.', arabic: 'سُبْحَانَ اللّٰهِ وَالْحَمْدُ لِلّٰهِ...'),
      PrayerStep(title: 'Rakaat Pertama', description: 'Membaca Al-Fatihah dan surah (disunnahkan Al-A\'la).'),
      PrayerStep(title: '5 Kali Takbir rakaat kedua', description: 'Mengucapkan takbir sebanyak 5 kali pada rakaat kedua.'),
      PrayerStep(title: 'Rakaat Kedua', description: 'Membaca Al-Fatihah dan surah (disunnahkan Al-Ghasyiyah).'),
    ],
  ),
  PrayerGuide(
    title: 'Sholat Idul Adha',
    description: 'Sholat sunnah dua rakaat pada 10 Dzulhijjah pagi hari raya kurban.',
    niatArabic: 'أُصَلِّي سُنَّةً لِعِيْدِ الْأَضْحَى رَكْعَتَيْنِ مَأْمُوْمًا لِلّٰهِ تَعَالَى',
    niatLatin: 'Ushalli sunnatan li\'idil adha rak\'ataini ma\'muman lillahi ta\'ala.',
    niatTranslation: 'Aku niat sholat sunnah Idul Adha dua rakaat sebagai makmum karena Allah Ta\'ala.',
    steps: [
      PrayerStep(title: 'Prosedur Sama dengan Idul Fitri', description: 'Dilakukan 2 rakaat dengan 7 takbir di rakaat pertama dan 5 takbir di rakaat kedua.'),
      PrayerStep(title: 'Penyembelihan Kurban', description: 'Dilaksanakan setelah sholat Idul Adha selesai.'),
    ],
  ),
  PrayerGuide(
    title: 'Sholat Tahajjud',
    description: 'Sholat sunnah yang dilakukan pada malam hari setelah bangun tidur.',
    niatArabic: 'أُصَلِّي سُنَّةَ التَّهَجُدِ رَكْعَتَيْنِ لِلّٰهِ تَعَالَى',
    niatLatin: 'Ushalli sunnatat tahajjudi rak\'ataini lillahi ta\'ala.',
    niatTranslation: 'Aku niat sholat sunnah Tahajjud dua rakaat karena Allah Ta\'ala.',
    steps: [
      PrayerStep(title: 'Waktu Utama', description: 'Sepertiga malam terakhir (sekitar jam 02.00 - sebelum Subuh).'),
      PrayerStep(title: 'Minimal 2 Rakaat', description: 'Dilakukan minimal 2 rakaat dan kelipatannya, ditutup dengan sholat Witir.'),
    ],
  ),
  PrayerGuide(
    title: 'Sholat Tarawih',
    description: 'Sholat sunnah pada malam bulan Ramadhan setelah sholat Isya.',
    niatArabic: 'أُصَلِّي سُنَّةَ التَّرَاوِيْحِ رَكْعَتَيْنِ مُسْتَقْبِلَ الْقِبْلَةِ مَأْمُوْمًا لِلّٰهِ تَعَالَى',
    niatLatin: 'Ushalli sunnatat tarawihi rak\'ataini mustaqbilal qiblati ma\'muman lillahi ta\'ala.',
    niatTranslation: 'Aku niat sholat sunnah Tarawih dua rakaat menghadap kiblat sebagai makmum karena Allah Ta\'ala.',
    steps: [
      PrayerStep(title: 'Waktu', description: 'Setelah sholat Isya hingga sebelum Subuh di bulan Ramadhan.'),
      PrayerStep(title: 'Pelaksanaan', description: 'Dilaksanakan 2 rakaat dengan salam, total rakaat bisa 8 atau 20 sesuai adat setempat.'),
      PrayerStep(title: 'Penutup Witir', description: 'Setelah tarawih selesai, sangat dianjurkan melanjutkannya dengan sholat sunnah Witir 3 rakaat.'),
    ],
  ),
];
