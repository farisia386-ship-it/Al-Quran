import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/theme_provider.dart';
import '../../providers/language_provider.dart';
import '../../config/colors.dart';
import 'language_settings_screen.dart';
import 'prayer_settings_screen.dart';
import 'about_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final langProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(langProvider.translate('settings')),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _sectionTitle(langProvider.translate('app_title')),
          _settingsTile(
            icon: Icons.dark_mode_outlined,
            title: 'Dark Mode',
            trailing: Switch(
              value: themeProvider.isDarkMode,
              onChanged: (value) => themeProvider.toggleTheme(),
              activeColor: AppColors.primary,
            ),
          ),
          _settingsTile(
            icon: Icons.language,
            title: 'Language / Bahasa',
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(langProvider.currentLocale.languageCode.toUpperCase()),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward_ios, size: 16),
              ],
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const LanguageSettingsScreen()));
            },
          ),
          const SizedBox(height: 16),
          _sectionTitle(langProvider.translate('notification_settings')),
          _settingsTile(
            icon: Icons.notifications_active_outlined,
            title: 'Adzan & Pengingat',
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const PrayerSettingsScreen()));
            },
          ),
          const SizedBox(height: 16),
          _sectionTitle(langProvider.translate('about_app')),
          _settingsTile(
            icon: Icons.info_outline,
            title: langProvider.translate('about_app'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutScreen()));
            },
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
      ),
    );
  }

  Widget _settingsTile({required IconData icon, required String title, required Widget trailing, VoidCallback? onTap}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primary),
        title: Text(title),
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }
}
