# Basico Core

A Flutter package providing core UI components and utilities with built-in internationalization support.

## Features

- **UI Components**: Custom widgets for common UI patterns (buttons, text fields, alerts, etc.)
- **Navigation Utilities**: Helper functions for navigation and dialogs
- **Presentation Flow**: Ready-to-use presentation pages with terms acceptance
- **Internationalization**: Full i18n support with French and English translations using Flutter's intl package

## Supported Languages

- 🇫🇷 French (fr) - Default
- 🇬🇧 English (en)

## Getting started

Add this package to your `pubspec.yaml`:

```yaml
dependencies:
  basico_core:
    path: ../basico_core  # or your package path
```

## Usage

### Setting up Localization

In your `MaterialApp`, configure the localization delegates:

```dart
import 'package:flutter/material.dart';
import 'package:basico_core/basico_core.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: BasicoLocalizations.localizationsDelegates,
      supportedLocales: BasicoLocalizations.supportedLocales,
      home: MyHomePage(),
    );
  }
}
```

### Using Localized Strings

Access localized strings in your widgets:

```dart
import 'package:basico_core/basico_core.dart';

Widget build(BuildContext context) {
  final l10n = BasicoLocalizations.of(context)!;
  
  return CustomButton(
    label: l10n.start,
    onPressed: () {},
  );
}
```

### Using UI Components

```dart
import 'package:basico_core/basico_core.dart';

// Custom Button
CustomButton(
  label: 'Click me',
  onPressed: () {},
)

// Custom Text Field
CustomTextField(
  label: 'Email',
  isRequired: true,
  keyboardType: TextInputType.email,
)

// Custom Alert
showDialog(
  context: context,
  builder: (_) => CustomAlert(
    title: 'Warning',
    description: 'Are you sure?',
    onAccepted: () {},
  ),
);
```

## Localization

The package uses Flutter's official internationalization system with `intl`. All UI strings are automatically translated based on the device locale.

For more details on localization, see [LOCALIZATION.md](LOCALIZATION.md).

### Available Localized Strings

- Navigation: `start`, `previous`, `next`
- Actions: `accept`, `refuse`, `cancel`, `validate`, `ok`, `quit`
- Messages: `warning`, `requiredField`, `abandonFormWarning`
- Terms: `termsOfService`, `iHaveReadTheTerms(appName)`
- And more...

## Example

See the [example](example/) folder for a complete working example demonstrating localization features.

## Additional information

This package is designed to provide a consistent UI experience across Flutter applications with built-in internationalization support.
