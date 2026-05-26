import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:share_plus/share_plus.dart';
import '../../config/colors.dart';
import '../../data/tahlil_data.dart';
import '../../models/tahlil.dart';
import 'tahlil_settings_screen.dart';

class TahlilScreen extends StatefulWidget {
  const TahlilScreen({super.key});

  @override
  State<TahlilScreen> createState() => _TahlilScreenState();
}

class _TahlilScreenState extends State<TahlilScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  int? _playingIndex;
  final Set<String> _bookmarks = {};

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _playAudio(String url, int index) async {
    if (_playingIndex == index) {
      await _audioPlayer.stop();
      setState(() {
        _playingIndex = null;
      });
    } else {
      await _audioPlayer.play(UrlSource(url));
      setState(() {
        _playingIndex = index;
      });
    }
  }

  void _shareItem(TahlilItem item) {
    String content = "${item.title}\n\n${item.arabic}\n\n${item.latin}\n\n${item.translation}";
    Share.share(content);
  }

  void _toggleBookmark(String id) {
    setState(() {
      if (_bookmarks.contains(id)) {
        _bookmarks.remove(id);
      } else {
        _bookmarks.add(id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tahlil Lengkap'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const TahlilSettingsScreen()));
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: tahlilData.length,
        itemBuilder: (context, index) {
          final item = tahlilData[index];
          final isPlaying = _playingIndex == index;
          final isBookmarked = _bookmarks.contains(item.id);

          return Card(
            margin: const EdgeInsets.only(bottom: 20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  decoration: const BoxDecoration(
                    color: AppColors.primarySurface,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          item.id,
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              item.category,
                              style: const TextStyle(fontSize: 12, color: AppColors.textMuted),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                          color: isBookmarked ? AppColors.primary : null,
                        ),
                        onPressed: () => _toggleBookmark(item.id),
                      ),
                      IconButton(
                        icon: const Icon(Icons.share_outlined),
                        onPressed: () => _shareItem(item),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        item.arabic,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.amiri(
                          fontSize: 24,
                          height: 2.0,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        item.latin,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          color: AppColors.gold,
                          fontSize: 14,
                        ),
                      ),
                      const Divider(height: 32),
                      Text(
                        item.translation,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 14, height: 1.5),
                      ),
                    ],
                  ),
                ),
                if (item.audioUrl != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12, left: 20, right: 20),
                    child: ElevatedButton.icon(
                      onPressed: () => _playAudio(item.audioUrl!, index),
                      icon: Icon(isPlaying ? Icons.stop : Icons.play_arrow),
                      label: Text(isPlaying ? 'Berhenti' : 'Putar Audio'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isPlaying ? Colors.red : AppColors.primary,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
