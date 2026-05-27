/// Comprehensive Islamic Knowledge Database for AI Assistant
/// Contains categorized knowledge for intelligent Q&A responses.

class IslamicKnowledge {
  final String id;
  final List<String> keywords;
  final String category;
  final Map<String, String> responses; // language code -> response

  const IslamicKnowledge({
    required this.id,
    required this.keywords,
    required this.category,
    required this.responses,
  });
}

// ─── GREETING RESPONSES ─────────────────────────────────────────────────────
const List<Map<String, String>> greetingResponses = [
  {
    'id': "Wa'alaikumussalam warahmatullahi wabarakatuh! 😊\n\nAlhamdulillah, senang bisa membantu Anda. Saya adalah Asisten Muslim AI yang siap menjawab pertanyaan seputar Islam.\n\nAnda bisa bertanya tentang:\n🕌 Sholat & Ibadah\n📖 Al-Quran & Tafsir\n📜 Hadits\n🤲 Doa-doa\n🧭 Kiblat\n📿 Dzikir & Tasbih\n💡 Dan masih banyak lagi!\n\nSilakan tanyakan apa saja, insya Allah saya bantu.",
    'en': "Wa'alaikumussalam warahmatullahi wabarakatuh! 😊\n\nAlhamdulillah, glad to help you. I'm the Muslim AI Assistant, ready to answer your questions about Islam.\n\nYou can ask about:\n🕌 Prayer & Worship\n📖 Quran & Tafsir\n📜 Hadith\n🤲 Duas\n🧭 Qibla\n📿 Dhikr & Tasbih\n💡 And much more!\n\nFeel free to ask anything, Insha Allah I'll assist you.",
    'ar': "وعليكم السلام ورحمة الله وبركاته! 😊\n\nالحمد لله، سعيد بمساعدتك. أنا المساعد الإسلامي الذكي.\n\nيمكنك السؤال عن:\n🕌 الصلاة والعبادة\n📖 القرآن والتفسير\n📜 الحديث\n🤲 الأدعية\n🧭 القبلة\n📿 الذكر والتسبيح\n\nتفضل بسؤالك.",
  },
  {
    'id': "Wa'alaikumussalam! 🌙\n\nBagaimana kabar Anda? Semoga selalu dalam lindungan Allah SWT.\n\nSaya siap membantu Anda belajar dan memahami Islam lebih dalam. Silakan bertanya! 😊",
    'en': "Wa'alaikumussalam! 🌙\n\nHow are you? May you always be under Allah's protection.\n\nI'm ready to help you learn and understand Islam better. Feel free to ask! 😊",
    'ar': "وعليكم السلام! 🌙\n\nكيف حالك؟ أسأل الله أن تكون بخير.\n\nأنا مستعد لمساعدتك. تفضل بسؤالك! 😊",
  },
];

const List<Map<String, String>> helloResponses = [
  {
    'id': "Halo! Assalamu'alaikum! 👋😊\n\nSelamat datang di Muslim AI Assistant. Saya siap membantu Anda dengan pertanyaan seputar Islam.\n\nCobalah bertanya tentang sholat, doa, Al-Quran, hadits, atau topik islami lainnya!",
    'en': "Hello! Assalamu'alaikum! 👋😊\n\nWelcome to Muslim AI Assistant. I'm ready to help you with questions about Islam.\n\nTry asking about prayer, dua, Quran, hadith, or any other Islamic topic!",
    'ar': "مرحباً! السلام عليكم! 👋😊\n\nأهلاً بك في المساعد الإسلامي. أنا مستعد لمساعدتك.\n\nحاول السؤال عن الصلاة والدعاء والقرآن والحديث!",
  },
];

const List<Map<String, String>> howAreYouResponses = [
  {
    'id': "Alhamdulillah, baik! 😊\n\nTerima kasih sudah bertanya. Semoga Anda juga selalu sehat dan dalam kebaikan.\n\nAda yang bisa saya bantu hari ini? Silakan tanyakan apa saja seputar Islam! 🌟",
    'en': "Alhamdulillah, I'm doing well! 😊\n\nThank you for asking. May you also always be in good health and well-being.\n\nIs there anything I can help you with today? Feel free to ask anything about Islam! 🌟",
    'ar': "الحمد لله بخير! 😊\n\nشكراً لسؤالك. أسأل الله أن تكون بأفضل حال.\n\nهل هناك شيء يمكنني مساعدتك به اليوم؟ 🌟",
  },
];

