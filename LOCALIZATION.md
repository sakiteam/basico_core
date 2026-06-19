# Localisation avec intl

Ce projet utilise le système de localisation officiel de Flutter avec le package `intl`.

## Configuration

Les fichiers de configuration sont :
- `l10n.yaml` : Configuration de la génération des fichiers de localisation
- `lib/l10n/basico_fr.arb` : Fichier de traduction français (langue par défaut)
- `lib/l10n/basico_en.arb` : Fichier de traduction anglais

## Langues supportées

- Français (fr) - langue par défaut
- Anglais (en)

## Utilisation dans votre application

Pour utiliser la localisation dans votre application Flutter, ajoutez les delegates et locales supportées dans votre `MaterialApp` :

```dart
import 'package:flutter/material.dart';
import 'package:basico_core/l10n/basico_localizations.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: BasicoLocalizations.localizationsDelegates,
      supportedLocales: BasicoLocalizations.supportedLocales,
      // ... reste de votre configuration
    );
  }
}
```

## Utilisation dans les widgets

Pour accéder aux chaînes localisées dans vos widgets :

```dart
import 'package:basico_core/l10n/basico_localizations.dart';

// Dans votre widget
Text(BasicoLocalizations.of(context)!.start)
```

## Ajouter de nouvelles traductions

1. Ajoutez la clé et la traduction dans `lib/l10n/basico_fr.arb` :
```json
{
  "myNewKey": "Ma nouvelle traduction",
  "@myNewKey": {
    "description": "Description de la traduction"
  }
}
```

2. Ajoutez la traduction anglaise dans `lib/l10n/basico_en.arb` :
```json
{
  "myNewKey": "My new translation",
  "@myNewKey": {
    "description": "Translation description"
  }
}
```

3. Les fichiers de localisation seront automatiquement régénérés lors de la prochaine compilation avec `flutter run` ou `flutter build`.

## Traductions avec paramètres

Pour les traductions avec des paramètres dynamiques :

```json
{
  "welcome": "Bienvenue {name}",
  "@welcome": {
    "description": "Message de bienvenue",
    "placeholders": {
      "name": {
        "type": "String",
        "example": "Jean"
      }
    }
  }
}
```

Utilisation :
```dart
Text(BasicoLocalizations.of(context)!.welcome('Jean'))
```

## Chaînes actuellement localisées

- `requiredField` : Message d'erreur pour champ obligatoire
- `start` : Bouton commencer
- `previous` : Bouton précédent
- `next` : Bouton suivant
- `oneSecondPlease` : Titre de la page des conditions
- `beforeStartingPleaseConsult` : Texte avant le lien des CGU
- `termsOfService` : Lien vers les CGU
- `ofThePlatform` : Texte après le lien des CGU
- `iHaveReadTheTerms` : Confirmation de lecture des CGU (avec paramètre)
- `refuse` : Bouton refuser
- `accept` : Bouton accepter
- `cancel` : Bouton annuler
- `validate` : Bouton valider
- `ok` : Bouton OK
- `warning` : Titre d'avertissement
- `abandonFormWarning` : Message d'avertissement pour abandon de formulaire
- `quit` : Bouton quitter
