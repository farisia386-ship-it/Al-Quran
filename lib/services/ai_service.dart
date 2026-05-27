import 'dart:math';
import '../data/islamic_knowledge_data.dart';
import '../data/doa_data.dart';
import '../data/hadith_data.dart';

/// AI Service that provides intelligent Islamic Q&A responses.
/// Uses keyword matching + fuzzy search against a local knowledge database.
/// Falls back to smart responses when no match is found.
class AiService {
  static final Random _random = Random();

  /// Main method: process user query and return AI response.
  static Future<String> getResponse(String query, {String lang = 'id'}) async {
    final normalizedQuery = query.toLowerCase().trim();

    // 1. Check greetings first
    final greetingResponse = _checkGreeting(normalizedQuery, lang);
    if (greetingResponse != null) return greetingResponse;

    // 2. Check thank you
    final thankYouResponse = _checkThankYou(normalizedQuery, lang);
    if (thankYouResponse != null) return thankYouResponse;

    // 3. Check daily motivation request
    if (_isMotivationRequest(normalizedQuery)) {
      return _getDailyMotivation(lang);
    }

    // 4. Check for doa-specific search
    final doaResponse = _searchDoa(normalizedQuery, lang);
    if (doaResponse != null) return doaResponse;

    // 5. Check for hadith-specific search
    final hadithResponse = _searchHadith(normalizedQuery, lang);
    if (hadithResponse != null) return hadithResponse;

    // 6. Search the main knowledge database
    final knowledgeResponse = _searchKnowledgeDB(normalizedQuery, lang);
    if (knowledgeResponse != null) return knowledgeResponse;

    // 7. Fallback
    return _getFallbackResponse(lang);
  }

  // ─── GREETING DETECTION ──────────────────────────────────────────────────
  static String? _checkGreeting(String query, String lang) {
    final salamKeywords = [
      'assalamuala', 'assalamu\'ala', 'assalamualaikum', 'salam',
      'waalaikum', 'السلام عليكم', 'السلام',
    ];
    final helloKeywords = [
      'hai', 'halo', 'hello', 'hi ', 'hey', 'pagi', 'malam',
      'siang', 'sore', 'good morning', 'good evening',
      'مرحبا', 'أهلا',
    ];
    final howAreYouKeywords = [
      'apa kabar', 'kabar', 'how are you', 'howdy',
      'كيف حالك', 'gimana', 'bagaimana kabarmu',
    ];

    for (final kw in salamKeywords) {
      if (query.contains(kw)) {
        final responses = greetingResponses;
        final response = responses[_random.nextInt(responses.length)];
        return response[lang] ?? response['id'] ?? '';
      }
    }

    for (final kw in howAreYouKeywords) {
      if (query.contains(kw)) {
        final responses = howAreYouResponses;
        final response = responses[_random.nextInt(responses.length)];
        return response[lang] ?? response['id'] ?? '';
      }
    }

    for (final kw in helloKeywords) {
      if (query.contains(kw)) {
        final responses = helloResponses;
        final response = responses[_random.nextInt(responses.length)];
        return response[lang] ?? response['id'] ?? '';
      }
    }

    return null;
  }

  // ─── THANK YOU DETECTION ─────────────────────────────────────────────────
  static String? _checkThankYou(String query, String lang) {
    final thankKeywords = [
      'terima kasih', 'makasih', 'thanks', 'thank you',
      'jazakallah', 'barakallah', 'syukron', 'شكرا',
    ];
    for (final kw in thankKeywords) {
      if (query.contains(kw)) {
        for (final k in islamicKnowledgeDB) {
          if (k.id == 'thank_you') {
            return k.responses[lang] ?? k.responses['id'] ?? '';
          }
        }
      }
    }
    return null;
  }

  // ─── MOTIVATION REQUEST ──────────────────────────────────────────────────
  static bool _isMotivationRequest(String query) {
    final motivationKeywords = [
      'motivasi', 'semangat', 'inspire', 'motivation', 'quote',
      'sedih', 'galau', 'depresi', 'putus asa', 'stress',
      'cemas', 'takut', 'gelisah', 'down', 'sad', 'depressed',
    ];
    return motivationKeywords.any((kw) => query.contains(kw));
  }

  static String _getDailyMotivation(String lang) {
    // Combine knowledge DB motivation + daily quotes
    String? knowledgeMotivation;
    for (final k in islamicKnowledgeDB) {
      if (k.id == 'motivasi') {
        knowledgeMotivation = k.responses[lang] ?? k.responses['id'];
        break;
      }
    }

    // 50% chance of showing the structured knowledge vs daily quote
    if (_random.nextBool() && knowledgeMotivation != null) {
      return knowledgeMotivation;
    }

    final quote = dailyIslamicQuotes[_random.nextInt(dailyIslamicQuotes.length)];
    return quote[lang] ?? quote['id'] ?? '';
  }