// ─── MAIN KNOWLEDGE DATABASE ─────────────────────────────────────────────────
const List<IslamicKnowledge> islamicKnowledgeDB = [
  // ═══════════════════════════════════════════════════════════════════════════
  // SHOLAT
  // ═══════════════════════════════════════════════════════════════════════════
  IslamicKnowledge(
    id: 'sholat_wajib',
    keywords: ['sholat', 'salat', 'shalat', 'prayer', 'solat', 'waktu sholat', 'sholat wajib', 'sholat 5 waktu', 'five prayers', 'الصلاة'],
    category: 'Sholat',
    responses: {
      'id': "🕌 **Sholat 5 Waktu (Wajib)**\n\nSholat adalah tiang agama Islam dan merupakan kewajiban setiap muslim yang baligh dan berakal. Lima waktu sholat wajib:\n\n1. **Subuh** (2 rakaat) — Waktu fajar hingga terbit matahari\n2. **Dzuhur** (4 rakaat) — Setelah matahari tergelincir\n3. **Ashar** (4 rakaat) — Sore hari\n4. **Maghrib** (3 rakaat) — Setelah matahari terbenam\n5. **Isya** (4 rakaat) — Malam hari\n\n📖 Dalil: \"Sesungguhnya sholat itu adalah kewajiban yang ditentukan waktunya atas orang-orang yang beriman.\" (QS. An-Nisa: 103)\n\n💡 **Tips:** Gunakan fitur Jadwal Sholat di aplikasi ini untuk mengetahui waktu sholat yang tepat di lokasi Anda!",
      'en': "🕌 **The 5 Daily Prayers**\n\nPrayer (Salah) is the pillar of Islam and obligatory for every sane adult Muslim. The five daily prayers:\n\n1. **Fajr** (2 rak'ah) — Dawn until sunrise\n2. **Dhuhr** (4 rak'ah) — After the sun passes its zenith\n3. **Asr** (4 rak'ah) — Afternoon\n4. **Maghrib** (3 rak'ah) — After sunset\n5. **Isha** (4 rak'ah) — Night\n\n📖 Evidence: \"Indeed, prayer has been decreed upon the believers a decree of specified times.\" (QS. An-Nisa: 103)\n\n💡 **Tip:** Use the Prayer Schedule feature in this app to know the exact prayer times at your location!",
      'ar': "🕌 **الصلوات الخمس المفروضة**\n\nالصلاة عماد الدين وهي فريضة على كل مسلم بالغ عاقل:\n\n1. **الفجر** (ركعتان)\n2. **الظهر** (4 ركعات)\n3. **العصر** (4 ركعات)\n4. **المغرب** (3 ركعات)\n5. **العشاء** (4 ركعات)\n\n📖 قال تعالى: \"إِنَّ الصَّلَاةَ كَانَتْ عَلَى الْمُؤْمِنِينَ كِتَابًا مَّوْقُوتًا\" (النساء: 103)",
    },
  ),
  IslamicKnowledge(
    id: 'sholat_sunnah',
    keywords: ['sholat sunnah', 'sunnah prayer', 'rawatib', 'tahajud', 'tahajjud', 'dhuha', 'witir', 'sholat malam'],
    category: 'Sholat',
    responses: {
      'id': "🌙 **Sholat Sunnah (Rawatib & Lainnya)**\n\n**Sholat Rawatib (pengiring sholat wajib):**\n• 2 rakaat sebelum Subuh\n• 4 rakaat sebelum Dzuhur + 2 setelahnya\n• 2 rakaat setelah Maghrib\n• 2 rakaat setelah Isya\n\n**Sholat Sunnah Lainnya:**\n• 🌅 **Dhuha** — 2-12 rakaat, pagi (setelah terbit – sebelum dzuhur)\n• 🌙 **Tahajud** — Sepertiga malam terakhir, minimal 2 rakaat\n• 🌙 **Witir** — 1, 3, 5, 7, atau 11 rakaat setelah Isya\n• 📿 **Istikharah** — 2 rakaat + doa khusus untuk meminta petunjuk\n• 🤲 **Hajat** — 2-12 rakaat untuk memohon kebutuhan\n\n📖 Rasulullah SAW bersabda: \"Sholat sunnah yang paling utama adalah sholat seseorang di rumahnya, kecuali sholat wajib.\" (HR. Bukhari & Muslim)",
      'en': "🌙 **Sunnah Prayers**\n\n**Rawatib (accompanying obligatory prayers):**\n• 2 rak'ah before Fajr\n• 4 before Dhuhr + 2 after\n• 2 after Maghrib\n• 2 after Isha\n\n**Other Sunnah Prayers:**\n• 🌅 **Dhuha** — 2-12 rak'ah, morning time\n• 🌙 **Tahajjud** — Last third of the night\n• 🌙 **Witr** — 1, 3, 5, 7, or 11 rak'ah after Isha\n• 📿 **Istikharah** — 2 rak'ah + special dua for guidance\n• 🤲 **Hajat** — 2-12 rak'ah for needs",
      'ar': "🌙 **صلوات النوافل والسنن الرواتب**\n\nالسنن الرواتب:\n• ركعتان قبل الفجر\n• 4 قبل الظهر + 2 بعده\n• ركعتان بعد المغرب\n• ركعتان بعد العشاء\n\nنوافل أخرى:\n• صلاة الضحى\n• صلاة التهجد\n• صلاة الوتر\n• صلاة الاستخارة",
    },
  ),
  IslamicKnowledge(
    id: 'wudhu',
    keywords: ['wudhu', 'wudu', 'ablution', 'الوضوء', 'cara wudhu', 'tata cara wudhu', 'syarat wudhu'],
    category: 'Sholat',
    responses: {
      'id': "💧 **Tata Cara Wudhu**\n\nWudhu adalah syarat sah sholat. Berikut langkahnya:\n\n1. **Niat** dalam hati\n2. **Membaca Bismillah**\n3. **Mencuci kedua telapak tangan** 3x\n4. **Berkumur** 3x\n5. **Menghirup air ke hidung** (istinsyaq) 3x\n6. **Mencuci muka** 3x\n7. **Mencuci kedua tangan sampai siku** 3x\n8. **Mengusap kepala** 1x\n9. **Mengusap kedua telinga** 1x\n10. **Mencuci kedua kaki sampai mata kaki** 3x\n11. **Membaca doa sesudah wudhu**\n\n**Yang membatalkan wudhu:**\n• Keluarnya sesuatu dari qubul/dubur\n• Hilang akal (tidur, pingsan, mabuk)\n• Menyentuh kemaluan tanpa penghalang\n\n📖 \"Hai orang-orang yang beriman, apabila kamu hendak mengerjakan sholat, maka basuhlah mukamu...\" (QS. Al-Maidah: 6)",
      'en': "💧 **How to Perform Wudu (Ablution)**\n\nWudu is a prerequisite for prayer. Steps:\n\n1. Make **intention** (niyyah)\n2. Say **Bismillah**\n3. **Wash hands** 3 times\n4. **Rinse mouth** 3 times\n5. **Sniff water into nostrils** 3 times\n6. **Wash face** 3 times\n7. **Wash arms to elbows** 3 times\n8. **Wipe head** once\n9. **Wipe ears** once\n10. **Wash feet to ankles** 3 times\n11. **Recite dua after wudu**",
      'ar': "💧 **كيفية الوضوء**\n\n1. النية\n2. البسملة\n3. غسل الكفين 3 مرات\n4. المضمضة 3 مرات\n5. الاستنشاق 3 مرات\n6. غسل الوجه 3 مرات\n7. غسل اليدين إلى المرفقين 3 مرات\n8. مسح الرأس مرة\n9. مسح الأذنين مرة\n10. غسل القدمين إلى الكعبين 3 مرات",
    },
  ),

  // ═══════════════════════════════════════════════════════════════════════════
  // QURAN
  // ═══════════════════════════════════════════════════════════════════════════
  IslamicKnowledge(
    id: 'quran_info',
    keywords: ['quran', 'alquran', 'al-quran', 'mushaf', 'القرآن', 'surah', 'surat', 'al quran', 'kitab'],
    category: 'Quran',
    responses: {
      'id': "📖 **Al-Quran Al-Karim**\n\nAl-Quran adalah kitab suci umat Islam yang diturunkan kepada Nabi Muhammad SAW melalui malaikat Jibril.\n\n📊 **Fakta Al-Quran:**\n• 114 Surah (86 Makkiyah, 28 Madaniyah)\n• 6.236 Ayat\n• 30 Juz\n• Diturunkan selama 23 tahun\n• Surah terpanjang: Al-Baqarah (286 ayat)\n• Surah terpendek: Al-Kautsar (3 ayat)\n\n🌟 **Keutamaan Membaca Al-Quran:**\n\"Sebaik-baik kalian adalah orang yang belajar Al-Quran dan mengajarkannya.\" (HR. Bukhari)\n\n\"Bacalah Al-Quran, karena ia akan datang pada Hari Kiamat sebagai pemberi syafaat bagi pembacanya.\" (HR. Muslim)\n\n💡 **Tips:** Gunakan fitur Al-Quran di aplikasi ini untuk membaca, mendengar, dan memahami firman Allah!",
      'en': "📖 **The Holy Quran**\n\nThe Quran is the holy book of Islam, revealed to Prophet Muhammad (PBUH) through Angel Gabriel.\n\n📊 **Quran Facts:**\n• 114 Surahs (86 Meccan, 28 Medinan)\n• 6,236 Verses\n• 30 Juz (Parts)\n• Revealed over 23 years\n• Longest Surah: Al-Baqarah (286 verses)\n• Shortest Surah: Al-Kawthar (3 verses)\n\n🌟 **Virtues of Reading:**\n\"The best amongst you is the one who learns the Quran and teaches it.\" (Bukhari)",
      'ar': "📖 **القرآن الكريم**\n\nالقرآن الكريم كتاب الله المنزل على نبيه محمد صلى الله عليه وسلم.\n\n📊 **حقائق:\n• 114 سورة\n• 6236 آية\n• 30 جزءاً",
    },
  ),
  IslamicKnowledge(
    id: 'ayat_kursi',
    keywords: ['ayat kursi', 'verses of the throne', 'آية الكرسي', 'al baqarah 255'],
    category: 'Quran',
    responses: {
      'id': "✨ **Ayat Kursi (QS. Al-Baqarah: 255)**\n\n🕋 Arab:\nاللَّهُ لَا إِلَٰهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ ۚ لَا تَأْخُذُهُ سِنَةٌ وَلَا نَوْمٌ ۚ لَهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الْأَرْضِ ۗ مَنْ ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلَّا بِإِذْنِهِ ۚ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ ۖ وَلَا يُحِيطُونَ بِشَيْءٍ مِنْ عِلْمِهِ إِلَّا بِمَا شَاءَ ۚ وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالْأَرْضَ ۖ وَلَا يَئُودُهُ حِفْظُهُمَا ۚ وَهُوَ الْعَلِيُّ الْعَظِيمُ\n\n📝 Terjemahan:\n\"Allah, tidak ada Tuhan selain Dia Yang Maha Hidup kekal lagi terus menerus mengurus makhluk-Nya...\"\n\n🌟 **Keutamaan:**\n• Dibacakan setiap setelah sholat wajib\n• Perlindungan dari gangguan setan\n• Ayat termulia dalam Al-Quran\n• Pembacanya dijaga Allah sampai pagi/sore",
      'en': "✨ **Ayat al-Kursi (QS. Al-Baqarah: 255)**\n\nThe Verse of the Throne — one of the most powerful verses in the Quran.\n\n🌟 **Virtues:**\n• Recited after every obligatory prayer\n• Protection from Satan\n• The greatest verse in the Quran\n• Its reciter is protected until morning/evening",
      'ar': "✨ **آية الكرسي**\n\nاللَّهُ لَا إِلَٰهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ...\n\nأعظم آية في القرآن الكريم.",
    },
  ),

  // ═══════════════════════════════════════════════════════════════════════════
  // HADITS
  // ═══════════════════════════════════════════════════════════════════════════
  IslamicKnowledge(
    id: 'hadits_info',
    keywords: ['hadits', 'hadist', 'hadith', 'sunnah', 'الحديث', 'السنة', 'hadis'],
    category: 'Hadits',
    responses: {
      'id': "📜 **Tentang Hadits**\n\nHadits adalah segala yang disandarkan kepada Nabi Muhammad SAW, baik berupa perkataan, perbuatan, maupun ketetapan beliau.\n\n📚 **Kitab Hadits Utama (Kutub as-Sittah):**\n1. Shahih Bukhari — Imam Bukhari\n2. Shahih Muslim — Imam Muslim\n3. Sunan Abu Dawud — Abu Dawud\n4. Sunan at-Tirmidzi — at-Tirmidzi\n5. Sunan an-Nasai — an-Nasai\n6. Sunan Ibnu Majah — Ibnu Majah\n\n📊 **Tingkatan Hadits:**\n• **Shahih** — Paling kuat dan valid\n• **Hasan** — Baik/cukup kuat\n• **Dhaif** — Lemah\n• **Maudhu'** — Palsu (tidak boleh diamalkan)\n\n💡 **Tips:** Cek fitur Hadits Harian di aplikasi ini untuk mendapat inspirasi hadits setiap hari!",
      'en': "📜 **About Hadith**\n\nHadith is everything attributed to Prophet Muhammad (PBUH), including his sayings, actions, and approvals.\n\n📚 **The Six Major Collections:**\n1. Sahih Bukhari\n2. Sahih Muslim\n3. Sunan Abu Dawud\n4. Sunan at-Tirmidhi\n5. Sunan an-Nasai\n6. Sunan Ibn Majah",
      'ar': "📜 **الحديث النبوي**\n\nالحديث هو كل ما أُضيف إلى النبي محمد ﷺ من قول أو فعل أو تقرير.\n\nالكتب الستة:\n1. صحيح البخاري\n2. صحيح مسلم\n3. سنن أبي داود\n4. سنن الترمذي\n5. سنن النسائي\n6. سنن ابن ماجه",
    },
  ),

  // ═══════════════════════════════════════════════════════════════════════════
  // DOA
  // ═══════════════════════════════════════════════════════════════════════════
  IslamicKnowledge(
    id: 'doa_harian',
    keywords: ['doa', 'dua', 'الدعاء', 'berdoa', 'doa harian', 'daily dua', 'doa sehari'],
    category: 'Doa',
    responses: {
      'id': "🤲 **Doa-Doa Harian Penting**\n\n**☀️ Doa Bangun Tidur:**\nالْحَمْدُ لِلّٰهِ الَّذِيْ أَحْيَانَا بَعْدَ مَا أَمَاتَنَا وَإِلَيْهِ النُّشُوْرُ\n\"Segala puji bagi Allah yang menghidupkan kami setelah mematikan kami, dan kepada-Nya lah kami dibangkitkan.\"\n\n**🍽️ Doa Sebelum Makan:**\nاَللّٰهُمَّ بَارِكْ لَنَا فِيْمَا رَزَقْتَنَا وَقِنَا عَذَابَ النَّارِ\n\"Ya Allah, berkahilah kami dalam rezeki yang Engkau berikan dan peliharalah kami dari api neraka.\"\n\n**🚐 Doa Keluar Rumah:**\nبِسْمِ اللّٰهِ تَوَكَّلْتُ عَلَى اللّٰهِ لاَ حَوْلَ وَلاَ قُوَّةَ إِلاَّ بِاللّٰهِ\n\"Dengan nama Allah, aku bertawakal kepada Allah. Tiada daya dan kekuatan kecuali dengan pertolongan Allah.\"\n\n💡 **Tips:** Jelajahi fitur Doa Harian di aplikasi untuk koleksi doa yang lengkap!",
      'en': "🤲 **Important Daily Duas**\n\n**☀️ Upon Waking Up:**\nAlhamdulillahil-ladhi ahyana ba'da ma amatana wa ilayhin-nushur\n\n**🍽️ Before Eating:**\nAllahumma barik lana fima razaqtana wa qina 'adhaban-nar\n\n**🚐 Leaving Home:**\nBismillahi tawakkaltu 'alallahi la hawla wa la quwwata illa billah",
      'ar': "🤲 **أدعية يومية مهمة**\n\nدعاء الاستيقاظ - دعاء الطعام - دعاء الخروج من المنزل",
    },
  ),

  // ═══════════════════════════════════════════════════════════════════════════
  // PUASA
  // ═══════════════════════════════════════════════════════════════════════════
  IslamicKnowledge(
    id: 'puasa',
    keywords: ['puasa', 'ramadan', 'ramadhan', 'fasting', 'shaum', 'صوم', 'الصيام', 'sahur', 'buka puasa', 'iftar'],
    category: 'Puasa',
    responses: {
      'id': "🌙 **Puasa dalam Islam**\n\nPuasa Ramadhan adalah salah satu rukun Islam yang keempat, wajib bagi setiap muslim yang baligh, berakal, dan mampu.\n\n📋 **Syarat Wajib Puasa:**\n• Muslim\n• Baligh (dewasa)\n• Berakal sehat\n• Mampu berpuasa\n\n⏰ **Waktu Puasa:**\n• **Sahur** — Sebelum Imsak (waktu subuh)\n• **Berbuka** — Saat Maghrib (terbenam matahari)\n\n❌ **Yang Membatalkan Puasa:**\n• Makan dan minum sengaja\n• Muntah dengan sengaja\n• Hubungan suami-istri\n• Haid dan nifas\n\n🌟 **Puasa Sunnah:**\n• Senin-Kamis\n• Ayyamul Bidh (13, 14, 15 setiap bulan Hijriyah)\n• Puasa Asyura (10 Muharram)\n• Puasa Arafah (9 Dzulhijjah)\n• Puasa 6 hari di bulan Syawal\n\n📖 \"Hai orang-orang yang beriman, diwajibkan atas kamu berpuasa sebagaimana diwajibkan atas orang-orang sebelum kamu agar kamu bertakwa.\" (QS. Al-Baqarah: 183)",
      'en': "🌙 **Fasting in Islam**\n\nRamadan fasting is the fourth pillar of Islam.\n\n⏰ **Timing:** From Suhoor (pre-dawn) to Iftar (sunset)\n\n🌟 **Voluntary Fasts:** Monday-Thursday, Ayyamul Bidh, Ashura, Arafah, 6 days of Shawwal\n\n📖 \"O you who believe, fasting is prescribed for you as it was prescribed for those before you, that you may become righteous.\" (QS. Al-Baqarah: 183)",
      'ar': "🌙 **الصيام في الإسلام**\n\nصيام رمضان ركن من أركان الإسلام الخمسة.\n\n📖 \"يَا أَيُّهَا الَّذِينَ آمَنُوا كُتِبَ عَلَيْكُمُ الصِّيَامُ\" (البقرة: 183)",
    },
  ),

  // ═══════════════════════════════════════════════════════════════════════════
  // ZAKAT
  // ═══════════════════════════════════════════════════════════════════════════
  IslamicKnowledge(
    id: 'zakat',
    keywords: ['zakat', 'الزكاة', 'zakat fitrah', 'zakat maal', 'zakat mal', 'infaq', 'sedekah'],
    category: 'Zakat',
    responses: {
      'id': "💰 **Zakat dalam Islam**\n\nZakat adalah rukun Islam ketiga, kewajiban mengeluarkan sebagian harta bagi yang mampu.\n\n📋 **Jenis Zakat:**\n\n**1. Zakat Fitrah:**\n• Wajib setiap Ramadhan\n• Sebesar 2,5 kg beras / makanan pokok\n• Dibayar sebelum sholat Ied\n• Wajib bagi setiap jiwa muslim\n\n**2. Zakat Maal (Harta):**\n• **Nisab:** Setara 85 gram emas\n• **Kadar:** 2,5% dari total harta\n• **Haul:** Sudah dimiliki selama 1 tahun\n• Meliputi: emas, perak, perdagangan, pertanian, peternakan, dll.\n\n**Mustahik (Penerima Zakat):**\n1. Fakir\n2. Miskin\n3. Amil (pengelola zakat)\n4. Muallaf\n5. Riqab (memerdekakan budak)\n6. Gharimin (yang berhutang)\n7. Fi Sabilillah\n8. Ibnu Sabil (musafir)\n\n📖 \"Dan dirikanlah sholat, tunaikanlah zakat...\" (QS. Al-Baqarah: 43)",
      'en': "💰 **Zakat in Islam**\n\nZakat is the third pillar of Islam — obligatory charity.\n\n**Types:** Zakat al-Fitr (Ramadan) & Zakat al-Maal (Wealth: 2.5% above nisab)\n\n**8 Categories of Recipients:** Poor, Needy, Zakat collectors, New Muslims, Freeing captives, Debtors, In Allah's cause, Travelers.",
      'ar': "💰 **الزكاة في الإسلام**\n\nالزكاة ركن من أركان الإسلام. \n• زكاة الفطر\n• زكاة المال (2.5% من النصاب)",
    },
  ),

  // ═══════════════════════════════════════════════════════════════════════════
  // HAJI & UMRAH
  // ═══════════════════════════════════════════════════════════════════════════
  IslamicKnowledge(
    id: 'haji',
    keywords: ['haji', 'hajj', 'umrah', 'umroh', 'الحج', 'العمرة', 'makkah', 'mekkah', 'kabah', 'ka\'bah', 'mekah'],
    category: 'Haji',
    responses: {
      'id': "🕋 **Haji & Umrah**\n\nHaji adalah rukun Islam kelima, wajib bagi muslim yang mampu, minimal sekali seumur hidup.\n\n📋 **Rukun Haji:**\n1. **Ihram** — Niat masuk ke dalam ibadah haji\n2. **Wukuf di Arafah** — 9 Dzulhijjah (inti haji)\n3. **Thawaf Ifadhah** — Mengelilingi Ka'bah 7 kali\n4. **Sa'i** — Berjalan antara Shafa & Marwah 7 kali\n5. **Tahallul** — Memotong/mencukur rambut\n6. **Tertib** — Melaksanakan sesuai urutan\n\n🕌 **Jenis Haji:**\n• **Ifrad** — Haji saja\n• **Tamattu'** — Umrah lalu Haji\n• **Qiran** — Haji & Umrah bersamaan\n\n📖 \"Dan laksanakanlah ibadah haji dan umrah karena Allah.\" (QS. Al-Baqarah: 196)",
      'en': "🕋 **Hajj & Umrah**\n\nHajj is the fifth pillar of Islam, obligatory once in a lifetime for those who are able.\n\n**Pillars of Hajj:** Ihram, Standing at Arafah, Tawaf, Sa'i, Tahallul, Order",
      'ar': "🕋 **الحج والعمرة**\n\nالحج الركن الخامس من أركان الإسلام.\n\nأركان الحج: الإحرام، الوقوف بعرفة، طواف الإفاضة، السعي، التحلل، الترتيب",
    },
  ),

  // ═══════════════════════════════════════════════════════════════════════════
  // KISAH NABI
  // ═══════════════════════════════════════════════════════════════════════════
  IslamicKnowledge(
    id: 'kisah_nabi',
    keywords: ['nabi', 'rasul', 'prophet', 'nabi muhammad', 'muhammad', 'kisah nabi', 'nabi adam', 'nabi ibrahim', 'nabi musa', 'nabi isa'],
    category: 'Kisah Nabi',
    responses: {
      'id': "📖 **25 Nabi dan Rasul dalam Islam**\n\nAllah mengutus para nabi dan rasul untuk membimbing manusia ke jalan yang benar.\n\n🌟 **25 Nabi & Rasul:**\n1. Adam AS — Manusia & Nabi pertama\n2. Idris AS — Diangkat ke langit\n3. Nuh AS — Bahtera besar (Ulul Azmi)\n4. Hud AS — Kaum 'Ad\n5. Shaleh AS — Kaum Tsamud\n6. Ibrahim AS — Bapak para nabi (Ulul Azmi)\n7. Luth AS — Kaum Sodom\n8. Ismail AS — Dibangun Ka'bah\n9. Ishaq AS — Putra Ibrahim\n10. Ya'qub AS — Israel\n11. Yusuf AS — Kisah terindah\n12. Ayyub AS — Kesabaran\n13. Syu'aib AS — Kaum Madyan\n14. Musa AS — Bani Israel (Ulul Azmi)\n15. Harun AS — Saudara Musa\n16. Dzulkifli AS\n17. Dawud AS — Kitab Zabur\n18. Sulaiman AS — Kerajaan besar\n19. Ilyas AS\n20. Ilyasa' AS\n21. Yunus AS — Ditelan ikan paus\n22. Zakaria AS\n23. Yahya AS\n24. Isa AS — Lahir tanpa ayah (Ulul Azmi)\n25. Muhammad SAW — Nabi terakhir (Ulul Azmi)\n\n🌟 **Ulul Azmi** (5 nabi dengan keteguhan luar biasa): Nuh, Ibrahim, Musa, Isa, dan Muhammad SAW.",
      'en': "📖 **25 Prophets in Islam**\n\nAllah sent prophets to guide humanity. There are 25 prophets mentioned in the Quran.\n\n🌟 **Ulul Azmi** (5 Greatest): Nuh, Ibrahim, Musa, Isa, and Muhammad (PBUH).",
      'ar': "📖 **الأنبياء والرسل**\n\nأرسل الله 25 نبياً ورسولاً ذُكروا في القرآن.\n\nأولو العزم: نوح وإبراهيم وموسى وعيسى ومحمد عليهم السلام.",
    },
  ),

  // ═══════════════════════════════════════════════════════════════════════════
  // MOTIVASI ISLAMI
  // ═══════════════════════════════════════════════════════════════════════════
  IslamicKnowledge(
    id: 'motivasi',
    keywords: ['motivasi', 'motivation', 'semangat', 'sedih', 'galau', 'depresi', 'stress', 'gelisah', 'takut', 'cemas', 'putus asa', 'sad', 'depressed'],
    category: 'Motivasi',
    responses: {
      'id': "💪 **Motivasi Islami Untukmu**\n\n🌟 Jangan pernah putus asa dari rahmat Allah!\n\n📖 **Ayat Penyemangat:**\n\n\"Sesungguhnya sesudah kesulitan itu ada kemudahan. Sesungguhnya sesudah kesulitan itu ada kemudahan.\" (QS. Ash-Sharh: 5-6)\n\n\"Janganlah kamu bersikap lemah, dan janganlah kamu bersedih hati, padahal kamulah orang-orang yang paling tinggi derajatnya, jika kamu orang-orang yang beriman.\" (QS. Ali Imran: 139)\n\n\"Allah tidak membebani seseorang melainkan sesuai dengan kesanggupannya.\" (QS. Al-Baqarah: 286)\n\n🤲 **Doa Saat Gelisah:**\nحَسْبُنَا اللّٰهُ وَنِعْمَ الْوَكِيْلُ\n\"Cukuplah Allah menjadi penolong kami dan Allah adalah sebaik-baik pelindung.\"\n\n💡 **Ingat:**\n• Setiap ujian ada hikmahnya\n• Allah selalu bersama orang yang sabar\n• Setelah hujan pasti ada pelangi\n• Doamu tidak pernah sia-sia\n• Kamu lebih kuat dari yang kamu kira 🌈",
      'en': "💪 **Islamic Motivation**\n\n\"Verily, with hardship comes ease.\" (QS. 94:5-6)\n\n\"Do not lose hope, nor be sad.\" (QS. 3:139)\n\n\"Allah does not burden a soul beyond that it can bear.\" (QS. 2:286)\n\nRemember: Every trial has wisdom. Allah is always with the patient. 🌈",
      'ar': "💪 **تحفيز إسلامي**\n\n\"إِنَّ مَعَ الْعُسْرِ يُسْرًا\" (الشرح: 5-6)\n\n\"وَلَا تَهِنُوا وَلَا تَحْزَنُوا\" (آل عمران: 139)",
    },
  ),

  // ═══════════════════════════════════════════════════════════════════════════
  // KIBLAT
  // ═══════════════════════════════════════════════════════════════════════════
  IslamicKnowledge(
    id: 'kiblat',
    keywords: ['kiblat', 'qibla', 'القبلة', 'arah kiblat', 'qibla direction', 'kabah', 'compass'],
    category: 'Kiblat',
    responses: {
      'id': "🧭 **Arah Kiblat**\n\nKiblat adalah arah menuju Ka'bah di Masjidil Haram, Makkah Al-Mukarramah. Menghadap kiblat adalah syarat sah sholat.\n\n📖 \"Sungguh Kami (sering) melihat mukamu menengadah ke langit, maka sungguh Kami akan memalingkan kamu ke kiblat yang kamu sukai. Palingkanlah mukamu ke arah Masjidil Haram.\" (QS. Al-Baqarah: 144)\n\n🕌 **Sejarah Kiblat:**\n• Awalnya kiblat ke Baitul Maqdis (Yerusalem)\n• Dipindahkan ke Ka'bah pada 2 H (sekitar 624 M)\n\n💡 **Tips:** Gunakan fitur Kompas Kiblat di aplikasi ini untuk menemukan arah kiblat yang tepat dari lokasi Anda!",
      'en': "🧭 **Qibla Direction**\n\nQibla is the direction towards the Kaaba in Masjid al-Haram, Makkah. Facing the Qibla is a requirement for valid prayer.\n\n💡 **Tip:** Use the Qibla Compass feature in this app!",
      'ar': "🧭 **القبلة**\n\nالقبلة هي الاتجاه نحو الكعبة المشرفة في المسجد الحرام.\n\n💡 استخدم ميزة بوصلة القبلة في التطبيق!",
    },
  ),

  // ═══════════════════════════════════════════════════════════════════════════
  // DZIKIR & TASBIH
  // ═══════════════════════════════════════════════════════════════════════════
  IslamicKnowledge(
    id: 'dzikir',
    keywords: ['dzikir', 'zikir', 'tasbih', 'tahmid', 'takbir', 'tahlil', 'istighfar', 'dhikr', 'الذكر', 'التسبيح'],
    category: 'Dzikir',
    responses: {
      'id': "📿 **Dzikir dan Tasbih**\n\nDzikir adalah mengingat Allah dengan menyebut nama-Nya dan memuji-Nya.\n\n🌟 **Dzikir Utama:**\n\n**1. Tasbih:**\nسُبْحَانَ اللّٰهِ\n\"Maha Suci Allah\" (33x setelah sholat)\n\n**2. Tahmid:**\nاَلْحَمْدُ لِلّٰهِ\n\"Segala puji bagi Allah\" (33x setelah sholat)\n\n**3. Takbir:**\nاَللّٰهُ أَكْبَرُ\n\"Allah Maha Besar\" (33x setelah sholat)\n\n**4. Tahlil:**\nلَا إِلٰهَ إِلَّا اللّٰهُ\n\"Tiada tuhan selain Allah\"\n\n**5. Istighfar:**\nأَسْتَغْفِرُ اللّٰهَ\n\"Aku memohon ampun kepada Allah\" (100x/hari disunnahkan)\n\n**6. Hauqalah:**\nلاَ حَوْلَ وَلاَ قُوَّةَ إِلاَّ بِاللّٰهِ\n\"Tiada daya dan kekuatan kecuali milik Allah\"\n\n📖 Rasulullah SAW bersabda:\n\"Dua kalimat yang ringan di lidah, berat di timbangan: Subhanallahi wa bihamdihi, Subhanallahil 'Azhim.\" (HR. Bukhari & Muslim)\n\n💡 Gunakan fitur Tasbih Digital di aplikasi ini!",
      'en': "📿 **Dhikr and Tasbih**\n\nDhikr is remembrance of Allah.\n\nMain types: Tasbih (SubhanAllah), Tahmid (Alhamdulillah), Takbir (Allahu Akbar), Tahlil (La ilaha illallah), Istighfar (Astaghfirullah).\n\n💡 Use the Digital Tasbih feature in this app!",
      'ar': "📿 **الذكر والتسبيح**\n\nسبحان الله (33) - الحمد لله (33) - الله أكبر (33)\n\nاستغفر الله (100 مرة يومياً)",
    },
  ),

  // ═══════════════════════════════════════════════════════════════════════════
  // ADAB & AKHLAK
  // ═══════════════════════════════════════════════════════════════════════════
  IslamicKnowledge(
    id: 'adab',
    keywords: ['adab', 'akhlak', 'etika', 'sopan', 'islam mengajarkan', 'manners', 'character', 'adab islam', 'adab sehari-hari'],
    category: 'Adab',
    responses: {
      'id': "🌿 **Adab & Akhlak dalam Islam**\n\nIslam sangat menekankan akhlak mulia dalam kehidupan sehari-hari.\n\n📋 **Adab Penting:**\n\n🤝 **Terhadap Sesama:**\n• Mengucapkan dan menjawab salam\n• Tersenyum (sedekah)\n• Menolong yang membutuhkan\n• Menjaga lisan dari ghibah\n• Menepati janji\n\n👨‍👩‍👧‍👦 **Terhadap Orang Tua:**\n• Berbakti dan berbuat baik\n• Tidak berkata \"ah\" atau kasar\n• Mendoakan mereka\n\n🍽️ **Adab Makan:**\n• Membaca doa sebelum & sesudah\n• Makan dengan tangan kanan\n• Tidak berlebihan\n\n🕌 **Adab Masjid:**\n• Membaca doa masuk & keluar\n• Sholat tahiyyatul masjid\n• Menjaga ketenangan\n\n📖 Rasulullah SAW bersabda:\n\"Sesungguhnya aku diutus untuk menyempurnakan akhlak yang mulia.\" (HR. Ahmad)",
      'en': "🌿 **Islamic Manners & Character**\n\nIslam places great emphasis on good character.\n\nKey manners: Greeting with salam, smiling, helping others, honoring parents, eating etiquette, mosque etiquette.\n\n\"I was sent to perfect good character.\" (Ahmad)",
      'ar': "🌿 **الأدب والأخلاق في الإسلام**\n\nالإسلام يحث على مكارم الأخلاق.\n\nقال ﷺ: \"إنما بُعثت لأتمم مكارم الأخلاق\" (أحمد)",
    },
  ),

  // ═══════════════════════════════════════════════════════════════════════════
  // RUKUN ISLAM & IMAN
  // ═══════════════════════════════════════════════════════════════════════════
  IslamicKnowledge(
    id: 'rukun_islam',
    keywords: ['rukun islam', 'pillars of islam', 'أركان الإسلام', 'lima rukun', 'five pillars'],
    category: 'Aqidah',
    responses: {
      'id': "🕌 **5 Rukun Islam**\n\nRukun Islam adalah pondasi utama ajaran Islam:\n\n1. **Syahadat** — Bersaksi bahwa tiada tuhan selain Allah dan Muhammad adalah utusan Allah\n   أَشْهَدُ أَنْ لَا إِلٰهَ إِلَّا اللّٰهُ وَأَشْهَدُ أَنَّ مُحَمَّدًا رَسُوْلُ اللّٰهِ\n\n2. **Sholat** — Mendirikan sholat 5 waktu\n\n3. **Zakat** — Menunaikan zakat\n\n4. **Puasa** — Berpuasa di bulan Ramadhan\n\n5. **Haji** — Menunaikan ibadah haji ke Baitullah (bagi yang mampu)\n\n📖 Sabda Rasulullah SAW:\n\"Islam dibangun di atas lima perkara...\" (HR. Bukhari & Muslim)",
      'en': "🕌 **5 Pillars of Islam**\n\n1. **Shahada** — Declaration of faith\n2. **Salah** — 5 daily prayers\n3. **Zakat** — Obligatory charity\n4. **Sawm** — Fasting in Ramadan\n5. **Hajj** — Pilgrimage to Makkah",
      'ar': "🕌 **أركان الإسلام الخمسة**\n\n1. الشهادتان\n2. إقامة الصلاة\n3. إيتاء الزكاة\n4. صوم رمضان\n5. حج البيت",
    },
  ),
  IslamicKnowledge(
    id: 'rukun_iman',
    keywords: ['rukun iman', 'iman', 'faith', 'pillars of faith', 'أركان الإيمان', 'enam rukun'],
    category: 'Aqidah',
    responses: {
      'id': "⭐ **6 Rukun Iman**\n\nRukun Iman adalah hal-hal yang wajib diyakini oleh setiap muslim:\n\n1. ☝️ **Iman kepada Allah** — Meyakini keesaan Allah\n2. 👼 **Iman kepada Malaikat** — Meyakini adanya malaikat (Jibril, Mikail, Israfil, Izrail, dll.)\n3. 📖 **Iman kepada Kitab-Kitab Allah** — Taurat, Zabur, Injil, Al-Quran\n4. 🕌 **Iman kepada Rasul-Rasul Allah** — 25 Nabi dan Rasul\n5. ⏳ **Iman kepada Hari Akhir** — Hari Kiamat, surga, dan neraka\n6. ✨ **Iman kepada Qada dan Qadar** — Takdir baik dan buruk\n\n📖 \"Rasul telah beriman kepada Al-Quran yang diturunkan kepadanya dari Tuhannya, demikian pula orang-orang yang beriman.\" (QS. Al-Baqarah: 285)",
      'en': "⭐ **6 Pillars of Faith (Iman)**\n\n1. Belief in Allah\n2. Belief in Angels\n3. Belief in Holy Books\n4. Belief in Prophets\n5. Belief in the Day of Judgment\n6. Belief in Qadr (Divine Decree)",
      'ar': "⭐ **أركان الإيمان الستة**\n\n1. الإيمان بالله\n2. الإيمان بالملائكة\n3. الإيمان بالكتب\n4. الإيمان بالرسل\n5. الإيمان باليوم الآخر\n6. الإيمان بالقدر",
    },
  ),

  // ═══════════════════════════════════════════════════════════════════════════
  // TAHLIL
  // ═══════════════════════════════════════════════════════════════════════════
  IslamicKnowledge(
    id: 'tahlil_info',
    keywords: ['tahlil', 'التهليل', 'yasin', 'yasinan', 'kematian', 'meninggal', 'arwah', 'almarhum'],
    category: 'Tahlil',
    responses: {
      'id': "📿 **Tahlil**\n\nTahlil adalah rangkaian bacaan dzikir, doa, dan ayat-ayat Al-Quran yang dihadiahkan pahalanya kepada orang yang telah meninggal dunia.\n\n📋 **Urutan Bacaan Tahlil:**\n1. Al-Fatihah\n2. Surat Al-Ikhlas (3x/11x)\n3. Surat Al-Falaq\n4. Surat An-Nas\n5. Al-Fatihah\n6. Awal Surat Al-Baqarah (1-5)\n7. Ayat Kursi\n8. Akhir Surat Al-Baqarah (284-286)\n9. Surat Al-Ahzab: 33, 56\n10. Shalawat Nabi\n11. Tahlil (Laa ilaaha illallah) 100x\n12. Doa penutup\n\n💡 **Tips:** Buka fitur Tahlil di aplikasi ini untuk panduan lengkap bacaan tahlil!",
      'en': "📿 **Tahlil**\n\nTahlil is a series of Quranic recitations and prayers, with rewards sent to the deceased.\n\n💡 **Tip:** Open the Tahlil feature in this app for the complete guide!",
      'ar': "📿 **التهليل**\n\nالتهليل مجموعة من الأذكار والأدعية يُهدى ثوابها للميت.",
    },
  ),

  // ═══════════════════════════════════════════════════════════════════════════
  // BELAJAR ISLAM PEMULA
  // ═══════════════════════════════════════════════════════════════════════════
  IslamicKnowledge(
    id: 'belajar_islam',
    keywords: ['belajar islam', 'pemula', 'mualaf', 'muallaf', 'baru masuk islam', 'new muslim', 'islam untuk pemula', 'dasar islam', 'learn islam', 'beginner'],
    category: 'Belajar Islam',
    responses: {
      'id': "📚 **Belajar Islam untuk Pemula**\n\nSelamat datang di jalan Islam! Berikut langkah-langkah memulai perjalanan Anda:\n\n**1. Pahami Dasar Aqidah:**\n• Syahadat (Kalimat persaksian)\n• 6 Rukun Iman\n• 5 Rukun Islam\n\n**2. Belajar Sholat:**\n• Tata cara wudhu\n• Gerakan dan bacaan sholat\n• Waktu sholat 5 waktu\n\n**3. Baca Al-Quran:**\n• Belajar huruf hijaiyah\n• Belajar tajwid dasar\n• Mulai dari surat pendek (Al-Fatihah, Al-Ikhlas, dll.)\n\n**4. Pelajari Doa Harian:**\n• Doa sebelum & sesudah makan\n• Doa masuk & keluar rumah\n• Doa sebelum tidur & bangun tidur\n\n**5. Pahami Akhlak Islam:**\n• Jujur dan amanah\n• Berbakti pada orang tua\n• Menjaga lisan\n\n💡 Gunakan semua fitur di aplikasi Muslim ID ini sebagai teman belajar Anda!\n\n🤲 Semoga Allah memudahkan perjalanan Anda. Aamiin! 🌟",
      'en': "📚 **Learning Islam for Beginners**\n\nSteps: 1. Learn Shahada & basics, 2. Learn to pray, 3. Read Quran, 4. Daily duas, 5. Islamic manners.\n\nUse the Muslim ID app features as your learning companion! 🌟",
      'ar': "📚 **تعلم الإسلام للمبتدئين**\n\n1. تعلم الشهادتين\n2. تعلم الصلاة\n3. قراءة القرآن\n4. الأدعية اليومية\n5. الأخلاق الإسلامية",
    },
  ),

  // ═══════════════════════════════════════════════════════════════════════════
  // JADWAL SHOLAT (APP FEATURE)
  // ═══════════════════════════════════════════════════════════════════════════
  IslamicKnowledge(
    id: 'jadwal_sholat_app',
    keywords: ['jadwal sholat', 'prayer schedule', 'prayer time', 'waktu subuh', 'waktu dzuhur', 'waktu ashar', 'waktu maghrib', 'waktu isya', 'kapan sholat'],
    category: 'App Feature',
    responses: {
      'id': "⏰ **Jadwal Sholat**\n\nAplikasi Muslim ID menyediakan jadwal sholat otomatis berdasarkan lokasi GPS Anda!\n\n📍 Fitur Jadwal Sholat:\n• Waktu sholat akurat sesuai lokasi\n• Countdown ke waktu sholat berikutnya\n• Notifikasi adzan otomatis\n• Pengingat sebelum waktu sholat\n• Mendukung berbagai metode perhitungan\n\n💡 **Cara menggunakan:**\n1. Buka halaman utama aplikasi\n2. Jadwal sholat tampil otomatis\n3. Aktifkan notifikasi di Pengaturan\n4. Izinkan akses lokasi GPS\n\n🕌 Pastikan GPS Anda aktif untuk mendapatkan jadwal yang akurat!",
      'en': "⏰ **Prayer Schedule**\n\nMuslim ID provides automatic prayer times based on your GPS location!\n\nFeatures: Accurate prayer times, countdown timer, adhan notification, pre-prayer reminders.\n\n💡 Make sure GPS is enabled for accurate times!",
      'ar': "⏰ **مواقيت الصلاة**\n\nيوفر التطبيق مواقيت صلاة دقيقة حسب موقعك!",
    },
  ),

  // ═══════════════════════════════════════════════════════════════════════════
  // AYAT HARIAN
  // ═══════════════════════════════════════════════════════════════════════════
  IslamicKnowledge(
    id: 'ayat_harian',
    keywords: ['ayat harian', 'daily verse', 'ayat hari ini', 'verse of the day', 'آية اليوم'],
    category: 'App Feature',
    responses: {
      'id': "🌟 **Ayat Hari Ini**\n\nFitur Ayat Harian di Muslim ID memberikan Anda inspirasi ayat Al-Quran yang berbeda setiap hari!\n\n📖 Fitur ini meliputi:\n• Ayat Al-Quran pilihan\n• Teks Arab dan terjemahan\n• Tafsir singkat\n• Refleksi motivasi\n• Berubah otomatis setiap hari\n\n💡 Buka halaman utama untuk melihat ayat hari ini!\n\n🤲 Semoga ayat hari ini memberikan hikmah dan semangat bagi Anda.",
      'en': "🌟 **Daily Verse**\n\nThe Daily Verse feature provides a different Quran verse every day with translation, tafsir, and reflection!\n\nCheck the home page to see today's verse!",
      'ar': "🌟 **آية اليوم**\n\nميزة آية اليوم تقدم آية مختلفة كل يوم مع التفسير والترجمة.",
    },
  ),

  // ═══════════════════════════════════════════════════════════════════════════
  // TERIMA KASIH / THANK YOU
  // ═══════════════════════════════════════════════════════════════════════════
  IslamicKnowledge(
    id: 'thank_you',
    keywords: ['terima kasih', 'makasih', 'thanks', 'thank you', 'شكرا', 'jazakallah', 'barakallah'],
    category: 'General',
    responses: {
      'id': "Sama-sama! Wa iyyakum 😊\n\nBarakallaahu fiikum! Semoga ilmunya bermanfaat dan menjadi amal jariyah.\n\nJangan ragu untuk bertanya lagi kapan saja. Saya selalu siap membantu! 🌟\n\n🤲 Semoga Allah memudahkan semua urusan Anda. Aamiin.",
      'en': "You're welcome! Wa iyyakum 😊\n\nBarakallahu feekum! May the knowledge benefit you.\n\nFeel free to ask again anytime! 🌟",
      'ar': "عفواً! وإياكم 😊\n\nبارك الله فيكم! لا تترددوا في السؤال مجدداً! 🌟",
    },
  ),

  // ═══════════════════════════════════════════════════════════════════════════
  // SHALAWAT
  // ═══════════════════════════════════════════════════════════════════════════
  IslamicKnowledge(
    id: 'shalawat',
    keywords: ['shalawat', 'sholawat', 'salawat', 'الصلاة على النبي', 'shalawat nabi'],
    category: 'Ibadah',
    responses: {
      'id': "🌹 **Shalawat Nabi**\n\nMembaca shalawat kepada Nabi Muhammad SAW adalah ibadah yang sangat dianjurkan.\n\n📿 **Shalawat Ibrahimiyah:**\nاَللّٰهُمَّ صَلِّ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ كَمَا صَلَّيْتَ عَلَى إِبْرَاهِيْمَ وَعَلَى آلِ إِبْرَاهِيْمَ إِنَّكَ حَمِيْدٌ مَجِيْدٌ\n\n🌟 **Keutamaan Shalawat:**\n• Satu shalawat = 10 rahmat dari Allah\n• Diangkat 10 derajat\n• Dihapus 10 keburukan\n• Nabi akan membalas shalawat kita\n• Doa dikabulkan jika diawali shalawat\n\n📖 \"Sesungguhnya Allah dan malaikat-Nya bershalawat untuk Nabi. Hai orang-orang yang beriman, bershalawatlah kamu untuk Nabi.\" (QS. Al-Ahzab: 56)\n\nPerbanyak shalawat terutama di hari Jumat! 🌹",
      'en': "🌹 **Salawat upon the Prophet**\n\nSending blessings upon Prophet Muhammad (PBUH) is highly recommended.\n\nOne salawat = 10 blessings from Allah, elevation of 10 degrees, and erasure of 10 sins.",
      'ar': "🌹 **الصلاة على النبي ﷺ**\n\nاللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ\n\nمن صلى علي صلاة واحدة صلى الله عليه بها عشراً",
    },
  ),
];

