import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/surah.dart';
import '../services/quran_service.dart';
import '../config/constants.dart';
import '../data/surah_list.dart' as local_data;

class QuranProvider with ChangeNotifier {
  final QuranService _service = QuranService();
  List<Surah> _surahs = local_data.surahList;
  bool _isLoading = false;
  
  String _lastReadSurah = "Al-Fatihah";
  int _lastReadAyah = 1;

  List<Surah> get surahs => _surahs;
  bool get isLoading => _isLoading;
  String get lastReadSurah => _lastReadSurah;
  int get lastReadAyah => _lastReadAyah;

  QuranProvider() {
    _loadLastRead();
  }

  Future<void> _loadLastRead() async {
    final prefs = await SharedPreferences.getInstance();
    _lastReadSurah = prefs.getString(AppConstants.keyLastReadSurah) ?? "Al-Fatihah";
    _lastReadAyah = prefs.getInt(AppConstants.keyLastReadAyah) ?? 1;
    notifyListeners();
  }

  Future<void> updateLastRead(String name, int ayahNumber) async {
    _lastReadSurah = name;
    _lastReadAyah = ayahNumber;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstants.keyLastReadSurah, name);
    await prefs.setInt(AppConstants.keyLastReadAyah, ayahNumber);
    notifyListeners();
  }

  Future<void> fetchSurahs() async {
    _isLoading = true;
    notifyListeners();
    
    final fetched = await _service.getSurahList();
    if (fetched.isNotEmpty) {
      _surahs = fetched;
    }
    
    _isLoading = false;
    notifyListeners();
  }

  List<Surah> searchSurah(String query) {
    if (query.isEmpty) return _surahs;
    return _surahs.where((s) => 
      s.name.toLowerCase().contains(query.toLowerCase()) || 
      s.englishName.toLowerCase().contains(query.toLowerCase())
    ).toList();
  }
}
