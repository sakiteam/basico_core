# 🚀 Quick Start - Localisation

## Pour les développeurs utilisant ce package

### 1. Configuration dans votre app

```dart
import 'package:flutter/material.dart';
import 'package:basico_core/basico_core.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ⚠️ IMPORTANT : Ajouter ces deux lignes
      localizationsDelegates: BasicoLocalizations.localizationsDelegates,
      supportedLocales: BasicoLocalizations.supportedLocales,
      
      home: HomePage(),
    );
  }
}
```

### 2. Utilisation dans vos widgets

```dart
import 'package:basico_core/basico_core.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Récupérer l'instance de localisation
    final l10n = BasicoLocalizations.of(context)!;
    
    return Column(
      children: [
        // Utiliser les chaînes localisées
        Text(l10n.start),      // "Commencer" ou "Start"
        Text(l10n.cancel),     // "Annuler" ou "Cancel"
        Text(l10n.validate),   // "Valider" ou "Validate"
        
        // Avec paramètre
        Text(l10n.iHaveReadTheTerms('Mon App')),
      ],
    );
  }
}
```

### 3. Chaînes disponibles

```dart
l10n.start                          // Commencer / Start
l10n.previous                       // Précédent / Previous
l10n.next                           // Suivant / Next
l10n.accept                         // Accepter / Accept
l10n.refuse                         // Refuser / Refuse
l10n.cancel                         // Annuler / Cancel
l10n.validate                       // Valider / Validate
l10n.ok                             // OK / OK
l10n.quit                           // Quitter / Quit
l10n.warning                        // Avertissement / Warning
l10n.requiredField                  // Ce champ est obligatoire ! / This field is required!
l10n.oneSecondPlease                // Une seconde s'il vous plaît ! / One second please!
l10n.termsOfService                 // les CGU / the ToS
l10n.beforeStartingPleaseConsult    // Avant de commencer... / Before starting...
l10n.ofThePlatform                  // de la plateforme ! / of the platform!
l10n.abandonFormWarning             // Voulez-vous vraiment... / Do you really want...
l10n.iHaveReadTheTerms(appName)     // J'ai lu les CGU de {appName} / I have read the ToS of {appName}
```

## Pour les développeurs du package

### Ajouter une nouvelle traduction

1. **Éditer `lib/l10n/basico_fr.arb`** (français)
```json
{
  "myNewString": "Ma nouvelle chaîne",
  "@myNewString": {
    "description": "Description de la chaîne"
  }
}
```

2. **Éditer `lib/l10n/basico_en.arb`** (anglais)
```json
{
  "myNewString": "My new string",
  "@myNewString": {
    "description": "String description"
  }
}
```

3. **Recompiler** (les fichiers sont générés automatiquement)
```bash
flutter pub get
# ou
flutter run
```

4. **Utiliser la nouvelle chaîne**
```dart
Text(BasicoLocalizations.of(context)!.myNewString)
```

### Ajouter une traduction avec paramètres

```json
{
  "greeting": "Bonjour {name}, vous avez {count} messages",
  "@greeting": {
    "description": "Message de salutation",
    "placeholders": {
      "name": {
        "type": "String",
        "example": "Jean"
      },
      "count": {
        "type": "int",
        "example": "5"
      }
    }
  }
}
```

Utilisation :
```dart
Text(l10n.greeting('Jean', 5))
```

### Commandes utiles

```bash
# Installer les dépendances
flutter pub get

# Analyser le code
flutter analyze

# Générer les localisations (automatique avec pub get)
flutter gen-l10n

# Tester l'exemple
flutter run example/localization_example.dart
```

## Tester les langues

### Méthode 1 : Changer la langue du système
- iOS Simulator : Settings → General → Language & Region
- Android Emulator : Settings → System → Languages & input

### Méthode 2 : Forcer une locale dans le code
```dart
MaterialApp(
  locale: const Locale('en'), // Force l'anglais
  // ou
  locale: const Locale('fr'), // Force le français
  localizationsDelegates: BasicoLocalizations.localizationsDelegates,
  supportedLocales: BasicoLocalizations.supportedLocales,
  // ...
)
```

## 📚 Plus d'informations

- Guide complet : [LOCALIZATION.md](LOCALIZATION.md)
- Résumé : [LOCALIZATION_SUMMARY.md](LOCALIZATION_SUMMARY.md)
- Changelog : [CHANGELOG_LOCALIZATION.md](CHANGELOG_LOCALIZATION.md)
- Exemple : [example/localization_example.dart](example/localization_example.dart)
