# Exemple de localisation

Ce dossier contient un exemple d'utilisation de la localisation dans basico_core.

## Tester l'exemple

Pour tester l'exemple de localisation :

```bash
flutter run example/localization_example.dart
```

## Changer la langue

Pour tester les différentes langues, vous pouvez :

1. **Changer la langue du système** : L'application utilisera automatiquement la langue du système si elle est supportée (français ou anglais).

2. **Forcer une locale spécifique** : Décommentez et modifiez la ligne `locale` dans le `MaterialApp` :
   ```dart
   MaterialApp(
     locale: const Locale('en'), // Force l'anglais
     // ou
     locale: const Locale('fr'), // Force le français
     ...
   )
   ```

3. **Utiliser les outils de développement Flutter** : Dans l'IDE ou avec les commandes Flutter DevTools, vous pouvez changer la locale à la volée.

## Structure de l'exemple

L'exemple montre :
- Comment configurer `MaterialApp` avec les delegates de localisation
- Comment accéder aux chaînes localisées avec `BasicoLocalizations.of(context)`
- Comment utiliser des chaînes avec paramètres
- Comment obtenir des informations sur la locale actuelle

## Langues supportées

- Français (fr)
- Anglais (en)
