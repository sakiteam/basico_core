// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'basico_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class BasicoLocalizationsFr extends BasicoLocalizations {
  BasicoLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get requiredField => 'Ce champ est obligatoire !';

  @override
  String get start => 'Commencer';

  @override
  String get previous => 'Précédent';

  @override
  String get next => 'Suivant';

  @override
  String get oneSecondPlease => 'Une seconde s\'il vous plaît !';

  @override
  String get beforeStartingPleaseConsult =>
      'Avant de commencer, veuillez consulter ';

  @override
  String get termsOfService => 'les conditions générales d\'utilisation (CGU)';

  @override
  String get ofThePlatform => ' de la plateforme !';

  @override
  String iHaveReadTheTerms(String appName) {
    return 'J\'ai vraiment lu les CGU de $appName';
  }

  @override
  String get refuse => 'Refuser';

  @override
  String get accept => 'Accepter';

  @override
  String get cancel => 'Annuler';

  @override
  String get validate => 'Valider';

  @override
  String get ok => 'OK';

  @override
  String get warning => 'Avertissement';

  @override
  String get abandonFormWarning =>
      'Voulez-vous vraiment abandonner le remplissage du formulaire ?';

  @override
  String get quit => 'Quitter';
}