  // ─── DOA SEARCH ──────────────────────────────────────────────────────────
  static String? _searchDoa(String query, String lang) {
    // Only trigger for specific doa queries
    final doaTriggers = ['doa sebelum', 'doa sesudah', 'doa masuk', 'doa keluar',
      'doa makan', 'doa tidur', 'doa bepergian', 'doa naik',
      'doa bercermin', 'doa wudhu', 'doa hujan', 'doa orang tua',
      'doa sakit', 'doa pagi', 'doa sore', 'doa belajar', 'doa rezeki',
      'doa ampunan', 'doa istighfar', 'doa pakaian',
    ];

    bool isSpecificDoaQuery = doaTriggers.any((t) => query.contains(t));
    if (!isSpecificDoaQuery) return null;

    // Search in the existing doa database
    for (final doa in doaList) {
      final title = doa.title.toLowerCase();
      // Try to match title words with query
      final titleWords = title.split(' ').where((w) => w.length > 2).toList();
      final matchCount = titleWords.where((w) => query.contains(w)).length;
      if (matchCount >= 2 || query.contains(title)) {
        return "🤲 **${doa.title}**\n\n🕋 Arab:\n${doa.arabic}\n\n📝 Latin:\n${doa.latin}\n\n📖 Terjemahan:\n${doa.translation}\n\n📚 Sumber: ${doa.source}\n\n💡 Temukan doa lainnya di fitur Doa Harian aplikasi ini!";
      }
    }

    return null;
  }

  // ─── HADITH SEARCH ───────────────────────────────────────────────────────
  static String? _searchHadith(String query, String lang) {
    final hadithTriggers = ['hadits tentang', 'hadist tentang', 'hadith about',
      'hadis tentang', 'cari hadits', 'cari hadist', 'search hadith',
    ];

    bool isHadithQuery = hadithTriggers.any((t) => query.contains(t));
    if (!isHadithQuery) return null;

    // Extract the topic after "tentang" or "about"
    String topic = query;
    for (final trigger in hadithTriggers) {
      if (query.contains(trigger)) {
        topic = query.substring(query.indexOf(trigger) + trigger.length).trim();
        break;
      }
    }

    for (final hadith in hadithList) {
      final title = hadith.title.toLowerCase();
      final translation = hadith.translation.toLowerCase();
      if (title.contains(topic) || translation.contains(topic) || topic.contains(title)) {
        return "📜 **${hadith.title}**\n\n🕋 Arab:\n${hadith.arabic}\n\n📖 Terjemahan:\n${hadith.translation}\n\n👤 Perawi: ${hadith.narrator}\n📚 Sumber: ${hadith.source}\n📂 Kategori: ${hadith.category}\n\n💡 Temukan hadits lainnya di fitur Hadits Harian!";
      }
    }

    return null;
  }

  // ─── KNOWLEDGE DB SEARCH ─────────────────────────────────────────────────
  static String? _searchKnowledgeDB(String query, String lang) {
    int bestScore = 0;
    IslamicKnowledge? bestMatch;

    for (final knowledge in islamicKnowledgeDB) {
      int score = 0;
      for (final keyword in knowledge.keywords) {
        final kw = keyword.toLowerCase();
        if (query.contains(kw)) {
          // Longer keyword matches get higher score
          score += kw.length;
        }
        // Also check if keyword contains query words
        final queryWords = query.split(' ').where((w) => w.length > 2).toList();
        for (final qw in queryWords) {
          if (kw.contains(qw)) {
            score += qw.length;
          }
        }
      }
      if (score > bestScore) {
        bestScore = score;
        bestMatch = knowledge;
      }
    }

    // Minimum threshold to consider a match
    if (bestScore >= 3 && bestMatch != null) {
      return bestMatch.responses[lang] ?? bestMatch.responses['id'] ?? '';
    }

    return null;
  }

  // ─── FALLBACK ────────────────────────────────────────────────────────────
  static String _getFallbackResponse(String lang) {
    final responses = fallbackResponses[lang] ?? fallbackResponses['id']!;
    return responses[_random.nextInt(responses.length)];
  }

  // ─── DAILY QUOTE FOR WIDGET ──────────────────────────────────────────────
  static String getDailyQuote(String lang) {
    final dayOfYear = DateTime.now().difference(DateTime(DateTime.now().year, 1, 1)).inDays;
    final index = dayOfYear % dailyIslamicQuotes.length;
    final quote = dailyIslamicQuotes[index];
    return quote[lang] ?? quote['id'] ?? '';
  }

  // ─── GET QUICK SUGGESTIONS ──────────────────────────────────────────────
  static List<String> getQuickSuggestions(String lang) {
    return quickSuggestions[lang] ?? quickSuggestions['id'] ?? [];
  }
}
