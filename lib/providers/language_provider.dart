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
      'settings': 'Setelan',
      'last_read': 'Terakhir Baca',
      'next_prayer': 'Sholat Berikutnya',
      'qibla': 'Arah Kiblat',
      'zakat': 'Kalkulator Zakat',
      'asmaul_husna': 'Asmaul Husna',
      'morning_dzikir': 'Dzikir Pagi',
      'evening_dzikir': 'Dzikir Petang',
      'after_prayer': 'Sesudah Sholat',
      'prayer_guide': 'Panduan Sholat',
      'language_settings': 'Pengaturan Bahasa',
      'notification_settings': 'Pengaturan Notifikasi',
      'about_app': 'Tentang Aplikasi',
      'tahlil_full': 'Tahlil Lengkap',
      'next': 'Berikutnya',
    },
    'en': {
      'app_title': 'Muslim ID',
      'home': 'Home',
      'quran': 'Quran',
      'prayer': 'Prayer',
      'dua': 'Dua',
      'settings': 'Settings',
      'last_read': 'Last Read',
      'next_prayer': 'Next Prayer',
      'qibla': 'Qibla Direction',
      'zakat': 'Zakat Calculator',
      'asmaul_husna': '99 Names of Allah',
      'morning_dzikir': 'Morning Dzikir',
      'evening_dzikir': 'Evening Dzikir',
      'after_prayer': 'After Prayer',
      'prayer_guide': 'Prayer Guide',
      'language_settings': 'Language Settings',
      'notification_settings': 'Notification Settings',
      'about_app': 'About Application',
      'tahlil_full': 'Full Tahlil',
      'next': 'Next',
    },
    'ar': {
      'app_title': 'هوية مسلم',
      'home': 'الرئيسية',
      'quran': 'القرآن',
      'prayer': 'الصلاة',
      'dua': 'الأدعية',
      'settings': 'الإعدادات',
      'last_read': 'آخر قراءة',
      'next_prayer': 'الصلاة القادمة',
      'qibla': 'إتجاه القبلة',
      'zakat': 'حساب الزكاة',
      'asmaul_husna': 'أسماء الله الحسنى',
      'morning_dzikir': 'أذكار الصباح',
      'evening_dzikir': 'أذكار المساء',
      'after_prayer': 'أذكار الصلاة',
      'prayer_guide': 'دليل الصلاة',
      'language_settings': 'إعدادات اللغة',
      'notification_settings': 'إعدادات التنبيهات',
      'about_app': 'عن التطبيق',
      'tahlil_full': 'التهليل الكامل',
      'next': 'التالي',
    },
    'fr': {
      'app_title': 'Muslim ID',
      'home': 'Accueil',
      'quran': 'Coran',
      'prayer': 'Prière',
      'dua': 'Doua',
      'settings': 'Paramètres',
      'language_settings': 'Paramètres de langue',
      'about_app': 'À propos de l\'application',
    },
    'es': {
      'app_title': 'Muslim ID',
      'home': 'Inicio',
      'quran': 'Corán',
      'prayer': 'Oración',
      'dua': 'Dua',
      'settings': 'Ajustes',
      'language_settings': 'Ajustes de idioma',
      'about_app': 'Acerca de la aplicación',
    },
    'de': {
      'app_title': 'Muslim ID',
      'home': 'Startseite',
      'quran': 'Koran',
      'prayer': 'Gebet',
      'dua': 'Bittgebet',
      'settings': 'Einstellungen',
      'language_settings': 'Spracheinstellungen',
      'about_app': 'Über die App',
    },
    'tr': {
      'app_title': 'Müslüman Kimliği',
      'home': 'Ana Sayfa',
      'quran': 'Kuran',
      'prayer': 'Namaz',
      'dua': 'Dua',
      'settings': 'Ayarlar',
      'language_settings': 'Dil Ayarları',
      'about_app': 'Uygulama Hakkında',
    },
    'ru': {
      'app_title': 'Мусульманский ID',
      'home': 'Главная',
      'quran': 'Коран',
      'prayer': 'Молитва',
      'dua': 'Дуа',
      'settings': 'Настройки',
      'language_settings': 'Настройки языка',
      'about_app': 'О приложении',
    },
    'zh': {
      'app_title': '穆斯林身份',
      'home': '首页',
      'quran': '古兰经',
      'prayer': '礼拜',
      'dua': '杜阿',
      'settings': '设置',
      'language_settings': '语言设置',
      'about_app': '关于应用',
    },
    'ja': {
      'app_title': 'ムスリムID',
      'home': 'ホーム',
      'quran': 'コーラン',
      'prayer': '礼拝',
      'dua': 'ドゥア',
      'settings': '設定',
      'language_settings': '言語設定',
      'about_app': 'アプリについて',
    },
    'ko': {
      'app_title': '무슬림 ID',
      'home': '홈',
      'quran': '코란',
      'prayer': '예배',
      'dua': '두아',
      'settings': '설정',
      'language_settings': '언어 설정',
      'about_app': '앱 정보',
    },
    'ur': {
      'app_title': 'مسلم آئی ڈی',
      'home': 'ہوم',
      'quran': 'قرآن',
      'prayer': 'نماز',
      'dua': 'دعا',
      'settings': 'ترتیبات',
      'language_settings': 'زبان کی ترتیبات',
      'about_app': 'ایپ کے بارے میں',
    }
  };

  String translate(String key) {
    return translations[_currentLocale.languageCode]?[key] ?? 
           translations['en']?[key] ?? key;
  }

  bool get isRTL => _currentLocale.languageCode == 'ar' || _currentLocale.languageCode == 'ur';
}
