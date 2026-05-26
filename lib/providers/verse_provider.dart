import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/daily_verse.dart';
import '../data/daily_verse_data.dart';

class VerseProvider with ChangeNotifier {
  DailyVerse? _currentVerse;
  List<DailyVerse> _favorites = [];
  List<String> _historyIds = [];

  DailyVerse? get currentVerse => _currentVerse;
  List<DailyVerse> get favorites => _favorites;

  VerseProvider() {
    _init();
  }

  Future<void> _init() async {
    await _loadFavorites();
    await _loadHistory();
    _loadDailyVerse();
  }

  void _loadDailyVerse() {
    final now = DateTime.now();
    final dateString = "${now.year}-${now.month}-${now.day}";
    
    // Simple deterministic rotation based on date
    final index = (now.year + now.month + now.day) % dailyVerseData.length;
    _currentVerse = dailyVerseData[index];
    
    _addToHistory(_currentVerse!.id);
    notifyListeners();
  }

  void refreshVerse() {
    // Pick a random verse different from the current one
    final random = Random();
    int newIndex;
    do {
      newIndex = random.nextInt(dailyVerseData.length);
    } while (dailyVerseData[newIndex].id == _currentVerse?.id);
    
    _currentVerse = dailyVerseData[newIndex];
    _addToHistory(_currentVerse!.id);
    notifyListeners();
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favIds = prefs.getStringList('favorite_verses') ?? [];
    _favorites = dailyVerseData.where((v) => favIds.contains(v.id)).toList();
    notifyListeners();
  }

  Future<void> toggleFavorite(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final favIds = prefs.getStringList('favorite_verses') ?? [];
    
    if (favIds.contains(id)) {
      favIds.remove(id);
    } else {
      favIds.add(id);
    }
    
    await prefs.setStringList('favorite_verses', favIds);
    await _loadFavorites();
  }

  bool isFavorite(String id) {
    return _favorites.any((v) => v.id == id);
  }

  Future<void> _loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    _historyIds = prefs.getStringList('verse_history') ?? [];
  }

  Future<void> _addToHistory(String id) async {
    if (!_historyIds.contains(id)) {
      _historyIds.insert(0, id);
      if (_historyIds.length > 30) _historyIds.removeLast();
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('verse_history', _historyIds);
    }
  }
}
