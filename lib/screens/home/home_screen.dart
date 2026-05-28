import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import '../../config/colors.dart';
import '../../providers/prayer_provider.dart';
import '../../providers/quran_provider.dart';
import '../hadith/hadith_screen.dart';
import '../ai_assistant/ai_assistant_screen.dart';
import '../tasbih/tasbih_screen.dart';
import '../prayer/qibla_screen.dart';
import 'verse_detail_screen.dart';
import '../../providers/verse_provider.dart';
import '../../models/daily_verse.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PrayerProvider>(context, listen: false).initPrayerTimes();
    });
  }

  @override
  Widget build(BuildContext context) {
    final prayerProvider = Provider.of<PrayerProvider>(context);
    final l10n = AppLocalizations.of(context)!;
    
    final nextPrayerTime = prayerProvider.nextPrayerTime;
    final nextPrayerKey = prayerProvider.nextPrayerKey;
    final nextPrayerName = nextPrayerKey.isNotEmpty 
        ? _getLocalizedPrayerName(nextPrayerKey, l10n) 
        : "-";

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: AppColors.headerGradient,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 60),
                      Text(
                        'Assalamu\'alaikum, Akhy',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        prayerProvider.isLoading 
                            ? l10n.waiting_time 
                            : '${l10n.next_prayer} $nextPrayerName',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildCountdown(nextPrayerTime, l10n),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.location_on, color: AppColors.goldLight, size: 14),
                          const SizedBox(width: 4),
                          Text(
                            prayerProvider.locationName == 'location_active' 
                                ? l10n.location_active 
                                : (prayerProvider.locationName == 'location_searching' 
                                    ? l10n.location_searching 
                                    : l10n.location_failed),
                            style: const TextStyle(
                              color: AppColors.goldLight,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildQuickMenu(context, l10n),
                  const SizedBox(height: 24),
                  _buildLastReadCard(context, l10n),
                  const SizedBox(height: 24),
                  _buildDailyVerseSection(context, l10n),
                ],
              ),
            ),
          ),
        ],
      ),
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

  Widget _buildCountdown(DateTime? nextTime, AppLocalizations l10n) {
    if (nextTime == null) return const SizedBox();
    
    final now = DateTime.now();
    final difference = nextTime.difference(now);
    
    if (difference.isNegative) {
      return Text(l10n.prayer_time_active, style: const TextStyle(color: Colors.white, fontSize: 18));
    }

    final hours = difference.inHours;
    final minutes = difference.inMinutes.remainder(60);
    final seconds = difference.inSeconds.remainder(60);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        ),
      ),
    );
  }

  Widget _buildQuickMenu(BuildContext context, AppLocalizations l10n) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _menuItem(context, Icons.mosque, l10n.qibla, AppColors.primary, () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const QiblaScreen()));
          }),
          const SizedBox(width: 20),
          _menuItem(context, Icons.auto_stories, l10n.hadith, AppColors.info, () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const HadithScreen()));
          }),
          const SizedBox(width: 20),
          _menuItem(context, Icons.fingerprint, l10n.tasbih, AppColors.gold, () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const TasbihScreen()));
          }),
          const SizedBox(width: 20),
          _menuItem(context, Icons.support_agent, l10n.ai_helper, AppColors.error, () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const AiAssistantScreen()));
          }),
        ],
      ),
    );
  }

  Widget _menuItem(BuildContext context, IconData icon, String label, Color color, VoidCallback onTap) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon, color: color, size: 30),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white : AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLastReadCard(BuildContext context, AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.book_outlined, color: Colors.white, size: 18),
                    const SizedBox(width: 8),
                    Text(
                      l10n.last_read,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  Provider.of<QuranProvider>(context).lastReadSurah,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${l10n.ayah_no}: ${Provider.of<QuranProvider>(context).lastReadAyah}',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.play_circle_fill, color: AppColors.gold, size: 50),
        ],
      ),
    );
  }

  Widget _buildDailyVerseSection(BuildContext context, AppLocalizations l10n) {
    final verseProvider = Provider.of<VerseProvider>(context);
    final verse = verseProvider.currentVerse;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (verse == null) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              l10n.daily_verse,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.refresh, size: 20, color: AppColors.primary),
              onPressed: () => verseProvider.refreshVerse(),
            ),
          ],
        ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => VerseDetailScreen(verse: verse)),
            );
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkCard : Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    verse.category.toUpperCase(),
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  verse.arabic,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.amiri(
                    fontSize: 22,
                    height: 1.6,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  verse.translation,
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    color: isDark ? Colors.white70 : AppColors.textSecondary,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${verse.surahName}: ${verse.ayahNumber}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.arrow_forward, size: 12, color: AppColors.primary),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
