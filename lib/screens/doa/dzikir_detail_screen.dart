import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/colors.dart';
import '../../models/doa.dart';

class DzikirDetailScreen extends StatefulWidget {
  final String title;
  final List<DzikirItem> items;

  const DzikirDetailScreen({super.key, required this.title, required this.items});

  @override
  State<DzikirDetailScreen> createState() => _DzikirDetailScreenState();
}

class _DzikirDetailScreenState extends State<DzikirDetailScreen> {
  final List<int> _counters = [];

  @override
  void initState() {
    super.initState();
    // Initialize counters for each item to 0
    for (var i = 0; i < widget.items.length; i++) {
      _counters.add(0);
    }
  }

  void _incrementCounter(int index) {
    if (_counters[index] < widget.items[index].count) {
      setState(() {
        _counters[index]++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          final item = widget.items[index];
          final currentCount = _counters[index];
          final isDone = currentCount >= item.count;

          return Card(
            margin: const EdgeInsets.only(bottom: 20),
            elevation: isDone ? 0 : 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                color: isDone ? AppColors.primary.withOpacity(0.5) : Colors.transparent,
                width: 2,
              ),
            ),
            child: InkWell(
              onTap: () => _incrementCounter(index),
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: isDone ? AppColors.primary : AppColors.primarySurface,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            '$currentCount / ${item.count}',
                            style: TextStyle(
                              color: isDone ? Colors.white : AppColors.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        if (isDone)
                          const Icon(Icons.check_circle, color: AppColors.primary, size: 24),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      item.arabic,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.amiri(
                        fontSize: 24,
                        height: 1.8,
                        color: isDone ? Colors.grey : (isDark ? Colors.white : AppColors.textPrimary),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      item.translation,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        color: isDark ? Colors.white70 : AppColors.textSecondary,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        item.source,
                        style: const TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
