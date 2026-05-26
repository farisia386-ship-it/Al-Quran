class AppConstants {
  AppConstants._();

  static const String appName = 'Muslim ID';
  static const String appVersion = '1.0.0';
  static const String appTagline = 'Teman Ibadah Harian Anda';

  // API Endpoints
  static const String quranApiBase = 'https://api.alquran.cloud/v1';
  static const String prayerApiBase = 'https://api.aladhan.com/v1';

  // SharedPreferences Keys
  static const String keyDarkMode = 'dark_mode';
  static const String keyOnboardingDone = 'onboarding_done';
  static const String keyLastReadSurah = 'last_read_surah';
  static const String keyLastReadAyah = 'last_read_ayah';
  static const String keyBookmarks = 'bookmarks';
  static const String keyTasbihCount = 'tasbih_count';
  static const String keyTasbihTarget = 'tasbih_target';
  static const String keyDailyStreak = 'daily_streak';
  static const String keyLastActiveDate = 'last_active_date';
  static const String keyTotalXp = 'total_xp';
  static const String keyCity = 'prayer_city';
  static const String keyCountry = 'prayer_country';

  // Default Location
  static const String defaultCity = 'Jakarta';
  static const String defaultCountry = 'Indonesia';
  static const int prayerMethod = 20; // Kemenag RI

  // XP Values
  static const int xpReadQuran = 10;
  static const int xpPrayer = 20;
  static const int xpDoa = 5;
  static const int xpTasbih = 5;
  static const int xpDailyLogin = 15;

  // Levels
  static const List<Map<String, dynamic>> levels = [
    {'name': 'Pemula', 'minXp': 0, 'icon': '🌱'},
    {'name': 'Mubtadi', 'minXp': 100, 'icon': '⭐'},
    {'name': 'Mutawassit', 'minXp': 300, 'icon': '🌟'},
    {'name': 'Mutaqaddim', 'minXp': 600, 'icon': '💫'},
    {'name': 'Hafizh', 'minXp': 1000, 'icon': '🏆'},
    {'name': 'Alim', 'minXp': 2000, 'icon': '👑'},
    {'name': 'Mujahid', 'minXp': 5000, 'icon': '🕌'},
  ];
}
