import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/colors.dart';
import '../../data/doa_data.dart';
import 'prayer_guide_screen.dart';
import 'dzikir_detail_screen.dart';
import 'tahlil_screen.dart';

class DoaScreen extends StatelessWidget {
  const DoaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Doa & Dzikir'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Daftar Doa'),
              Tab(text: 'Dzikir'),
            ],
            indicatorColor: AppColors.primary,
            labelColor: AppColors.primary,
          ),
        ),
        body: TabBarView(
          children: [
            _buildDoaList(context),
            _buildDzikirSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDoaList(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: doaList.length,
      itemBuilder: (context, index) {
        final doa = doaList[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ExpansionTile(
            title: Text(
              doa.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(doa.category),
            leading: const CircleAvatar(
              backgroundColor: AppColors.primarySurface,
              child: Icon(Icons.person_outline, color: AppColors.primary),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      doa.arabic,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.amiri(
                        fontSize: 20,
                        height: 1.8,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      doa.latin,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      doa.translation,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDzikirSection(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _dzikirCard(context, 'Tahlil Lengkap', Icons.format_list_bulleted, AppColors.primary, () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const TahlilScreen()));
        }),
        _dzikirCard(context, 'Panduan Sholat', Icons.auto_stories, AppColors.success, () {
           Navigator.push(context, MaterialPageRoute(builder: (_) => const PrayerGuideScreen()));
        }),
        _dzikirCard(context, 'Dzikir Pagi', Icons.wb_sunny_outlined, AppColors.gold, () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => DzikirDetailScreen(title: 'Dzikir Pagi', items: dzikirPagi)));
        }),
        _dzikirCard(context, 'Dzikir Petang', Icons.nights_stay_outlined, AppColors.info, () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => DzikirDetailScreen(title: 'Dzikir Petang', items: dzikirPetang)));
        }),
        _dzikirCard(context, 'Dzikir Setelah Sholat', Icons.mosque_outlined, AppColors.primary, () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => DzikirDetailScreen(title: 'Dzikir Setelah Sholat', items: dzikirSetelahSholat)));
        }),
      ],
    );
  }

  Widget _dzikirCard(BuildContext context, String title, IconData icon, Color color, VoidCallback onTap) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
