class Doa {
  final int id;
  final String title;
  final String category;
  final String arabic;
  final String latin;
  final String translation;
  final String source;
  bool isBookmarked;

  Doa({
    required this.id,
    required this.title,
    required this.category,
    required this.arabic,
    required this.latin,
    required this.translation,
    required this.source,
    this.isBookmarked = false,
  });
}

class DzikirItem {
  final String arabic;
  final String latin;
  final String translation;
  final int count;
  final String source;

  const DzikirItem({
    required this.arabic,
    required this.latin,
    required this.translation,
    required this.count,
    required this.source,
  });
}
