class DailyVerse {
  final String id;
  final String surahName;
  final int surahNumber;
  final int ayahNumber;
  final String arabic;
  final String latin;
  final String translation;
  final String tafsir;
  final String category;
  final String reflection;
  final String? audioUrl;

  DailyVerse({
    required this.id,
    required this.surahName,
    required this.surahNumber,
    required this.ayahNumber,
    required this.arabic,
    required this.latin,
    required this.translation,
    required this.tafsir,
    required this.category,
    required this.reflection,
    this.audioUrl,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'surahName': surahName,
    'surahNumber': surahNumber,
    'ayahNumber': ayahNumber,
    'arabic': arabic,
    'latin': latin,
    'translation': translation,
    'tafsir': tafsir,
    'category': category,
    'reflection': reflection,
    'audioUrl': audioUrl,
  };

  factory DailyVerse.fromJson(Map<String, dynamic> json) => DailyVerse(
    id: json['id'],
    surahName: json['surahName'],
    surahNumber: json['surahNumber'],
    ayahNumber: json['ayahNumber'],
    arabic: json['arabic'],
    latin: json['latin'],
    translation: json['translation'],
    tafsir: json['tafsir'],
    category: json['category'],
    reflection: json['reflection'],
    audioUrl: json['audioUrl'],
  );
}
