import 'package:workmanager/workmanager.dart';
import 'package:adhan/adhan.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'notification_service.dart';
import 'location_service.dart';

class BackgroundSyncTask {
  static const String taskName = "syncPrayerTimes";

  @pragma('vm:entry-point')
  static void callbackDispatcher() {
    Workmanager().executeTask((task, inputData) async {
      try {
        await NotificationService.init();
        final locationService = LocationService();
        final position = await locationService.getCurrentLocation() ?? 
                         await locationService.getLastSavedLocation();

        if (position == null) return true;

        final params = CalculationMethod.muslim_world_league.getParameters();
        params.madhab = Madhab.shafi;

        final coordinates = Coordinates(position.latitude, position.longitude);
        final prayerTimes = PrayerTimes.today(coordinates, params);

        // Schedule for the next 24 hours
        await _schedulePrayers(prayerTimes);
        
        return true;
      } catch (e) {
        return false;
      }
    });
  }

  static Future<void> _schedulePrayers(PrayerTimes prayerTimes) async {
    final prayers = {
      "Subuh": prayerTimes.fajr,
      "Dzuhur": prayerTimes.dhuhr,
      "Ashar": prayerTimes.asr,
      "Maghrib": prayerTimes.maghrib,
      "Isya": prayerTimes.isha,
    };

    int id = 0;
    for (var entry in prayers.entries) {
      await NotificationService.scheduleAdhan(
        id++,
        "Waktunya Sholat ${entry.key}",
        "Marilah kita menunaikan ibadah sholat ${entry.key}",
        entry.value,
      );
      
      // Pre-prayer reminder (10 mins before)
      await NotificationService.scheduleReminder(
        id + 100,
        "10 Menit Menuju ${entry.key}",
        "Segera bersiap untuk sholat ${entry.key}",
        entry.value.subtract(const Duration(minutes: 10)),
      );
    }

    // Friday Prayer Reminder
    final now = DateTime.now();
    if (now.weekday == DateTime.friday) {
      await NotificationService.scheduleReminder(
        999,
        "Hari Jumat Berkah",
        "Jangan lupa membaca Surah Al-Kahfi dan bersiap Sholat Jumat.",
        DateTime(now.year, now.month, now.day, 10, 0),
      );
    }

    // Daily Dhikr Reminder
    await NotificationService.scheduleReminder(
      888,
      "Dzikir Pagi",
      "Awali harimu dengan mengingat Allah. Mari baca dzikir pagi.",
      DateTime(now.year, now.month, now.day, 6, 0),
    );
  }
}
