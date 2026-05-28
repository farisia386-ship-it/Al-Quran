import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui' as ui;

class LanguageProvider with ChangeNotifier {
  Locale _currentLocale = const Locale('en');
  
  Locale get currentLocale => _currentLocale;

  LanguageProvider() {
    _initLanguage();
  }

  // Supported language codes that match our ARB files
  static const Set<String> _supportedLangs = {
    'id', 'en', 'ar', 'ko', 'ja', 'ru', 'tr', 'it', 'ur'
  };

  Future<void> _initLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final String? savedLang = prefs.getString('language_code');
    
    if (savedLang != null) {
      _currentLocale = Locale(savedLang);
    } else {
      // Auto-detect device language
      String deviceLang = ui.PlatformDispatcher.instance.locale.languageCode;
      if (_supportedLangs.contains(deviceLang)) {
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

  bool get isRTL => _currentLocale.languageCode == 'ar' || _currentLocale.languageCode == 'ur';
}