import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_ur.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('ru'),
    Locale('tr'),
    Locale('ur'),
  ];

  /// No description provided for @app_title.
  ///
  /// In id, this message translates to:
  /// **'Muslim ID'**
  String get app_title;

  /// No description provided for @home.
  ///
  /// In id, this message translates to:
  /// **'Beranda'**
  String get home;

  /// No description provided for @quran.
  ///
  /// In id, this message translates to:
  /// **'Quran'**
  String get quran;

  /// No description provided for @prayer.
  ///
  /// In id, this message translates to:
  /// **'Sholat'**
  String get prayer;

  /// No description provided for @dua.
  ///
  /// In id, this message translates to:
  /// **'Doa'**
  String get dua;

  /// No description provided for @hadith.
  ///
  /// In id, this message translates to:
  /// **'Hadis'**
  String get hadith;

  /// No description provided for @qibla.
  ///
  /// In id, this message translates to:
  /// **'Kiblat'**
  String get qibla;

  /// No description provided for @ai_helper.
  ///
  /// In id, this message translates to:
  /// **'AI Helper'**
  String get ai_helper;

  /// No description provided for @tasbih.
  ///
  /// In id, this message translates to:
  /// **'Tasbih'**
  String get tasbih;

  /// No description provided for @settings.
  ///
  /// In id, this message translates to:
  /// **'Setelan'**
  String get settings;

  /// No description provided for @last_read.
  ///
  /// In id, this message translates to:
  /// **'Terakhir Dibaca'**
  String get last_read;

  /// No description provided for @ayah_no.
  ///
  /// In id, this message translates to:
  /// **'Ayat No'**
  String get ayah_no;

  /// No description provided for @daily_verse.
  ///
  /// In id, this message translates to:
  /// **'Ayat Hari Ini'**
  String get daily_verse;

  /// No description provided for @next_prayer.
  ///
  /// In id, this message translates to:
  /// **'Menuju'**
  String get next_prayer;

  /// No description provided for @waiting_time.
  ///
  /// In id, this message translates to:
  /// **'Menghitung waktu...'**
  String get waiting_time;

  /// No description provided for @prayer_time_active.
  ///
  /// In id, this message translates to:
  /// **'Waktunya Sholat'**
  String get prayer_time_active;

  /// No description provided for @location_active.
  ///
  /// In id, this message translates to:
  /// **'Lokasi GPS Aktif'**
  String get location_active;

  /// No description provided for @location_searching.
  ///
  /// In id, this message translates to:
  /// **'Mencari Lokasi...'**
  String get location_searching;

  /// No description provided for @location_failed.
  ///
  /// In id, this message translates to:
  /// **'Gagal mendapatkan lokasi'**
  String get location_failed;

  /// No description provided for @language_settings.
  ///
  /// In id, this message translates to:
  /// **'Bahasa'**
  String get language_settings;

  /// No description provided for @notification_settings.
  ///
  /// In id, this message translates to:
  /// **'Notifikasi'**
  String get notification_settings;

  /// No description provided for @about_app.
  ///
  /// In id, this message translates to:
  /// **'Tentang Aplikasi'**
  String get about_app;

  /// No description provided for @adzan_settings.
  ///
  /// In id, this message translates to:
  /// **'Pengaturan Adzan'**
  String get adzan_settings;

  /// No description provided for @adzan_sound.
  ///
  /// In id, this message translates to:
  /// **'Suara Adzan'**
  String get adzan_sound;

  /// No description provided for @adzan_volume.
  ///
  /// In id, this message translates to:
  /// **'Volume Adzan'**
  String get adzan_volume;

  /// No description provided for @test_adzan.
  ///
  /// In id, this message translates to:
  /// **'Tes Suara'**
  String get test_adzan;

  /// No description provided for @vibration.
  ///
  /// In id, this message translates to:
  /// **'Getaran'**
  String get vibration;

  /// No description provided for @silent_mode.
  ///
  /// In id, this message translates to:
  /// **'Mode Senyap'**
  String get silent_mode;

  /// No description provided for @pre_adhan_reminder.
  ///
  /// In id, this message translates to:
  /// **'Pengingat Sebelum Adzan'**
  String get pre_adhan_reminder;

  /// No description provided for @minutes.
  ///
  /// In id, this message translates to:
  /// **'Menit'**
  String get minutes;

  /// No description provided for @save.
  ///
  /// In id, this message translates to:
  /// **'Simpan'**
  String get save;

  /// No description provided for @cancel.
  ///
  /// In id, this message translates to:
  /// **'Batal'**
  String get cancel;

  /// No description provided for @dark_mode.
  ///
  /// In id, this message translates to:
  /// **'Mode Gelap'**
  String get dark_mode;

  /// No description provided for @select_muadzin.
  ///
  /// In id, this message translates to:
  /// **'Pilih Muadzin'**
  String get select_muadzin;

  /// No description provided for @search_surah.
  ///
  /// In id, this message translates to:
  /// **'Cari Surah...'**
  String get search_surah;

  /// No description provided for @zakat.
  ///
  /// In id, this message translates to:
  /// **'Zakat'**
  String get zakat;

  /// No description provided for @asmaul_husna.
  ///
  /// In id, this message translates to:
  /// **'Asmaul Husna'**
  String get asmaul_husna;

  /// No description provided for @prayer_guide.
  ///
  /// In id, this message translates to:
  /// **'Panduan Sholat'**
  String get prayer_guide;

  /// No description provided for @tahlil.
  ///
  /// In id, this message translates to:
  /// **'Tahlil'**
  String get tahlil;

  /// No description provided for @refresh.
  ///
  /// In id, this message translates to:
  /// **'Segarkan'**
  String get refresh;

  /// No description provided for @arabic.
  ///
  /// In id, this message translates to:
  /// **'Arab'**
  String get arabic;

  /// No description provided for @translation.
  ///
  /// In id, this message translates to:
  /// **'Terjemahan'**
  String get translation;

  /// No description provided for @copy.
  ///
  /// In id, this message translates to:
  /// **'Salin'**
  String get copy;

  /// No description provided for @share.
  ///
  /// In id, this message translates to:
  /// **'Bagikan'**
  String get share;

  /// No description provided for @bookmark.
  ///
  /// In id, this message translates to:
  /// **'Tandai'**
  String get bookmark;

  /// No description provided for @current_prayer.
  ///
  /// In id, this message translates to:
  /// **'Sholat Saat Ini'**
  String get current_prayer;

  /// No description provided for @fajr.
  ///
  /// In id, this message translates to:
  /// **'Subuh'**
  String get fajr;

  /// No description provided for @syuruq.
  ///
  /// In id, this message translates to:
  /// **'Syuruq'**
  String get syuruq;

  /// No description provided for @dhuhr.
  ///
  /// In id, this message translates to:
  /// **'Dzuhur'**
  String get dhuhr;

  /// No description provided for @asr.
  ///
  /// In id, this message translates to:
  /// **'Ashar'**
  String get asr;

  /// No description provided for @maghrib.
  ///
  /// In id, this message translates to:
  /// **'Maghrib'**
  String get maghrib;

  /// No description provided for @isha.
  ///
  /// In id, this message translates to:
  /// **'Isya'**
  String get isha;

  /// No description provided for @calibrate_compass.
  ///
  /// In id, this message translates to:
  /// **'Cara Kalibrasi'**
  String get calibrate_compass;

  /// No description provided for @qibla_detected.
  ///
  /// In id, this message translates to:
  /// **'Kiblat Terdeteksi'**
  String get qibla_detected;

  /// No description provided for @qibla_searching.
  ///
  /// In id, this message translates to:
  /// **'Pegang Datar & Putar Perangkat'**
  String get qibla_searching;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'en',
    'id',
    'it',
    'ja',
    'ko',
    'ru',
    'tr',
    'ur',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'ru':
      return AppLocalizationsRu();
    case 'tr':
      return AppLocalizationsTr();
    case 'ur':
      return AppLocalizationsUr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
