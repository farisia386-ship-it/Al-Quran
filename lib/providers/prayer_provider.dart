import 'dart:async';
import 'package:flutter/material.dart';
import 'package:adhan/adhan.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import '../services/location_service.dart';
import '../services/notification_service.dart';

class PrayerProvider with ChangeNotifier {
  final LocationService _locationService = LocationService();
  
  PrayerTimes? _prayerTimesToday;
  PrayerTimes? _prayerTimesTomorrow;
  Position? _currentPosition;
  bool _isLoading = true;
  String _locationName = "location_searching";
  
  Timer? _timer;
  
  String _currentPrayerKey = "";
  String _nextPrayerKey = "";
  DateTime? _nextPrayerTime;
  
  HijriCalendar? _hijriDate;
  
  final Map<String, bool> _notificationSettings = {
    "fajr": true,
    "dhuhr": true,
    "asr": true,
    "maghrib": true,
    "isha": true,
  };
  
  bool _prePrayerReminder = true;
  int _prePrayerMinutes = 15;
  bool _vibrationActive = true;
  String _adhanSound = "adzan";

  PrayerTimes? get prayerTimesToday => _prayerTimesToday;
  bool get isLoading => _isLoading;
  String get locationName => _locationName;
  String get city => _locationName;
  Map<String, bool> get notificationSettings => _notificationSettings;
  bool get prePrayerReminder => _prePrayerReminder;
  bool get vibrationActive => _vibrationActive;
  String get adhanSound => _adhanSound;
  
  String get currentPrayerKey => _currentPrayerKey;
  String get nextPrayerKey => _nextPrayerKey;
  DateTime? get nextPrayerTime => _nextPrayerTime;
  HijriCalendar? get hijriDate => _hijriDate;

  PrayerProvider() {
    _loadSettings();
    initPrayerTimes();
    _startTimer();
  }
  
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    // Run every second to update internal time and countdowns if necessary
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_prayerTimesToday != null) {
        _updateCurrentAndNextPrayer();
        notifyListeners();
      }
    });
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

  Future<void> toggleNotification(String prayerKey) async {
    _notificationSettings[prayerKey] = !(_notificationSettings[prayerKey] ?? true);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notif_$prayerKey', _notificationSettings[prayerKey]!);
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
        _updateCurrentAndNextPrayer();
        await scheduleAllNotifications();
        _locationName = "location_active";
      } else {
        _locationName = "location_failed";
      }
    } catch (e) {
      _locationName = "location_failed";
    }

    _isLoading = false;
    notifyListeners();
  }

  void _calculateTimes() {
    if (_currentPosition == null) return;
    
    // Set Hijri Date
    _hijriDate = HijriCalendar.now();

    final coordinates = Coordinates(_currentPosition!.latitude, _currentPosition!.longitude);
    final params = CalculationMethod.muslim_world_league.getParameters();
    params.madhab = Madhab.shafi;

    final dateToday = DateComponents.from(DateTime.now());
    final dateTomorrow = DateComponents.from(DateTime.now().add(const Duration(days: 1)));
    
    _prayerTimesToday = PrayerTimes(coordinates, dateToday, params);
    _prayerTimesTomorrow = PrayerTimes(coordinates, dateTomorrow, params);
  }

  void _updateCurrentAndNextPrayer() {
    if (_prayerTimesToday == null || _prayerTimesTomorrow == null) return;
    
    final now = DateTime.now();
    
    // Mapping from adhan Prayer type to localization keys
    String getPrayerKey(Prayer prayer) {
      switch (prayer) {
        case Prayer.fajr: return 'fajr';
        case Prayer.sunrise: return 'syuruq';
        case Prayer.dhuhr: return 'dhuhr';
        case Prayer.asr: return 'asr';
        case Prayer.maghrib: return 'maghrib';
        case Prayer.isha: return 'isha';
        default: return 'none';
      }
    }

    Prayer current = _prayerTimesToday!.currentPrayer();
    Prayer next = _prayerTimesToday!.nextPrayer();
    
    // If it's past Isha, nextPrayer() will return Prayer.none
    if (next == Prayer.none) {
      _currentPrayerKey = 'isha';
      _nextPrayerKey = 'fajr';
      _nextPrayerTime = _prayerTimesTomorrow!.fajr;
    } else {
      _currentPrayerKey = current == Prayer.none ? 'isha' : getPrayerKey(current);
      _nextPrayerKey = getPrayerKey(next);
      _nextPrayerTime = _prayerTimesToday!.timeForPrayer(next);
    }
  }

  Future<void> scheduleAllNotifications() async {
    if (_prayerTimesToday == null) return;

    await NotificationService.cancelAll();

    final prayers = {
      "fajr": _prayerTimesToday!.fajr,
      "dhuhr": _prayerTimesToday!.dhuhr,
      "asr": _prayerTimesToday!.asr,
      "maghrib": _prayerTimesToday!.maghrib,
      "isha": _prayerTimesToday!.isha,
    };

    int id = 0;
    for (var entry in prayers.entries) {
      if (_notificationSettings[entry.key] == true) {
        // We will schedule it with generic text, but in a real app 
        // the background worker should localize it. We will use a generic default alert.
        await NotificationService.scheduleAdhan(
          id,
          "Waktunya Sholat",
          "Marilah kita menunaikan ibadah sholat",
          entry.value,
          sound: _adhanSound,
        );
      }

      if (_prePrayerReminder) {
        await NotificationService.scheduleReminder(
          id + 100,
          "$_prePrayerMinutes Menit Menuju Sholat",
          "Bersiaplah untuk menunaikan sholat",
          entry.value.subtract(Duration(minutes: _prePrayerMinutes)),
        );
      }
      id++;
    }
  }
}
