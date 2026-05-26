import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../config/colors.dart';
import '../../models/daily_verse.dart';
import '../../providers/verse_provider.dart';

class VerseDetailScreen extends StatefulWidget {
  final DailyVerse verse;
  const VerseDetailScreen({super.key, required this.verse});

  @override
  State<VerseDetailScreen> createState() => _VerseDetailScreenState();
}

class _VerseDetailScreenState extends State<VerseDetailScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _toggleAudio() async {
    if (widget.verse.audioUrl == null) return;

    if (_isPlaying) {
      await _audioPlayer.stop();
      setState(() => _isPlaying = false);
    } else {
      await _audioPlayer.play(UrlSource(widget.verse.audioUrl!));
      setState(() => _isPlaying = true);
      _audioPlayer.onPlayerComplete.listen((_) {
        if (mounted) setState(() => _isPlaying = false);
      });
    }
  }

  void _shareVerse() {
    final text = "${widget.verse.surahName}: ${widget.verse.ayahNumber}\n\n"
        "${widget.verse.arabic}\n\n"
        "${widget.verse.translation}\n\n"
        "Refleksi: ${widget.verse.reflection}";
    Share.share(text);
  }

  void _copyVerse() {
    final text = "${widget.verse.arabic}\n\n${widget.verse.translation}";
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Ayat berhasil disalin!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final verseProvider = Provider.of<VerseProvider>(context);
    final isFavorite = verseProvider.isFavorite(widget.verse.id);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Ayat'),
        actions: [
          IconButton(
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border, color: isFavorite ? Colors.red : null),
            onPressed: () => verseProvider.toggleFavorite(widget.verse.id),
          ),
          IconButton(
            icon: const Icon(Icons.share_outlined),
            onPressed: _shareVerse,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  widget.verse.category.toUpperCase(),
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                widget.verse.arabic,
                textAlign: TextAlign.center,
                style: GoogleFonts.amiri(
                  fontSize: 28,
                  height: 1.8,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                widget.verse.latin,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  color: AppColors.gold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                widget.verse.translation,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18, height: 1.5),
              ),
              const SizedBox(height: 16),
              Text(
                "${widget.verse.surahName}: ${widget.verse.ayahNumber}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 40),
              if (widget.verse.audioUrl != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton.filled(
                      onPressed: _toggleAudio,
                      icon: Icon(_isPlaying ? Icons.stop : Icons.play_arrow),
                      style: IconButton.styleFrom(backgroundColor: AppColors.primary),
                    ),
                    const SizedBox(width: 20),
                    IconButton.outlined(
                      onPressed: _copyVerse,
                      icon: const Icon(Icons.copy),
                    ),
                  ],
                ),
              const SizedBox(height: 48),
              _buildInfoSection('Tafsir', widget.verse.tafsir, Icons.menu_book),
              const SizedBox(height: 24),
              _buildInfoSection('Daily Reflection', widget.verse.reflection, Icons.lightbulb_outline),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoSection(String title, String content, IconData icon) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primarySurface.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppColors.primary, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: const TextStyle(fontSize: 15, height: 1.6),
          ),
        ],
      ),
    );
  }
}
