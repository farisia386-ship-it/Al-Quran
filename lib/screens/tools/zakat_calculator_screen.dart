import 'package:flutter/material.dart';
import '../../config/colors.dart';

class ZakatCalculatorScreen extends StatefulWidget {
  const ZakatCalculatorScreen({super.key});

  @override
  State<ZakatCalculatorScreen> createState() => _ZakatCalculatorScreenState();
}

class _ZakatCalculatorScreenState extends State<ZakatCalculatorScreen> {
  final _wealthController = TextEditingController();
  double _zakatAmount = 0;
  bool _isEligible = false;
  final double _nisab = 85000000; // Simplified average nisab in IDR (85gr gold)

  void _calculate() {
    double wealth = double.tryParse(_wealthController.text.replaceAll('.', '')) ?? 0;
    setState(() {
      if (wealth >= _nisab) {
        _isEligible = true;
        _zakatAmount = wealth * 0.025;
      } else {
        _isEligible = false;
        _zakatAmount = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kalkulator Zakat Mal')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Hitung Zakat Harta (2.5%)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _wealthController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Total Harta (Tabungan/Emas/Lainnya)',
                prefixText: 'Rp ',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
              onChanged: (_) => _calculate(),
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: _isEligible ? AppColors.primarySurface : Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: _isEligible ? AppColors.primary : Colors.grey),
              ),
              child: Column(
                children: [
                   Text(
                    _isEligible ? 'Wajib Zakat' : 'Belum Mencapai Nisab',
                    style: TextStyle(
                      color: _isEligible ? AppColors.primary : Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Rp ${_zakatAmount.toStringAsFixed(0)}',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: _isEligible ? AppColors.primary : Colors.grey,
                    ),
                  ),
                  const Divider(height: 32),
                  const Text(
                    'Nisab saat ini: ~Rp 85.000.000 (85 gr Emas)',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
