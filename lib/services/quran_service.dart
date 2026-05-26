import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/constants.dart';
import '../models/surah.dart';
import '../models/ayah.dart';

class QuranService {
  Future<List<Surah>> getSurahList() async {
    try {
      final response = await http.get(Uri.parse('${AppConstants.quranApiBase}/surah'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> list = data['data'];
        return list.map((e) => Surah.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<List<Ayah>> getSurahDetail(int surahNumber) async {
    try {
      final response = await http.get(
        Uri.parse('${AppConstants.quranApiBase}/surah/$surahNumber/editions/quran-uthmani,id.indonesian'),
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> arabicData = data['data'][0]['ayahs'];
        final List<dynamic> translationData = data['data'][1]['ayahs'];
        
        List<Ayah> ayahs = [];
        for (int i = 0; i < arabicData.length; i++) {
          final ayah = Ayah.fromArabicJson(arabicData[i]);
          ayahs.add(ayah.copyWithTranslation(translationData[i]['text']));
        }
        return ayahs;
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}
