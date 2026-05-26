import '../models/hadith.dart';

final List<Hadith> hadithList = [
  Hadith(id: 1, title: 'Niat dalam Beramal', narrator: 'Umar bin Khattab RA', arabic: 'إِنَّمَا الْأَعْمَالُ بِالنِّيَّاتِ وَإِنَّمَا لِكُلِّ امْرِئٍ مَا نَوَى', translation: 'Sesungguhnya setiap amalan tergantung pada niatnya. Dan sesungguhnya setiap orang akan mendapatkan apa yang ia niatkan.', source: 'HR. Bukhari & Muslim', category: 'Akhlak'),
  Hadith(id: 2, title: 'Rukun Islam', narrator: 'Ibnu Umar RA', arabic: 'بُنِيَ الْإِسْلَامُ عَلَى خَمْسٍ شَهَادَةِ أَنْ لَا إِلٰهَ إِلَّا اللّٰهُ وَأَنَّ مُحَمَّدًا رَسُولُ اللّٰهِ وَإِقَامِ الصَّلَاةِ وَإِيتَاءِ الزَّكَاةِ وَحَجِّ الْبَيْتِ وَصَوْمِ رَمَضَانَ', translation: 'Islam dibangun di atas lima perkara: bersaksi bahwa tiada tuhan selain Allah dan Muhammad adalah utusan Allah, mendirikan sholat, menunaikan zakat, haji ke Baitullah, dan puasa Ramadhan.', source: 'HR. Bukhari & Muslim', category: 'Aqidah'),
  Hadith(id: 3, title: 'Meninggalkan yang Tidak Bermanfaat', narrator: 'Abu Hurairah RA', arabic: 'مِنْ حُسْنِ إِسْلَامِ الْمَرْءِ تَرْكُهُ مَا لَا يَعْنِيهِ', translation: 'Di antara tanda baiknya keislaman seseorang adalah meninggalkan hal-hal yang tidak bermanfaat baginya.', source: 'HR. Tirmidzi & Ibnu Majah', category: 'Akhlak'),
  Hadith(id: 4, title: 'Cinta Sesama Muslim', narrator: 'Anas bin Malik RA', arabic: 'لَا يُؤْمِنُ أَحَدُكُمْ حَتَّى يُحِبَّ لِأَخِيهِ مَا يُحِبُّ لِنَفْسِهِ', translation: 'Tidak beriman salah seorang di antara kalian sehingga ia mencintai untuk saudaranya apa yang ia cintai untuk dirinya sendiri.', source: 'HR. Bukhari & Muslim', category: 'Akhlak'),
  Hadith(id: 5, title: 'Halal dan Haram', narrator: 'Nu\'man bin Basyir RA', arabic: 'إِنَّ الْحَلَالَ بَيِّنٌ وَإِنَّ الْحَرَامَ بَيِّنٌ وَبَيْنَهُمَا أُمُورٌ مُشْتَبِهَاتٌ', translation: 'Sesungguhnya yang halal itu jelas dan yang haram itu jelas. Di antara keduanya ada perkara-perkara yang samar.', source: 'HR. Bukhari & Muslim', category: 'Fiqih'),
  Hadith(id: 6, title: 'Jangan Marah', narrator: 'Abu Hurairah RA', arabic: 'لَا تَغْضَبْ', translation: 'Jangan marah!', source: 'HR. Bukhari', category: 'Akhlak'),
  Hadith(id: 7, title: 'Sebaik-baik Manusia', narrator: 'Usman bin Affan RA', arabic: 'خَيْرُكُمْ مَنْ تَعَلَّمَ الْقُرْآنَ وَعَلَّمَهُ', translation: 'Sebaik-baik kalian adalah orang yang belajar Al-Qur\'an dan mengajarkannya.', source: 'HR. Bukhari', category: 'Al-Quran'),
  Hadith(id: 8, title: 'Malu Bagian dari Iman', narrator: 'Abu Hurairah RA', arabic: 'الْإِيمَانُ بِضْعٌ وَسَبْعُونَ شُعْبَةً وَالْحَيَاءُ شُعْبَةٌ مِنَ الْإِيمَانِ', translation: 'Iman itu memiliki tujuh puluh lebih cabang. Dan malu adalah salah satu cabang dari iman.', source: 'HR. Bukhari & Muslim', category: 'Aqidah'),
  Hadith(id: 9, title: 'Larangan Saling Menzalimi', narrator: 'Abu Dzar RA', arabic: 'يَا عِبَادِي إِنِّي حَرَّمْتُ الظُّلْمَ عَلَى نَفْسِي وَجَعَلْتُهُ بَيْنَكُمْ مُحَرَّمًا فَلَا تَظَالَمُوا', translation: 'Wahai hamba-Ku, sesungguhnya Aku telah haramkan kezaliman atas diri-Ku dan menjadikannya haram di antara kalian, maka janganlah kalian saling menzalimi.', source: 'HR. Muslim (Hadits Qudsi)', category: 'Akhlak'),
  Hadith(id: 10, title: 'Bertakwa dan Berakhlak', narrator: 'Abu Dzar RA', arabic: 'اتَّقِ اللّٰهَ حَيْثُمَا كُنْتَ وَأَتْبِعِ السَّيِّئَةَ الْحَسَنَةَ تَمْحُهَا وَخَالِقِ النَّاسَ بِخُلُقٍ حَسَنٍ', translation: 'Bertakwalah kepada Allah di mana pun kamu berada, iringilah keburukan dengan kebaikan niscaya kebaikan itu akan menghapusnya, dan berakhlaklah kepada manusia dengan akhlak yang baik.', source: 'HR. Tirmidzi', category: 'Akhlak'),
  Hadith(id: 11, title: 'Jangan Berlebihan', narrator: 'Abu Hurairah RA', arabic: 'إِنَّ الدِّينَ يُسْرٌ وَلَنْ يُشَادَّ الدِّينَ أَحَدٌ إِلَّا غَلَبَهُ', translation: 'Sesungguhnya agama itu mudah. Tidaklah seseorang mempersulit agama kecuali ia akan dikalahkan.', source: 'HR. Bukhari', category: 'Fiqih'),
  Hadith(id: 12, title: 'Menjaga Lisan', narrator: 'Abu Hurairah RA', arabic: 'مَنْ كَانَ يُؤْمِنُ بِاللّٰهِ وَالْيَوْمِ الْآخِرِ فَلْيَقُلْ خَيْرًا أَوْ لِيَصْمُتْ', translation: 'Barangsiapa yang beriman kepada Allah dan hari akhir, hendaklah ia berkata baik atau diam.', source: 'HR. Bukhari & Muslim', category: 'Akhlak'),
  Hadith(id: 13, title: 'Kebersihan Separuh Iman', narrator: 'Abu Malik Al-Asy\'ari RA', arabic: 'الطُّهُورُ شَطْرُ الْإِيمَانِ', translation: 'Kebersihan adalah separuh dari iman.', source: 'HR. Muslim', category: 'Aqidah'),
  Hadith(id: 14, title: 'Senyum adalah Sedekah', narrator: 'Abu Dzar RA', arabic: 'تَبَسُّمُكَ فِي وَجْهِ أَخِيكَ لَكَ صَدَقَةٌ', translation: 'Senyummu di hadapan saudaramu adalah sedekah bagimu.', source: 'HR. Tirmidzi', category: 'Akhlak'),
  Hadith(id: 15, title: 'Keutamaan Sholat Berjamaah', narrator: 'Abdullah bin Umar RA', arabic: 'صَلَاةُ الْجَمَاعَةِ أَفْضَلُ مِنْ صَلَاةِ الْفَذِّ بِسَبْعٍ وَعِشْرِينَ دَرَجَةً', translation: 'Sholat berjamaah lebih utama daripada sholat sendirian dengan dua puluh tujuh derajat.', source: 'HR. Bukhari & Muslim', category: 'Ibadah'),
  Hadith(id: 16, title: 'Surga di Bawah Telapak Kaki Ibu', narrator: 'Anas bin Malik RA', arabic: 'الْجَنَّةُ تَحْتَ أَقْدَامِ الْأُمَّهَاتِ', translation: 'Surga itu berada di bawah telapak kaki ibu.', source: 'HR. Ahmad & Nasai', category: 'Keluarga'),
  Hadith(id: 17, title: 'Larangan Dengki', narrator: 'Abu Hurairah RA', arabic: 'لَا تَحَاسَدُوا وَلَا تَنَاجَشُوا وَلَا تَبَاغَضُوا وَلَا تَدَابَرُوا', translation: 'Janganlah kalian saling dengki, saling menipu, saling membenci, dan saling membelakangi.', source: 'HR. Muslim', category: 'Akhlak'),
  Hadith(id: 18, title: 'Keutamaan Dzikir', narrator: 'Abu Hurairah RA', arabic: 'كَلِمَتَانِ خَفِيفَتَانِ عَلَى اللِّسَانِ ثَقِيلَتَانِ فِي الْمِيزَانِ حَبِيبَتَانِ إِلَى الرَّحْمٰنِ سُبْحَانَ اللّٰهِ وَبِحَمْدِهِ سُبْحَانَ اللّٰهِ الْعَظِيمِ', translation: 'Dua kalimat yang ringan di lidah, berat di timbangan, dan dicintai oleh Ar-Rahman: Subhanallahi wa bihamdihi, Subhanallahil \'Azhim.', source: 'HR. Bukhari & Muslim', category: 'Ibadah'),
  Hadith(id: 19, title: 'Amalan yang Tidak Terputus', narrator: 'Abu Hurairah RA', arabic: 'إِذَا مَاتَ الْإِنْسَانُ انْقَطَعَ عَمَلُهُ إِلَّا مِنْ ثَلَاثٍ صَدَقَةٍ جَارِيَةٍ أَوْ عِلْمٍ يُنْتَفَعُ بِهِ أَوْ وَلَدٍ صَالِحٍ يَدْعُو لَهُ', translation: 'Jika manusia meninggal dunia, terputuslah amalnya kecuali tiga perkara: sedekah jariyah, ilmu yang bermanfaat, atau anak soleh yang mendoakannya.', source: 'HR. Muslim', category: 'Ibadah'),
  Hadith(id: 20, title: 'Kasih Sayang', narrator: 'Abu Hurairah RA', arabic: 'مَنْ لَا يَرْحَمُ لَا يُرْحَمُ', translation: 'Barangsiapa yang tidak menyayangi, maka ia tidak akan disayangi.', source: 'HR. Bukhari & Muslim', category: 'Akhlak'),
];

// Hadith categories
final List<String> hadithCategories = [
  'Semua',
  'Akhlak',
  'Aqidah',
  'Ibadah',
  'Fiqih',
  'Al-Quran',
  'Keluarga',
];
