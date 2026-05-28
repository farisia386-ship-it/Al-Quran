import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:math' as math;
import '../../config/colors.dart';
import '../../providers/qibla_provider.dart';

class QiblaScreen extends StatefulWidget {
  const QiblaScreen({super.key});

  @override
  State<QiblaScreen> createState() => _QiblaScreenState();
}

class _QiblaScreenState extends State<QiblaScreen> {
  @override
  void initState() {
    super.initState();
    _initQibla();
  }

  Future<void> _initQibla() async {
    final provider = Provider.of<QiblaProvider>(context, listen: false);
    await provider.requestPermission();
    
    // Calculate distance if location is available
    final position = await Geolocator.getCurrentPosition();
    provider.calculateDistance(position.latitude, position.longitude);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QiblaProvider>(context);
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.qibla),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => _showCalibrationDialog(context, l10n),
          ),
        ],
      ),
      body: FutureBuilder(
        future: FlutterQiblah.checkLocationStatus(),
        builder: (context, AsyncSnapshot<LocationStatus> locationSnapshot) {
          if (locationSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: AppColors.primary));
          }

          if (locationSnapshot.data?.enabled == false || locationSnapshot.data?.status == LocationPermission.denied) {
            return _buildPermissionError(l10n);
          }

          return StreamBuilder(
            stream: FlutterQiblah.qiblahStream,
            builder: (context, AsyncSnapshot<QiblahDirection> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator(color: AppColors.primary));
              }

              if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}", style: TextStyle(color: isDark ? Colors.white : Colors.black)));
              }

              if (!snapshot.hasData || snapshot.data == null) {
                return _buildSensorError();
              }

              final qiblahDirection = snapshot.data!;
              
              // Trigger alignment check for vibration
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Provider.of<QiblaProvider>(context, listen: false)
                    .checkAlignment(qiblahDirection.direction, qiblahDirection.offset);
              });

              return _buildQiblaUI(qiblahDirection, provider, isDark, l10n);
            },
          );
        },
      ),
    );
  }

  Widget _buildQiblaUI(QiblahDirection direction, QiblaProvider provider, bool isDark, AppLocalizations l10n) {
    final isAligned = provider.isAligned;

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          _buildInfoCards(direction, provider, l10n),
          const SizedBox(height: 40),
          _buildCompass(direction, isAligned, isDark),
          const SizedBox(height: 40),
          _buildInstructions(isAligned, l10n),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildInfoCards(QiblahDirection direction, QiblaProvider provider, AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: _statCard(
              "Derajat", // can be localized if desired, but keeping minimal translation overhead
              "${direction.direction.toInt()}°",
              Icons.explore_outlined,
              AppColors.primary,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _statCard(
              "Jarak KM", // can be localized
              provider.distanceToMecca.toStringAsFixed(0),
              Icons.location_on_outlined,
              AppColors.gold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _statCard(String label, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }

  Widget _buildCompass(QiblahDirection direction, bool isAligned, bool isDark) {
    // We use AnimatedRotation to smooth out the stream data jitter naturally.
    final turns = (direction.direction * -1) / 360;
    final qiblaTurns = (direction.qiblah * -1) / 360;

    return Stack(
      alignment: Alignment.center,
      children: [
        // Glow effect when aligned
        if (isAligned)
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: 320,
            height: 320,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.2),
                  blurRadius: 50,
                  spreadRadius: 20,
                )
              ],
            ),
          ),
        
        // Compass Background (rotates with device smoothly)
        AnimatedRotation(
          turns: turns,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOutCubic,
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: isDark ? Colors.white12 : Colors.grey.shade200, width: 2),
              color: isDark ? Colors.white.withOpacity(0.05) : Colors.white,
            ),
            child: Stack(
              children: [
                // Direction indicators
                for (int i = 0; i < 360; i += 30)
                  Positioned.fill(
                    child: Transform.rotate(
                      angle: i * (math.pi / 180),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          margin: const EdgeInsets.only(top: 15),
                          width: i % 90 == 0 ? 3 : 1,
                          height: i % 90 == 0 ? 15 : 10,
                          color: i == 0 ? AppColors.error : (i % 90 == 0 ? AppColors.primary : Colors.grey.withOpacity(0.5)),
                        ),
                      ),
                    ),
                  ),
                const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("N", style: TextStyle(color: AppColors.error, fontWeight: FontWeight.bold, fontSize: 20)),
                      SizedBox(height: 180),
                      Text("S", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        
        // Qibla Indicator (points to Kaaba) smoothly
        AnimatedRotation(
          turns: qiblaTurns,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOutCubic,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: isAligned ? AppColors.primary : Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary, width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: isAligned ? AppColors.primary.withOpacity(0.5) : Colors.black12,
                      blurRadius: 15,
                    )
                  ],
                ),
                child: Icon(
                  Icons.mosque,
                  color: isAligned ? Colors.white : AppColors.primary,
                  size: 40,
                ),
              ),
              const SizedBox(height: 200), // Push the icon to the top half of the stack
            ],
          ),
        ),

        // Center Point
        Container(
          width: 12,
          height: 12,
          decoration: const BoxDecoration(
            color: AppColors.gold,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }

  Widget _buildInstructions(bool isAligned, AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Text(
              isAligned ? l10n.qibla_detected : l10n.qibla_searching,
              key: ValueKey(isAligned),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isAligned ? AppColors.primary : Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          TextButton.icon(
            onPressed: () => _showCalibrationDialog(context, l10n),
            icon: const Icon(Icons.refresh, size: 18),
            label: Text(l10n.calibrate_compass),
          ),
        ],
      ),
    );
  }

  Widget _buildPermissionError(AppLocalizations l10n) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_off_outlined, size: 80, color: AppColors.error),
            const SizedBox(height: 24),
            Text(
              l10n.location_failed,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => _initQibla(),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text("Refresh"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSensorError() {
    return const Center(child: Text("Sensor error / not found."));
  }

  void _showCalibrationDialog(BuildContext context, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.calibrate_compass),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Gerakkan perangkat membentuk angka 8."),
            SizedBox(height: 20),
            Icon(Icons.vibration, size: 40, color: AppColors.primary),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK")),
        ],
      ),
    );
  }
}
