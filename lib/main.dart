import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'config/theme.dart';
import 'providers/theme_provider.dart';
import 'providers/quran_provider.dart';
import 'providers/prayer_provider.dart';
import 'providers/qibla_provider.dart';
import 'providers/verse_provider.dart';
import 'screens/splash/splash_screen.dart';

import 'providers/language_provider.dart';
import 'services/notification_service.dart';

import 'package:flutter/foundation.dart';
import 'package:workmanager/workmanager.dart';
import 'services/background_sync_task.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.init();
  
  // Schedule Daily Verse Notification (07:00)
  await NotificationService.scheduleDailyVerseNotification(
    777,
    "Ayat Hari Ini Sudah Siap",
    "Dapatkan inspirasi Al-Quran untuk memulai harimu dengan penuh berkah.",
    7,
    0,
  );
  
  // Initialize Workmanager only on mobile platforms
  if (!kIsWeb) {
    Workmanager().initialize(
      BackgroundSyncTask.callbackDispatcher,
      isInDebugMode: false,
    );

    // Register periodic task (every 24 hours)
    Workmanager().registerPeriodicTask(
      "1",
      BackgroundSyncTask.taskName,
      frequency: const Duration(hours: 24),
      existingWorkPolicy: ExistingPeriodicWorkPolicy.keep,
      constraints: Constraints(
        networkType: NetworkType.connected,
      ),
    );
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => QuranProvider()),
        ChangeNotifierProvider(create: (_) => PrayerProvider()),
        ChangeNotifierProvider(create: (_) => QiblaProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => VerseProvider()),
      ],
      child: const MuslimIDApp(),
    ),
  );
}

class MuslimIDApp extends StatelessWidget {
  const MuslimIDApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final langProvider = Provider.of<LanguageProvider>(context);
    
    return MaterialApp(
      title: 'Muslim ID',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      locale: langProvider.currentLocale,
      builder: (context, child) {
        return Directionality(
          textDirection: langProvider.isRTL ? TextDirection.rtl : TextDirection.ltr,
          child: child!,
        );
      },
      home: const SplashScreen(),
    );
  }
}
