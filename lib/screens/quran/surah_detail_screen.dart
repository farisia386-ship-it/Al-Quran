import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../config/colors.dart';
import '../../models/surah.dart';
import '../../models/ayah.dart';
import '../../services/quran_service.dart';
import '../../providers/quran_provider.dart';

class SurahDetailScreen extends StatefulWidget {
  final Surah surah;

  const SurahDetailScreen({super.key, required this.surah});

  @override
  State<SurahDetailScreen> createState() => _SurahDetailScreenState();
}

class _SurahDetailScreenState extends State<SurahDetailScreen> {
  final QuranService _quranService = QuranService();
  List<Ayah> _ayahs = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchAyahs();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<QuranProvider>(context, listen: false).updateLastRead(widget.surah.name, 1);
    });
  }

  Future<void> _fetchAyahs() async {
    final ayahs = await _quranService.getSurahDetail(widget.surah.number);
    if (mounted) {
      setState(() {
        _ayahs = ayahs;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.surah.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
          : Column(
              children: [
                _buildHeader(context),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: _ayahs.length,
                    itemBuilder: (context, index) {
                      final ayah = _ayahs[index];
                      return _buildAyahItem(context, ayah);
                    },
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            widget.surah.englishName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            widget.surah.englishTranslation,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 16,
            ),
          ),
          const Divider(color: Colors.white24, height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.surah.revelationTypeId,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.circle, color: Colors.white54, size: 4),
              const SizedBox(width: 8),
              Text(
                '${widget.surah.numberOfAyahs} Ayat',
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(height: 24),
          if (widget.surah.number != 1 && widget.surah.number != 9)
            Text(
              'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ',
              style: GoogleFonts.amiri(
                color: Colors.white,
                fontSize: 28,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildAyahItem(BuildContext context, Ayah ayah) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkSurface : AppColors.primarySurface.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.primary,
                  radius: 14,
                  child: Text(
                    '${ayah.numberInSurah}',
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                const Spacer(),
                const Icon(Icons.share_outlined, size: 20, color: AppColors.primary),
                const SizedBox(width: 16),
                const Icon(Icons.play_arrow_outlined, size: 24, color: AppColors.primary),
                const SizedBox(width: 16),
                const Icon(Icons.bookmark_border_outlined, size: 20, color: AppColors.primary),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            ayah.arabicText,
            textAlign: TextAlign.right,
            style: GoogleFonts.amiri(
              fontSize: 26,
              height: 2,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            ayah.translation ?? '',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 14,
              color: isDark ? Colors.white70 : AppColors.textSecondary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
