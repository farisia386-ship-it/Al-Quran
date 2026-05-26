import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/colors.dart';

class AsmaulHusnaScreen extends StatelessWidget {
  const AsmaulHusnaScreen({super.key});

  final List<Map<String, String>> names = const [
    {'ar': 'الرحمن', 'id': 'Maha Pengasih', 'en': 'The Most Merciful'},
    {'ar': 'الرحيم', 'id': 'Maha Penyayang', 'en': 'The Most Compassionate'},
    {'ar': 'الملك', 'id': 'Maha Raja', 'en': 'The King'},
    {'ar': 'القدوس', 'id': 'Maha Suci', 'en': 'The Holy'},
    {'ar': 'السلام', 'id': 'Maha Sejahtera', 'en': 'The Giver of Peace'},
    // ... adding more for demo
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Asmaul Husna')),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: names.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  names[index]['ar']!,
                  style: GoogleFonts.amiri(fontSize: 32, color: AppColors.primary, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  names[index]['id']!,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                Text(
                   names[index]['en']!,
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
