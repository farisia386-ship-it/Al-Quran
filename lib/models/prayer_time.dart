class PrayerTime {
  final String fajr;
  final String sunrise;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;
  final String date;
  final String hijriDate;
  final String hijriMonth;
  final String hijriYear;

  const PrayerTime({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
    required this.date,
    required this.hijriDate,
    required this.hijriMonth,
    required this.hijriYear,
  });

  factory PrayerTime.fromJson(Map<String, dynamic> json) {
    final timings = json['timings'] as Map<String, dynamic>;
    final date = json['date'] as Map<String, dynamic>;
    final hijri = date['hijri'] as Map<String, dynamic>;
    final hijriMonth = hijri['month'] as Map<String, dynamic>;

    String cleanTime(String time) {
      return time.replaceAll(RegExp(r'\s*\(.*\)'), '');
    }

    return PrayerTime(
      fajr: cleanTime(timings['Fajr'] as String),
      sunrise: cleanTime(timings['Sunrise'] as String),
      dhuhr: cleanTime(timings['Dhuhr'] as String),
      asr: cleanTime(timings['Asr'] as String),
      maghrib: cleanTime(timings['Maghrib'] as String),
      isha: cleanTime(timings['Isha'] as String),
      date: date['readable'] as String,
      hijriDate: '${hijri['day']} ${hijriMonth['en']} ${hijri['year']}',
      hijriMonth: hijriMonth['en'] as String,
      hijriYear: hijri['year'] as String,
    );
  }

  List<Map<String, String>> toList() {
    return [
      {'name': 'Subuh', 'time': fajr, 'icon': '🌙'},
      {'name': 'Syuruq', 'time': sunrise, 'icon': '🌅'},
      {'name': 'Dzuhur', 'time': dhuhr, 'icon': '☀️'},
      {'name': 'Ashar', 'time': asr, 'icon': '🌤️'},
      {'name': 'Maghrib', 'time': maghrib, 'icon': '🌇'},
      {'name': 'Isya', 'time': isha, 'icon': '🌃'},
    ];
  }
}
