import 'package:flutter/material.dart';
import '../../config/colors.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Aplikasi'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.primarySurface,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.mosque,
                size: 80,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Muslim ID',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            const Text(
              'Versi 1.0.0+1',
              style: TextStyle(
                color: AppColors.textMuted,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Muslim ID adalah aplikasi premium untuk memenuhi kebutuhan ibadah harian Anda. Dilengkapi dengan fitur Quran, Jadwal Sholat, Arah Kiblat, Doa, Dzikir, dan Tahlil Lengkap.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, height: 1.6),
            ),
            const SizedBox(height: 40),
            _buildInfoTile(Icons.code, 'Dikembangkan oleh', 'Antigravity AI'),
            _buildInfoTile(Icons.favorite, 'Dibuat dengan', 'Flutter & Material 3'),
            _buildInfoTile(Icons.location_on, 'Sumber Lokasi', 'GPS & Geolocation'),
            _buildInfoTile(Icons.access_time, 'Sumber Jadwal', 'Adhan Package (MWL)'),
            const SizedBox(height: 40),
            const Text(
              '© 2026 Muslim ID. Hak Cipta Dilindungi.',
              style: TextStyle(color: AppColors.textMuted, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(title, style: const TextStyle(fontSize: 14, color: AppColors.textMuted)),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }
}