// ─── DAILY QUOTES / MOTIVATIONS ─────────────────────────────────────────────
const List<Map<String, String>> dailyIslamicQuotes = [
  {
    'id': "🌅 \"Sesungguhnya bersama kesulitan ada kemudahan.\" — QS. Ash-Sharh: 6\n\nHari ini, yakinlah bahwa setiap masalah yang kamu hadapi sudah datang sepaket dengan solusinya. Tetap semangat! 💪",
    'en': "🌅 \"Verily, with hardship comes ease.\" — QS. Ash-Sharh: 6\n\nToday, believe that every problem comes with its solution. Stay strong! 💪",
    'ar': "🌅 \"إِنَّ مَعَ الْعُسْرِ يُسْرًا\" — الشرح: 6",
  },
  {
    'id': "🌟 \"Barangsiapa bertawakal kepada Allah, maka Allah akan mencukupkan keperluannya.\" — QS. At-Talaq: 3\n\nSerahkan urusanmu kepada Allah setelah berusaha. Dia adalah sebaik-baik perencana. 🤲",
    'en': "🌟 \"Whoever puts their trust in Allah, He will be enough for them.\" — QS. At-Talaq: 3\n\nSurrender your affairs to Allah after making effort. He is the best planner. 🤲",
    'ar': "🌟 \"وَمَن يَتَوَكَّلْ عَلَى اللَّهِ فَهُوَ حَسْبُهُ\" — الطلاق: 3",
  },
  {
    'id': "💎 \"Senyummu di hadapan saudaramu adalah sedekah.\" — HR. Tirmidzi\n\nHari ini, tebarkan senyum dan kebaikan. Hal kecil bisa berdampak besar! 😊",
    'en': "💎 \"Your smile for your brother is charity.\" — Tirmidhi\n\nToday, spread smiles and kindness. Small things can make a big impact! 😊",
    'ar': "💎 \"تَبَسُّمُكَ فِي وَجْهِ أَخِيكَ لَكَ صَدَقَةٌ\" — الترمذي",
  },
  {
    'id': "🌙 \"Sebaik-baik manusia adalah yang paling bermanfaat bagi manusia lainnya.\" — HR. Ahmad\n\nJadilah orang yang bermanfaat hari ini, sekecil apapun kebaikan yang kamu lakukan. 🌿",
    'en': "🌙 \"The best of people are those most beneficial to others.\" — Ahmad\n\nBe beneficial today, no matter how small the good you do. 🌿",
    'ar': "🌙 \"خَيْرُ النَّاسِ أَنْفَعُهُمْ لِلنَّاسِ\" — أحمد",
  },
  {
    'id': "⭐ \"Dua kalimat yang ringan di lidah, berat di timbangan, dicintai Ar-Rahman: Subhanallahi wa bihamdihi, Subhanallahil 'Azhim.\" — HR. Bukhari & Muslim\n\nPerbanyak dzikir hari ini! 📿",
    'en': "⭐ \"Two words light on the tongue, heavy on the scales: SubhanAllahi wa bihamdihi, SubhanAllahil Azeem.\" — Bukhari & Muslim\n\nIncrease your dhikr today! 📿",
    'ar': "⭐ \"كَلِمَتَانِ خَفِيفَتَانِ عَلَى اللِّسَانِ ثَقِيلَتَانِ فِي الْمِيزَانِ\" — البخاري ومسلم",
  },
];

