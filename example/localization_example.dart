import 'package:flutter/material.dart';
import 'package:basico_core/l10n/basico_localizations.dart';

/// Exemple d'utilisation de la localisation dans basico_core
///
/// Ce fichier montre comment configurer et utiliser la localisation
/// dans votre application Flutter.
class LocalizationExampleApp extends StatelessWidget {
  const LocalizationExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basico Core Localization Example',

      // Configuration de la localisation
      localizationsDelegates: BasicoLocalizations.localizationsDelegates,
      supportedLocales: BasicoLocalizations.supportedLocales,

      // La locale par défaut sera déterminée automatiquement
      // en fonction de la langue du système
      // Pour forcer une locale spécifique, utilisez :
      // locale: const Locale('fr'), // ou Locale('en')

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LocalizationExamplePage(),
    );
  }
}

class LocalizationExamplePage extends StatelessWidget {
  const LocalizationExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Récupération de l'instance de localisation
    final l10n = BasicoLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Localisation - ${l10n.localeName}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Exemples de chaînes localisées :',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),

            // Exemples de chaînes simples
            _LocalizedTextExample(
              label: 'start',
              value: l10n.start,
            ),
            _LocalizedTextExample(
              label: 'previous',
              value: l10n.previous,
            ),
            _LocalizedTextExample(
              label: 'next',
              value: l10n.next,
            ),
            _LocalizedTextExample(
              label: 'accept',
              value: l10n.accept,
            ),
            _LocalizedTextExample(
              label: 'refuse',
              value: l10n.refuse,
            ),
            _LocalizedTextExample(
              label: 'cancel',
              value: l10n.cancel,
            ),
            _LocalizedTextExample(
              label: 'validate',
              value: l10n.validate,
            ),
            _LocalizedTextExample(
              label: 'warning',
              value: l10n.warning,
            ),

            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),

            // Exemple avec paramètre
            Text(
              'Exemple avec paramètre :',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            _LocalizedTextExample(
              label: 'iHaveReadTheTerms("Mon App")',
              value: l10n.iHaveReadTheTerms('Mon App'),
            ),

            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),

            // Information sur la locale actuelle
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Informations :',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text('Locale actuelle : ${l10n.localeName}'),
                    Text(
                        'Langue système : ${Localizations.localeOf(context).languageCode}'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LocalizedTextExample extends StatelessWidget {
  final String label;
  final String value;

  const _LocalizedTextExample({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          SizedBox(
            width: 200,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const LocalizationExampleApp());
}
