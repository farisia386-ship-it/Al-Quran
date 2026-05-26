import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../config/colors.dart';
import '../../providers/language_provider.dart';

class LanguageSettingsScreen extends StatelessWidget {
  const LanguageSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final langProvider = Provider.of<LanguageProvider>(context);
    
    final List<Map<String, String>> languages = [
      {'code': 'en', 'name': 'English', 'native': 'English', 'flag': '🇺🇸'},
      {'code': 'id', 'name': 'Indonesian', 'native': 'Bahasa Indonesia', 'flag': '🇮🇩'},
      {'code': 'ar', 'name': 'Arabic', 'native': 'العربية', 'flag': '🇸🇦'},
      {'code': 'ur', 'name': 'Urdu', 'native': 'اردو', 'flag': '🇵🇰'},
      {'code': 'fr', 'name': 'French', 'native': 'Français', 'flag': '🇫🇷'},
      {'code': 'es', 'name': 'Spanish', 'native': 'Español', 'flag': '🇪🇸'},
      {'code': 'de', 'name': 'German', 'native': 'Deutsch', 'flag': '🇩🇪'},
      {'code': 'tr', 'name': 'Turkish', 'native': 'Türkçe', 'flag': '🇹🇷'},
      {'code': 'ru', 'name': 'Russian', 'native': 'Русский', 'flag': '🇷🇺'},
      {'code': 'zh', 'name': 'Chinese', 'native': '中文', 'flag': '🇨🇳'},
      {'code': 'ja', 'name': 'Japanese', 'native': '日本語', 'flag': '🇯🇵'},
      {'code': 'ko', 'name': 'Korean', 'native': '한국어', 'flag': '🇰🇷'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(langProvider.translate('language_settings')),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: languages.length,
        separatorBuilder: (context, index) => const Divider(height: 1, indent: 70),
        itemBuilder: (context, index) {
          final lang = languages[index];
          final isSelected = langProvider.currentLocale.languageCode == lang['code'];

          return ListTile(
            leading: Text(
              lang['flag']!,
              style: const TextStyle(fontSize: 30),
            ),
            title: Text(
              lang['native']!,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? AppColors.primary : null,
              ),
            ),
            subtitle: Text(lang['name']!),
            trailing: isSelected 
                ? const Icon(Icons.check_circle, color: AppColors.primary)
                : null,
            onTap: () {
              langProvider.setLanguage(lang['code']!);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Language changed to ${lang['name']}'),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
