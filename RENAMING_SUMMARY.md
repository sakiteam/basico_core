# 🔄 Renommage des classes de localisation

## Pourquoi ce changement ?

Pour éviter les conflits de noms avec les applications qui utilisent le package `basico_core`, les classes de localisation ont été renommées de `AppLocalizations` à `BasicoLocalizations`.

Cela permet aux applications d'avoir leurs propres `AppLocalizations` sans conflit avec celles du package.

## Changements effectués

### Fichiers de configuration

| Avant | Après |
|-------|-------|
| `lib/l10n/app_fr.arb` | `lib/l10n/basico_fr.arb` |
| `lib/l10n/app_en.arb` | `lib/l10n/basico_en.arb` |
| `lib/l10n/app_localizations.dart` | `lib/l10n/basico_localizations.dart` |
| `lib/l10n/app_localizations_fr.dart` | `lib/l10n/basico_localizations_fr.dart` |
| `lib/l10n/app_localizations_en.dart` | `lib/l10n/basico_localizations_en.dart` |

### Configuration l10n.yaml

```yaml
arb-dir: lib/l10n
template-arb-file: basico_fr.arb
output-localization-file: basico_localizations.dart
output-class: BasicoLocalizations
```

### Nom de classe

| Avant | Après |
|-------|-------|
| `AppLocalizations` | `BasicoLocalizations` |
| `AppLocalizationsFr` | `BasicoLocalizationsFr` |
| `AppLocalizationsEn` | `BasicoLocalizationsEn` |

## Utilisation

### Avant
```dart
import 'package:basico_core/l10n/app_localizations.dart';

MaterialApp(
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  supportedLocales: AppLocalizations.supportedLocales,
  // ...
)

// Dans les widgets
Text(AppLocalizations.of(context)!.start)
```

### Après
```dart
import 'package:basico_core/l10n/basico_localizations.dart';
// ou simplement
import 'package:basico_core/basico_core.dart';

MaterialApp(
  localizationsDelegates: BasicoLocalizations.localizationsDelegates,
  supportedLocales: BasicoLocalizations.supportedLocales,
  // ...
)

// Dans les widgets
Text(BasicoLocalizations.of(context)!.start)
```

## Avantages

✅ **Pas de conflit** : Les applications peuvent avoir leurs propres `AppLocalizations`  
✅ **Clarté** : Le préfixe `Basico` indique clairement que ces localisations viennent du package  
✅ **Cohérence** : Suit la convention de nommage du package (`Basico*`)  
✅ **Facilité d'utilisation** : Import simple via `package:basico_core/basico_core.dart`  

## Fichiers modifiés

### Code source (7 fichiers)
- `lib/src/view/widgets/custom_text_field.dart`
- `lib/src/view/widgets/custom_label.dart`
- `lib/src/view/widgets/custom_alert.dart`
- `lib/src/view/widgets/presentation_terms.dart`
- `lib/src/view/widgets/process_bottom_bar.dart`
- `lib/src/view/pages/presentation_page.dart`
- `lib/src/logic/utils/navigation_utils.dart`
- `lib/basico_core.dart`

### Documentation (6 fichiers)
- `README.md`
- `LOCALIZATION.md`
- `LOCALIZATION_SUMMARY.md`
- `CHANGELOG_LOCALIZATION.md`
- `QUICK_START_LOCALIZATION.md`
- `example/README.md`
- `example/localization_example.dart`

## Vérification

```bash
flutter analyze
# ✅ No issues found!
```

Tous les fichiers ont été mis à jour et le package compile sans erreur.
