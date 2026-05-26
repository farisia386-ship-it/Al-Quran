import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../config/colors.dart';
import '../../services/notification_service.dart';

class TahlilSettingsScreen extends StatefulWidget {
  const TahlilSettingsScreen({super.key});

  @override
  State<TahlilSettingsScreen> createState() => _TahlilSettingsScreenState();
}

class _TahlilSettingsScreenState extends State<TahlilSettingsScreen> {
  bool _dailyReminder = false;
  TimeOfDay _reminderTime = const TimeOfDay(hour: 20, minute: 0);
  bool _autoPlay = false;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _dailyReminder = prefs.getBool('tahlil_reminder') ?? false;
      _autoPlay = prefs.getBool('tahlil_autoplay') ?? false;
      final hour = prefs.getInt('tahlil_reminder_hour') ?? 20;
      final minute = prefs.getInt('tahlil_reminder_minute') ?? 0;
      _reminderTime = TimeOfDay(hour: hour, minute: minute);
    });
  }

  Future<void> _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('tahlil_reminder', _dailyReminder);
    await prefs.setBool('tahlil_autoplay', _autoPlay);
    await prefs.setInt('tahlil_reminder_hour', _reminderTime.hour);
    await prefs.setInt('tahlil_reminder_minute', _reminderTime.minute);
    _updateReminder();
  }

  void _updateReminder() {
    if (_dailyReminder) {
      NotificationService.scheduleDailyReminder(
        555, // Unique ID for Tahlil reminder
        'Waktunya Tahlil',
        'Mari sempatkan waktu sejenak untuk membaca Tahlil hari ini.',
        _reminderTime.hour,
        _reminderTime.minute,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan Tahlil'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Pengingat Harian Tahlil'),
            subtitle: const Text('Dapatkan notifikasi untuk membaca Tahlil setiap hari.'),
            trailing: Switch(
              value: _dailyReminder,
              onChanged: (val) {
                setState(() => _dailyReminder = val);
                _saveSettings();
              },
              activeColor: AppColors.primary,
            ),
          ),
          if (_dailyReminder)
            ListTile(
              title: const Text('Waktu Pengingat'),
              trailing: Text(
                _reminderTime.format(context),
                style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary),
              ),
              onTap: () async {
                final time = await showTimePicker(
                  context: context,
                  initialTime: _reminderTime,
                );
                if (time != null) {
                  setState(() => _reminderTime = time);
                  _saveSettings();
                }
              },
            ),
          const Divider(),
          _buildSectionHeader('Preferensi Pemutaran'),
          ListTile(
            title: const Text('Putar Otomatis'),
            subtitle: const Text('Mulai audio secara otomatis saat membuka bacaan.'),
            trailing: Switch(
              value: _autoPlay,
              onChanged: (val) {
                setState(() => _autoPlay = val);
                _saveSettings();
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
}