// ─── QUICK SUGGESTION QUESTIONS ─────────────────────────────────────────────
const Map<String, List<String>> quickSuggestions = {
  'id': [
    '🕌 Bagaimana cara sholat yang benar?',
    '📖 Ceritakan tentang Al-Quran',
    '🤲 Doa apa saja untuk harian?',
    '🌙 Apa saja puasa sunnah?',
    '💰 Jelaskan tentang zakat',
    '📿 Apa saja dzikir setelah sholat?',
    '💪 Berikan motivasi islami',
    '📚 Saya ingin belajar Islam',
  ],
  'en': [
    '🕌 How to pray correctly?',
    '📖 Tell me about the Quran',
    '🤲 What are daily duas?',
    '🌙 What are sunnah fasts?',
    '💰 Explain about Zakat',
    '📿 What dhikr after prayer?',
    '💪 Give Islamic motivation',
    '📚 I want to learn Islam',
  ],
  'ar': [
    '🕌 كيف أصلي بشكل صحيح؟',
    '📖 أخبرني عن القرآن',
    '🤲 ما هي أدعية اليوم؟',
    '🌙 ما هي صيام السنة؟',
    '💰 اشرح عن الزكاة',
    '📿 ما هو ذكر بعد الصلاة؟',
    '💪 أعطني دافعاً إسلامياً',
    '📚 أريد تعلم الإسلام',
  ],
};

