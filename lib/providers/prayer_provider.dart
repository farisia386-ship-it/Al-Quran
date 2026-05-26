import 'package:flutter/material.dart';
import 'package:adhan/adhan.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/location_service.dart';
import '../services/notification_service.dart';

class PrayerProvider with ChangeNotifier {
  final LocationService _locationService = LocationService();
  
  PrayerTimes? _prayerTimes;
  Position? _currentPosition;
  bool _isLoading = false;
  String _locationName = "Mencari Lokasi...";
  
  Map<String, bool> _notificationSettings = {
    "Subuh": true,
    "Dzuhur": true,
    "Ashar": true,
    "Maghrib": true,
    "Isya": true,
  };
  
  bool _prePrayerReminder = true;
  int _prePrayerMinutes = 15;
  bool _vibrationActive = true;
  String _adhanSound = "adzan";

  PrayerTimes? get prayerTimes => _prayerTimes;
  bool get isLoading => _isLoading;
  String get locationName => _locationName;
  String get city => _locationName;
  Map<String, bool> get notificationSettings => _notificationSettings;
  bool get prePrayerReminder => _prePrayerReminder;
  bool get vibrationActive => _vibrationActive;
  String get adhanSound => _adhanSound;

  PrayerProvider() {
    _loadSettings();
    initPrayerTimes();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    for (var key in _notificationSettings.keys) {
      _notificationSettings[key] = prefs.getBool('notif_$key') ?? true;
    }
    _prePrayerReminder = prefs.getBool('pre_prayer_reminder') ?? true;
    _prePrayerMinutes = prefs.getInt('pre_prayer_minutes') ?? 15;
    _vibrationActive = prefs.getBool('vibration_active') ?? true;
    _adhanSound = prefs.getString('adhan_sound') ?? "adzan";
    notifyListeners();
  }

  Future<void> toggleNotification(String prayer) async {
    _notificationSettings[prayer] = !(_notificationSettings[prayer] ?? true);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notif_$prayer', _notificationSettings[prayer]!);
    await scheduleAllNotifications();
    notifyListeners();
  }

  Future<void> setPrePrayerReminder(bool value) async {
    _prePrayerReminder = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('pre_prayer_reminder', value);
    await scheduleAllNotifications();
    notifyListeners();
  }

  Future<void> setVibration(bool value) async {
    _vibrationActive = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('vibration_active', value);
    notifyListeners();
  }

  Future<void> initPrayerTimes() async {
    _isLoading = true;
    notifyListeners();

    try {
      _currentPosition = await _locationService.getCurrentLocation() ?? 
                         await _locationService.getLastSavedLocation();

      if (_currentPosition != null) {
        _calculateTimes();
        await scheduleAllNotifications();
        _locationName = "Lokasi GPS Aktif";
      } else {
        _locationName = "Gagal mendapatkan lokasi";
      }
    } catch (e) {
      _locationName = "Error: $e";
    }

    _isLoading = false;
    notifyListeners();
  }

  void _calculateTimes() {
    if (_currentPosition == null) return;

    final coordinates = Coordinates(_currentPosition!.latitude, _currentPosition!.longitude);
    final params = CalculationMethod.muslim_world_league.getParameters();
    params.madhab = Madhab.shafi;

    _prayerTimes = PrayerTimes.today(coordinates, params);
  }

  Future<void> scheduleAllNotifications() async {
    if (_prayerTimes == null) return;

    await NotificationService.cancelAll();

    final prayers = {
      "Subuh": _prayerTimes!.fajr,
      "Dzuhur": _prayerTimes!.dhuhr,
      "Ashar": _prayerTimes!.asr,
      "Maghrib": _prayerTimes!.maghrib,
      "Isya": _prayerTimes!.isha,
    };

    int id = 0;
    for (var entry in prayers.entries) {
      if (_notificationSettings[entry.key] == true) {
        // Adhan Notification
        await NotificationService.scheduleAdhan(
          id,
          "Waktunya Sholat ${entry.key}",
          "Marilah kita menunaikan ibadah sholat ${entry.key}",
          entry.value,
          sound: _adhanSound,
        );
      }

      if (_prePrayerReminder) {
        // Pre-prayer reminder
        await NotificationService.scheduleReminder(
          id + 100,
          "$_prePrayerMinutes Menit Menuju ${entry.key}",
          "Bersiaplah untuk menunaikan sholat ${entry.key}",
          entry.value.subtract(Duration(minutes: _prePrayerMinutes)),
        );
      }
      id++;
    }
  }

  String getNextPrayerName() {
    if (_prayerTimes == null) return "-";
    return _prayerTimes!.nextPrayer().name.toUpperCase();
  }

  DateTime? getNextPrayerTime() {
    if (_prayerTimes == null) return null;
    return _prayerTimes!.timeForPrayer(_prayerTimes!.nextPrayer());
  }
}
