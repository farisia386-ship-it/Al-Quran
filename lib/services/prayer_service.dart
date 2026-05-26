import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/constants.dart';
import '../models/prayer_time.dart';

class PrayerService {
  Future<PrayerTime?> getPrayerTimes(String city, String country) async {
    try {
      final response = await http.get(
        Uri.parse('${AppConstants.prayerApiBase}/timingsByCity?city=$city&country=$country&method=${AppConstants.prayerMethod}'),
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return PrayerTime.fromJson(data['data']);
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
