import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'basico_localizations_en.dart';
import 'basico_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of BasicoLocalizations
/// returned by `BasicoLocalizations.of(context)`.
///
/// Applications need to include `BasicoLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/basico_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: BasicoLocalizations.localizationsDelegates,
///   supportedLocales: BasicoLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the BasicoLocalizations.supportedLocales
/// property.
abstract class BasicoLocalizations {
  BasicoLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static BasicoLocalizations? of(BuildContext context) {
    return Localizations.of<BasicoLocalizations>(context, BasicoLocalizations);
  }

  static const LocalizationsDelegate<BasicoLocalizations> delegate =
      _BasicoLocalizationsDelegate();

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
    Locale('en'),
    Locale('fr'),
  ];

  /// Message d'erreur pour un champ obligatoire
  ///
  /// In fr, this message translates to:
  /// **'Ce champ est obligatoire !'**
  String get requiredField;

  /// Bouton pour commencer
  ///
  /// In fr, this message translates to:
  /// **'Commencer'**
  String get start;

  /// Bouton précédent
  ///
  /// In fr, this message translates to:
  /// **'Précédent'**
  String get previous;

  /// Bouton suivant
  ///
  /// In fr, this message translates to:
  /// **'Suivant'**
  String get next;

  /// Titre de la page des conditions
  ///
  /// In fr, this message translates to:
  /// **'Une seconde s\'il vous plaît !'**
  String get oneSecondPlease;

  /// Texte avant le lien des CGU
  ///
  /// In fr, this message translates to:
  /// **'Avant de commencer, veuillez consulter '**
  String get beforeStartingPleaseConsult;

  /// Lien vers les CGU
  ///
  /// In fr, this message translates to:
  /// **'les conditions générales d\'utilisation (CGU)'**
  String get termsOfService;

  /// Texte après le lien des CGU
  ///
  /// In fr, this message translates to:
  /// **' de la plateforme !'**
  String get ofThePlatform;

  /// Texte de confirmation de lecture des CGU
  ///
  /// In fr, this message translates to:
  /// **'J\'ai vraiment lu les CGU de {appName}'**
  String iHaveReadTheTerms(String appName);

  /// Bouton refuser
  ///
  /// In fr, this message translates to:
  /// **'Refuser'**
  String get refuse;

  /// Bouton accepter
  ///
  /// In fr, this message translates to:
  /// **'Accepter'**
  String get accept;

  /// Bouton annuler
  ///
  /// In fr, this message translates to:
  /// **'Annuler'**
  String get cancel;

  /// Bouton valider
  ///
  /// In fr, this message translates to:
  /// **'Valider'**
  String get validate;

  /// Bouton OK
  ///
  /// In fr, this message translates to:
  /// **'OK'**
  String get ok;

  /// Titre d'avertissement
  ///
  /// In fr, this message translates to:
  /// **'Avertissement'**
  String get warning;

  /// Message d'avertissement pour abandon de formulaire
  ///
  /// In fr, this message translates to:
  /// **'Voulez-vous vraiment abandonner le remplissage du formulaire ?'**
  String get abandonFormWarning;

  /// Bouton quitter
  ///
  /// In fr, this message translates to:
  /// **'Quitter'**
  String get quit;
}

class _BasicoLocalizationsDelegate
    extends LocalizationsDelegate<BasicoLocalizations> {
  const _BasicoLocalizationsDelegate();

  @override
  Future<BasicoLocalizations> load(Locale locale) {
    return SynchronousFuture<BasicoLocalizations>(
      lookupBasicoLocalizations(locale),
    );
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_BasicoLocalizationsDelegate old) => false;
}

BasicoLocalizations lookupBasicoLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return BasicoLocalizationsEn();
    case 'fr':
      return BasicoLocalizationsFr();
  }

  throw FlutterError(
    'BasicoLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
