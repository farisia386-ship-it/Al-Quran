class Ayah {
  final int number;
  final int numberInSurah;
  final String arabicText;
  final String? latinText;
  final String? translation;
  final int juz;
  final int page;
  bool isBookmarked;

  Ayah({
    required this.number,
    required this.numberInSurah,
    required this.arabicText,
    this.latinText,
    this.translation,
    required this.juz,
    required this.page,
    this.isBookmarked = false,
  });

  factory Ayah.fromArabicJson(Map<String, dynamic> json) {
    return Ayah(
      number: json['number'] as int,
      numberInSurah: json['numberInSurah'] as int,
      arabicText: json['text'] as String,
      juz: json['juz'] as int,
      page: json['page'] as int,
    );
  }

  Ayah copyWithTranslation(String translation) {
    return Ayah(
      number: number,
      numberInSurah: numberInSurah,
      arabicText: arabicText,
      latinText: latinText,
      translation: translation,
      juz: juz,
      page: page,
      isBookmarked: isBookmarked,
    );
  }
}
