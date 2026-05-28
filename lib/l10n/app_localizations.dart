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
/// import 'l10n/app_localizations.dart';
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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
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
    Locale('ur')
  ];

  /// No description provided for @app_title.
  ///
  /// In en, this message translates to:
  /// **'Muslim ID'**
  String get app_title;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @quran.
  ///
  /// In en, this message translates to:
  /// **'Quran'**
  String get quran;

  /// No description provided for @prayer.
  ///
  /// In en, this message translates to:
  /// **'Prayer'**
  String get prayer;

  /// No description provided for @dua.
  ///
  /// In en, this message translates to:
  /// **'Dua'**
  String get dua;

  /// No description provided for @hadith.
  ///
  /// In en, this message translates to:
  /// **'Hadith'**
  String get hadith;

  /// No description provided for @qibla.
  ///
  /// In en, this message translates to:
  /// **'Qibla'**
  String get qibla;

  /// No description provided for @ai_helper.
  ///
  /// In en, this message translates to:
  /// **'AI Helper'**
  String get ai_helper;

  /// No description provided for @tasbih.
  ///
  /// In en, this message translates to:
  /// **'Tasbih'**
  String get tasbih;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @last_read.
  ///
  /// In en, this message translates to:
  /// **'Last Read'**
  String get last_read;

  /// No description provided for @ayah_no.
  ///
  /// In en, this message translates to:
  /// **'Ayah No'**
  String get ayah_no;

  /// No description provided for @daily_verse.
  ///
  /// In en, this message translates to:
  /// **'Daily Verse'**
  String get daily_verse;

  /// No description provided for @next_prayer.
  ///
  /// In en, this message translates to:
  /// **'Towards'**
  String get next_prayer;

  /// No description provided for @waiting_time.
  ///
  /// In en, this message translates to:
  /// **'Calculating...'**
  String get waiting_time;

  /// No description provided for @prayer_time_active.
  ///
  /// In en, this message translates to:
  /// **'It\'s Prayer Time'**
  String get prayer_time_active;

  /// No description provided for @location_active.
  ///
  /// In en, this message translates to:
  /// **'GPS Active'**
  String get location_active;

  /// No description provided for @location_searching.
  ///
  /// In en, this message translates to:
  /// **'Seeking Location...'**
  String get location_searching;

  /// No description provided for @location_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to get location'**
  String get location_failed;

  /// No description provided for @language_settings.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language_settings;

  /// No description provided for @notification_settings.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notification_settings;

  /// No description provided for @about_app.
  ///
  /// In en, this message translates to:
  /// **'About App'**
  String get about_app;

  /// No description provided for @adzan_settings.
  ///
  /// In en, this message translates to:
  /// **'Adzan Settings'**
  String get adzan_settings;

  /// No description provided for @adzan_sound.
  ///
  /// In en, this message translates to:
  /// **'Adzan Sound'**
  String get adzan_sound;

  /// No description provided for @adzan_volume.
  ///
  /// In en, this message translates to:
  /// **'Adzan Volume'**
  String get adzan_volume;

  /// No description provided for @test_adzan.
  ///
  /// In en, this message translates to:
  /// **'Test Sound'**
  String get test_adzan;

  /// No description provided for @vibration.
  ///
  /// In en, this message translates to:
  /// **'Vibration'**
  String get vibration;

  /// No description provided for @silent_mode.
  ///
  /// In en, this message translates to:
  /// **'Silent Mode'**
  String get silent_mode;

  /// No description provided for @pre_adhan_reminder.
  ///
  /// In en, this message translates to:
  /// **'Pre-Adzan Reminder'**
  String get pre_adhan_reminder;

  /// No description provided for @minutes.
  ///
  /// In en, this message translates to:
  /// **'Minutes'**
  String get minutes;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @dark_mode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get dark_mode;

  /// No description provided for @select_muadzin.
  ///
  /// In en, this message translates to:
  /// **'Select Muadzin'**
  String get select_muadzin;

  /// No description provided for @search_surah.
  ///
  /// In en, this message translates to:
  /// **'Search Surah...'**
  String get search_surah;

  /// No description provided for @zakat.
  ///
  /// In en, this message translates to:
  /// **'Zakat'**
  String get zakat;

  /// No description provided for @asmaul_husna.
  ///
  /// In en, this message translates to:
  /// **'99 Names'**
  String get asmaul_husna;

  /// No description provided for @prayer_guide.
  ///
  /// In en, this message translates to:
  /// **'Prayer Guide'**
  String get prayer_guide;

  /// No description provided for @tahlil.
  ///
  /// In en, this message translates to:
  /// **'Tahlil'**
  String get tahlil;

  /// No description provided for @refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @translation.
  ///
  /// In en, this message translates to:
  /// **'Translation'**
  String get translation;

  /// No description provided for @copy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get copy;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @bookmark.
  ///
  /// In en, this message translates to:
  /// **'Bookmark'**
  String get bookmark;

  /// No description provided for @current_prayer.
  ///
  /// In en, this message translates to:
  /// **'Current Prayer'**
  String get current_prayer;

  /// No description provided for @fajr.
  ///
  /// In en, this message translates to:
  /// **'Fajr'**
  String get fajr;

  /// No description provided for @syuruq.
  ///
  /// In en, this message translates to:
  /// **'Sunrise'**
  String get syuruq;

  /// No description provided for @dhuhr.
  ///
  /// In en, this message translates to:
  /// **'Dhuhr'**
  String get dhuhr;

  /// No description provided for @asr.
  ///
  /// In en, this message translates to:
  /// **'Asr'**
  String get asr;

  /// No description provided for @maghrib.
  ///
  /// In en, this message translates to:
  /// **'Maghrib'**
  String get maghrib;

  /// No description provided for @isha.
  ///
  /// In en, this message translates to:
  /// **'Isha'**
  String get isha;

  /// No description provided for @calibrate_compass.
  ///
  /// In en, this message translates to:
  /// **'How to Calibrate'**
  String get calibrate_compass;

  /// No description provided for @qibla_detected.
  ///
  /// In en, this message translates to:
  /// **'Qibla Detected'**
  String get qibla_detected;

  /// No description provided for @qibla_searching.
  ///
  /// In en, this message translates to:
  /// **'Hold Flat & Rotate Device'**
  String get qibla_searching;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en', 'id', 'it', 'ja', 'ko', 'ru', 'tr', 'ur'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
    case 'id': return AppLocalizationsId();
    case 'it': return AppLocalizationsIt();
    case 'ja': return AppLocalizationsJa();
    case 'ko': return AppLocalizationsKo();
    case 'ru': return AppLocalizationsRu();
    case 'tr': return AppLocalizationsTr();
    case 'ur': return AppLocalizationsUr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
