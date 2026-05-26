import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../config/colors.dart';
import '../../providers/prayer_provider.dart';

class PrayerSettingsScreen extends StatelessWidget {
  const PrayerSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final prayerProvider = Provider.of<PrayerProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan Notifikasi'),
      ),
      body: ListView(
        children: [
          _buildSectionHeader('Notifikasi Utama'),
          ...prayerProvider.notificationSettings.keys.map((prayer) {
            return _buildPrayerToggle(
              prayer,
              prayerProvider.notificationSettings[prayer] ?? true,
              (val) => prayerProvider.toggleNotification(prayer),
            );
          }),
          const Divider(),
          _buildSectionHeader('Pengingat Tambahan'),
          _buildToggleTile(
            'Pengingat Sebelum Sholat',
            'Dapatkan notifikasi 15 menit sebelum waktu sholat tiba.',
            prayerProvider.prePrayerReminder,
            (val) => prayerProvider.setPrePrayerReminder(val),
          ),
          const Divider(),
          _buildSectionHeader('Suara & Getar'),
          ListTile(
            leading: const Icon(Icons.music_note, color: AppColors.primary),
            title: const Text('Suara Adzan'),
            subtitle: Text(prayerProvider.adhanSound == "adzan" ? 'Baku (Standar)' : 'Lainnya'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: Implement adhan sound selection
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Fitur pemilihan suara segera hadir!')),
              );
            },
          ),
          _buildToggleTile(
            'Getar Saat Adzan',
            'Menggetarkan perangkat saat waktu sholat tiba.',
            prayerProvider.vibrationActive,
            (val) => prayerProvider.setVibration(val),
          ),
          const Divider(),
          _buildSectionHeader('Lainnya'),
          ListTile(
            leading: const Icon(Icons.location_on, color: AppColors.primary),
            title: const Text('Sinkronisasi Lokasi Otomatis'),
            subtitle: const Text('Perbarui jadwal sholat saat berpindah kota.'),
            trailing: Switch(
              value: true, 
              onChanged: (val) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Lokasi akan selalu diperbarui secara otomatis.')),
                );
              },
              activeColor: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
          letterSpacing: 1.5,
        ),
      ),
    );
  }

  Widget _buildPrayerToggle(String name, bool value, Function(bool) onChanged) {
    return ListTile(
      title: Text(name),
      trailing: Switch(
        value: value,
        activeColor: AppColors.primary,
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildToggleTile(String title, String subtitle, bool value, Function(bool) onChanged) {
    return ListTile(
      title: Text(title),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 12),
      ),
      trailing: Switch(
        value: value,
        activeColor: AppColors.primary,
        onChanged: onChanged,
      ),
    );
  }
}
