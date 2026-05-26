import 'package:flutter/material.dart';
import '../../config/colors.dart';
import '../../data/hadith_data.dart';

class HadithScreen extends StatelessWidget {
  const HadithScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hadits Pilihan'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: hadithList.length,
        itemBuilder: (context, index) {
          final hadith = hadithList[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ExpansionTile(
              leading: const CircleAvatar(
                backgroundColor: AppColors.primarySurface,
                child: Icon(Icons.format_quote, color: AppColors.primary),
              ),
              title: Text(
                hadith.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Riwayat ${hadith.narrator}'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        hadith.arabic,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Amiri',
                          height: 2,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        hadith.translation,
                        textAlign: TextAlign.left,
                        style: const TextStyle(fontSize: 14, height: 1.5),
                      ),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          hadith.source,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
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
