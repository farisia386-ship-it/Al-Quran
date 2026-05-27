import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui' as ui;

class LanguageProvider with ChangeNotifier {
  Locale _currentLocale = const Locale('en');
  
  Locale get currentLocale => _currentLocale;

  LanguageProvider() {
    _initLanguage();
  }

  Future<void> _initLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final String? savedLang = prefs.getString('language_code');
    
    if (savedLang != null) {
      _currentLocale = Locale(savedLang);
    } else {
      // Auto-detect device language
      String deviceLang = ui.window.locale.languageCode;
      if (translations.containsKey(deviceLang)) {
        _currentLocale = Locale(deviceLang);
      } else {
        _currentLocale = const Locale('en');
      }
    }
    notifyListeners();
  }

  void setLanguage(String langCode) async {
    _currentLocale = Locale(langCode);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', langCode);
    notifyListeners();
  }

  static const Map<String, Map<String, String>> translations = {
    'id': {
      'app_title': 'Muslim ID',
      'home': 'Beranda',
      'quran': 'Quran',
      'prayer': 'Sholat',
      'dua': 'Doa',
      'hadith': 'Hadis',
      'qibla': 'Kiblat',
      'ai_helper': 'AI Helper',
      'tasbih': 'Tasbih',
      'settings': 'Setelan',
      'last_read': 'Terakhir Dibaca',
      'ayah_no': 'Ayat No',
      'daily_verse': 'Ayat Hari Ini',
      'next_prayer': 'Sholat Berikutnya',
      'waiting_time': 'Menghitung waktu...',
      'prayer_time_active': 'Waktunya Sholat!',
      'location_active': 'Lokasi GPS Aktif',
      'location_searching': 'Mencari Lokasi...',
      'location_failed': 'Gagal mendapatkan lokasi',
      'language_settings': 'Bahasa',
      'notification_settings': 'Notifikasi',
      'about_app': 'Tentang Aplikasi',
      'adzan_settings': 'Pengaturan Adzan',
      'adzan_sound': 'Suara Adzan',
      'adzan_volume': 'Volume Adzan',
      'test_adzan': 'Tes Suara',
      'vibration': 'Getaran',
      'silent_mode': 'Mode Senyap',
      'pre_adhan_reminder': 'Pengingat Sebelum Adzan',
      'minutes': 'Menit',
      'save': 'Simpan',
      'cancel': 'Batal',
      'dark_mode': 'Mode Gelap',
      'select_muadzin': 'Pilih Muadzin',
      'search_surah': 'Cari Surah...',
      'zakat': 'Zakat',
      'asmaul_husna': 'Asmaul Husna',
      'prayer_guide': 'Panduan Sholat',
      'tahlil': 'Tahlil',
      'refresh': 'Segarkan',
      'arabic': 'Arab',
      'translation': 'Terjemahan',
      'copy': 'Salin',
      'share': 'Bagikan',
      'bookmark': 'Tandai',
    },
    'en': {
      'app_title': 'Muslim ID',
      'home': 'Home',
      'quran': 'Quran',
      'prayer': 'Prayer',
      'dua': 'Dua',
      'hadith': 'Hadith',
      'qibla': 'Qibla',
      'ai_helper': 'AI Helper',
      'tasbih': 'Tasbih',
      'settings': 'Settings',
      'last_read': 'Last Read',
      'ayah_no': 'Ayah No',
      'daily_verse': 'Daily Verse',
      'next_prayer': 'Next Prayer',
      'waiting_time': 'Calculating time...',
      'prayer_time_active': 'It\'s Prayer Time!',
      'location_active': 'GPS Active',
      'location_searching': 'Seeking Location...',
      'location_failed': 'Failed to get location',
      'language_settings': 'Language',
      'notification_settings': 'Notifications',
      'about_app': 'About App',
      'adzan_settings': 'Adzan Settings',
      'adzan_sound': 'Adzan Sound',
      'adzan_volume': 'Adzan Volume',
      'test_adzan': 'Test Sound',
      'vibration': 'Vibration',
      'silent_mode': 'Silent Mode',
      'pre_adhan_reminder': 'Pre-Adzan Reminder',
      'minutes': 'Minutes',
      'save': 'Save',
      'cancel': 'Cancel',
      'dark_mode': 'Dark Mode',
      'select_muadzin': 'Select Muadzin',
      'search_surah': 'Search Surah...',
      'zakat': 'Zakat',
      'asmaul_husna': '99 Names',
      'prayer_guide': 'Prayer Guide',
      'tahlil': 'Tahlil',
      'refresh': 'Refresh',
      'arabic': 'Arabic',
      'translation': 'Translation',
      'copy': 'Copy',
      'share': 'Share',
      'bookmark': 'Bookmark',
    },
    'ar': {
      'app_title': 'هوية مسلم',
      'home': 'الرئيسية',
      'quran': 'القرآن',
      'prayer': 'الصلاة',
      'dua': 'الأدعية',
      'hadith': 'الحديث',
      'qibla': 'القبلة',
      'ai_helper': 'مساعد ذكي',
      'tasbih': 'التسبيح',
      'settings': 'الإعدادات',
      'last_read': 'آخر قراءة',
      'ayah_no': 'رقم الآية',
      'daily_verse': 'آية اليوم',
      'next_prayer': 'الصلاة القادمة',
      'waiting_time': 'جاري الحساب...',
      'prayer_time_active': 'حي على الصلاة!',
      'location_active': 'الموقع نشط',
      'location_searching': 'بحث عن الموقع...',
      'location_failed': 'فشل تحديد الموقع',
      'language_settings': 'اللغة',
      'notification_settings': 'التنبيهات',
      'about_app': 'عن التطبيق',
      'adzan_settings': 'إعدادات الأذان',
      'adzan_sound': 'صوت الأذان',
      'adzan_volume': 'مستوى الصوت',
      'test_adzan': 'تجربة الصوت',
      'vibration': 'الاهتزاز',
      'silent_mode': 'الوضع الصامت',
      'pre_adhan_reminder': 'تنبيه قبل الأذان',
      'minutes': 'دقائق',
      'save': 'حفظ',
      'cancel': 'إلغاء',
      'dark_mode': 'الوضع الليلي',
      'select_muadzin': 'اختر المؤذن',
      'search_surah': 'البحث عن سورة...',
      'zakat': 'الزكاة',
      'asmaul_husna': 'أسماء الله الحسنى',
      'prayer_guide': 'دليل الصلاة',
      'tahlil': 'التهليل',
      'refresh': 'تحديث',
      'arabic': 'العربية',
      'translation': 'الترجمة',
      'copy': 'نسخ',
      'share': 'مشاركة',
      'bookmark': 'إشارة مرجعية',
    }
  };

  String translate(String key) {
    return translations[_currentLocale.languageCode]?[key] ?? 
           translations['en']?[key] ?? key;
  }

  bool get isRTL => _currentLocale.languageCode == 'ar' || _currentLocale.languageCode == 'ur';
}