// ─── FALLBACK RESPONSES ─────────────────────────────────────────────────────
const Map<String, List<String>> fallbackResponses = {
  'id': [
    "Jazakallahu khairan atas pertanyaannya! 🤲\n\nMeskipun saya belum menemukan jawaban spesifik untuk pertanyaan ini, saya sarankan untuk:\n\n1. 📖 Bertanya kepada ustadz/ulama terpercaya\n2. 🔍 Mencari referensi di kitab-kitab Islam\n3. 🕌 Berkonsultasi di majelis ilmu\n\nAnda juga bisa mencoba bertanya dengan kata kunci berbeda, seperti: sholat, doa, quran, hadits, puasa, zakat, haji, atau dzikir.\n\nSemoga Allah memberi pemahaman. Aamiin! 🌟",
    "Pertanyaan yang baik! 🌟\n\nSaat ini saya belum memiliki jawaban spesifik untuk topik ini. Cobalah bertanya tentang:\n• 🕌 Sholat & Ibadah\n• 📖 Al-Quran\n• 🤲 Doa-doa\n• 📜 Hadits\n• 🌙 Puasa\n• 💰 Zakat\n• 📿 Dzikir & Tasbih\n\nSaya akan terus belajar untuk memberikan jawaban yang lebih baik. Barakallahu fiik!",
    "Maasyaa Allah, pertanyaan yang menarik! 🌙\n\nUntuk pertanyaan yang lebih mendalam, saya sarankan berkonsultasi dengan ustadz atau ulama yang terpercaya.\n\nSementara itu, cobalah fitur lain di aplikasi:\n• 📖 Baca Al-Quran\n• 🤲 Kumpulan Doa\n• 📜 Hadits Harian\n• 🧭 Kompas Kiblat\n• 📿 Tasbih Digital\n\nSaya di sini untuk membantu! 😊",
  ],
  'en': [
    "JazakAllahu khairan for your question! 🤲\n\nI don't have a specific answer for this topic yet, but I suggest:\n\n1. Consult a trusted scholar\n2. Research Islamic references\n\nTry asking about: prayer, dua, Quran, hadith, fasting, zakat, hajj, or dhikr. 🌟",
    "Great question! 🌟\n\nI'm still learning about this topic. Try asking about prayer, Quran, duas, hadith, fasting, or zakat!\n\nBarakallahu feek!",
  ],
  'ar': [
    "جزاك الله خيراً على سؤالك! 🤲\n\nلم أجد إجابة محددة لهذا الموضوع. حاول السؤال عن: الصلاة، الدعاء، القرآن، الحديث، الصيام، أو الزكاة. 🌟",
  ],
};
