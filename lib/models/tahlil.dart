class TahlilItem {
  final String id;
  final String title;
  final String arabic;
  final String latin;
  final String translation;
  final String? audioUrl;
  final String category;

  TahlilItem({
    required this.id,
    required this.title,
    required this.arabic,
    required this.latin,
    required this.translation,
    this.audioUrl,
    required this.category,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'arabic': arabic,
    'latin': latin,
    'translation': translation,
    'audioUrl': audioUrl,
    'category': category,
  };

  factory TahlilItem.fromJson(Map<String, dynamic> json) => TahlilItem(
    id: json['id'],
    title: json['title'],
    arabic: json['arabic'],
    latin: json['latin'],
    translation: json['translation'],
    audioUrl: json['audioUrl'],
    category: json['category'],
  );
}
