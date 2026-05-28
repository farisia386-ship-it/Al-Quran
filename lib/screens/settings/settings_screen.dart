import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settings),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _sectionTitle(l10n.app_title),
          _settingsTile(
            icon: Icons.dark_mode_outlined,
            title: l10n.dark_mode,
            trailing: Switch(
              value: themeProvider.isDarkMode,
              onChanged: (value) => themeProvider.toggleTheme(),
              activeColor: AppColors.primary,
            ),
          ),
          _settingsTile(
            icon: Icons.language,
            title: l10n.language_settings,
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
          _sectionTitle(l10n.notification_settings),
          _settingsTile(
            icon: Icons.notifications_active_outlined,
            title: l10n.adzan_settings,
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const PrayerSettingsScreen()));
            },
          ),
          const SizedBox(height: 16),
          _sectionTitle(l10n.about_app),
          _settingsTile(
            icon: Icons.info_outline,
            title: l10n.about_app,
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
