import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/colors.dart';
import '../../data/prayer_guide_data.dart';

class PrayerGuideScreen extends StatelessWidget {
  const PrayerGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panduan Sholat'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: prayerGuides.length,
        itemBuilder: (context, index) {
          final guide = prayerGuides[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 20),
            clipBehavior: Clip.antiAlias,
            child: ExpansionTile(
              leading: const CircleAvatar(
                backgroundColor: AppColors.primarySurface,
                child: Icon(Icons.menu_book, color: AppColors.primary),
              ),
              title: Text(
                guide.title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text(guide.description, maxLines: 2, overflow: TextOverflow.ellipsis),
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _Header(text: 'Niat Sholat'),
                      const SizedBox(height: 12),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.primary.withOpacity(0.1)),
                        ),
                        child: Column(
                          children: [
                            Text(
                              guide.niatArabic,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.amiri(fontSize: 22, height: 1.8),
                            ),
                            const SizedBox(height: 12),
                            Text(guide.niatLatin, textAlign: TextAlign.center, style: const TextStyle(fontStyle: FontStyle.italic)),
                            const SizedBox(height: 8),
                            Text(guide.niatTranslation, textAlign: TextAlign.center, style: const TextStyle(fontSize: 13, color: Colors.grey)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      const _Header(text: 'Tata Cara'),
                      const SizedBox(height: 12),
                      ...guide.steps.asMap().entries.map((entry) {
                        int i = entry.key;
                        PrayerStep step = entry.value;
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 12,
                                backgroundColor: AppColors.primary,
                                child: Text('${i + 1}', style: const TextStyle(color: Colors.white, fontSize: 12)),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(step.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                                    Text(step.description, style: const TextStyle(fontSize: 13, color: Colors.grey)),
                                    if (step.arabic != null) ...[
                                      const SizedBox(height: 8),
                                      Text(step.arabic!, style: GoogleFonts.amiri(fontSize: 18, color: AppColors.primary)),
                                    ]
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
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

class _Header extends StatelessWidget {
  final String text;
  const _Header({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }
}
