import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import '../../config/colors.dart';
import '../../providers/prayer_provider.dart';

class PrayerScreen extends StatelessWidget {
  const PrayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final prayerProvider = Provider.of<PrayerProvider>(context);
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final nextPrayerKey = prayerProvider.nextPrayerKey;
    final nextPrayerName = nextPrayerKey.isNotEmpty 
        ? _getLocalizedPrayerName(nextPrayerKey, l10n) 
        : "-";
    
    final nextTime = prayerProvider.nextPrayerTime;
    final timeStr = nextTime != null ? DateFormat('HH:mm').format(nextTime) : "--:--";

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.prayer),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: AppColors.headerGradient,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.location_on, color: AppColors.gold, size: 24),
                    const SizedBox(height: 8),
                    Text(
                      prayerProvider.city == 'location_active' 
                          ? l10n.location_active 
                          : (prayerProvider.city == 'location_searching' 
                              ? l10n.location_searching 
                              : l10n.location_failed),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      l10n.next_prayer,
                      style: const TextStyle(color: Colors.white70),
                    ),
                    Text(
                      '$nextPrayerName • $timeStr',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (prayerProvider.hijriDate != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        '${prayerProvider.hijriDate!.hDay} ${prayerProvider.hijriDate!.getLongMonthName()} ${prayerProvider.hijriDate!.hYear} H',
                        style: const TextStyle(color: AppColors.goldLight, fontWeight: FontWeight.bold),
                      )
                    ]
                  ],
                ),
              ),
              const SizedBox(height: 24),
              _buildPrayerList(context, prayerProvider, l10n),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPrayerList(BuildContext context, PrayerProvider prayerProvider, AppLocalizations l10n) {
    if (prayerProvider.prayerTimesToday == null) {
      return const Center(child: CircularProgressIndicator(color: AppColors.primary));
    }

    final pt = prayerProvider.prayerTimesToday!;
    final times = [
      {'key': 'fajr', 'time': pt.fajr, 'icon': Icons.nights_stay},
      {'key': 'syuruq', 'time': pt.sunrise, 'icon': Icons.wb_twilight},
      {'key': 'dhuhr', 'time': pt.dhuhr, 'icon': Icons.wb_sunny},
      {'key': 'asr', 'time': pt.asr, 'icon': Icons.wb_cloudy},
      {'key': 'maghrib', 'time': pt.maghrib, 'icon': Icons.wb_twilight},
      {'key': 'isha', 'time': pt.isha, 'icon': Icons.nightlight_round},
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: times.length,
      itemBuilder: (context, index) {
        final item = times[index];
        final key = item['key'] as String;
        final time = item['time'] as DateTime;
        final icon = item['icon'] as IconData;
        final isCurrent = prayerProvider.currentPrayerKey == key;
        
        final isNotifEnabled = prayerProvider.notificationSettings[key] ?? false;

        return Card(
          elevation: isCurrent ? 4 : 1,
          color: isCurrent 
            ? (Theme.of(context).brightness == Brightness.dark ? AppColors.darkElevated : AppColors.primary.withOpacity(0.1))
            : null,
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: isCurrent ? const BorderSide(color: AppColors.primary, width: 1.5) : BorderSide.none,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              children: [
                Icon(icon, color: isCurrent ? AppColors.primary : AppColors.primary.withOpacity(0.6)),
                const SizedBox(width: 16),
                Text(
                  _getLocalizedPrayerName(key, l10n),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: isCurrent ? FontWeight.bold : FontWeight.w500,
                  ),
                ),
                if (isCurrent)
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.error,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      l10n.current_prayer, 
                      style: const TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                const Spacer(),
                Text(
                  DateFormat('HH:mm').format(time),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isCurrent ? AppColors.primary : null,
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    // syuruq generally doesn't have an adhan, but we'll allow toggling if it's in settings
                    if (key != 'syuruq') {
                      prayerProvider.toggleNotification(key);
                    }
                  },
                  child: Icon(
                    key == 'syuruq' 
                      ? Icons.notifications_off_outlined
                      : (isNotifEnabled ? Icons.notifications_active : Icons.notifications_off_outlined), 
                    size: 22, 
                    color: key == 'syuruq' ? Colors.grey.withOpacity(0.3) : (isNotifEnabled ? AppColors.primary : Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _getLocalizedPrayerName(String key, AppLocalizations l10n) {
    switch(key) {
      case 'fajr': return l10n.fajr;
      case 'syuruq': return l10n.syuruq;
      case 'dhuhr': return l10n.dhuhr;
      case 'asr': return l10n.asr;
      case 'maghrib': return l10n.maghrib;
      case 'isha': return l10n.isha;
      default: return key;
    }
  }
}
