class Surah {
  final int number;
  final String name;
  final String arabicName;
  final String englishName;
  final String englishTranslation;
  final int numberOfAyahs;
  final String revelationType;

  const Surah({
    required this.number,
    required this.name,
    required this.arabicName,
    required this.englishName,
    required this.englishTranslation,
    required this.numberOfAyahs,
    required this.revelationType,
  });

  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(
      number: json['number'] as int,
      name: json['name'] as String,
      arabicName: json['name'] as String,
      englishName: json['englishName'] as String,
      englishTranslation: json['englishNameTranslation'] as String,
      numberOfAyahs: json['numberOfAyahs'] as int,
      revelationType: json['revelationType'] as String,
    );
  }

  String get revelationTypeId =>
      revelationType == 'Meccan' ? 'Makkiyah' : 'Madaniyah';
}
