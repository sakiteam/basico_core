// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'basico_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class BasicoLocalizationsEn extends BasicoLocalizations {
  BasicoLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get requiredField => 'This field is required!';

  @override
  String get start => 'Start';

  @override
  String get previous => 'Previous';

  @override
  String get next => 'Next';

  @override
  String get oneSecondPlease => 'One second please!';

  @override
  String get beforeStartingPleaseConsult => 'Before starting, please consult ';

  @override
  String get termsOfService => 'the Terms of Service (ToS)';

  @override
  String get ofThePlatform => ' of the platform!';

  @override
  String iHaveReadTheTerms(String appName) {
    return 'I have really read the ToS of $appName';
  }

  @override
  String get refuse => 'Refuse';

  @override
  String get accept => 'Accept';

  @override
  String get cancel => 'Cancel';

  @override
  String get validate => 'Validate';

  @override
  String get ok => 'OK';

  @override
  String get warning => 'Warning';

  @override
  String get abandonFormWarning =>
      'Do you really want to abandon filling out the form?';

  @override
  String get quit => 'Quit';
}
