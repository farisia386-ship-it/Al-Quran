class Hadith {
  final int id;
  final String title;
  final String narrator;
  final String arabic;
  final String translation;
  final String source;
  final String category;
  bool isBookmarked;

  Hadith({
    required this.id,
    required this.title,
    required this.narrator,
    required this.arabic,
    required this.translation,
    required this.source,
    required this.category,
    this.isBookmarked = false,
  });
}
