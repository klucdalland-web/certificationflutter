# navigation

A Flutter sample app with `go_router` and light/dark theme support.

## Features

- Navigation using `go_router` with named routes: `/`, `/explore`, `/details/:id`, `/booking`.
- Light and dark themes controlled by a `ValueNotifier<ThemeMode>` and toggle button in the home screen.
- Material 3 (`useMaterial3`) with a seeded color scheme.

## Run

1. Install dependencies:

```bash
flutter pub get
```

2. Run on a device / emulator:

```bash
flutter run
```

Use `r` (hot reload) or `R` (hot restart) in the `flutter run` terminal.

## Web: remove `#` from URLs

By default Flutter Web uses hash (`/#/settings`). To use clean paths like `/settings` add the following import and call in `main()`:

```dart
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
	setUrlStrategy(PathUrlStrategy());
	runApp(const MyApp());
}
```

Remember to configure your web server to redirect all routes to `index.html` when using path-based URLs.

## Theme behavior

- The app initializes the theme with a `ValueNotifier<ThemeMode>` (default `light`).
- `MaterialApp.router` uses `theme` and `darkTheme`; changing the notifier updates the UI immediately.
- To follow the system theme by default, set the notifier to `ThemeMode.system`.

## Notes

- `go_router` is declared in `pubspec.yaml`.
- Screens are under `lib/screens/` (`home_screen.dart`, `explore_list_screen.dart`, etc.).

## Architecture

- Project follows a simple layered approach: `models` (data classes), `data` (static in-memory seed data), `services` (repositories), and `screens` (UI). This helps keep UI code free from direct data access logic.
- `BookingService` simulates backend behavior and supports a confirmation screen after payment details are submitted.

## Screens

- `HomeScreen` : accueil et navigation vers les catégories.
- `ExploreListScreen` : recherche, filtrage par catégorie et affichage adaptatif mobile/tablette.
- `DetailScreen` : détails d’une destination avec bouton de réservation.
- `BookingScreen` : formulaire de réservation avec validation et date picker.
- `BookingHistoryScreen` : consultation de l'historique des réservations.
- `BookingConfirmationScreen` : confirmation finale de la réservation.

## Tests & CI

- Unit, widget et integration tests sont inclus.
- `test/` contient des tests pour les données, l’interface et le flux de réservation.
- `integration_test/app_test.dart` vérifie le lancement de l’application et la navigation de base.
- Un workflow GitHub Actions est inclus à `.github/workflows/flutter_test.yml` pour exécuter les tests sur push/PR.

## Exécution des tests

```bash
flutter test
flutter test integration_test/app_test.dart
```

## Responsive & accessibility notes

- `ExploreListScreen` adapte entre `ListView` et `GridView` en fonction de la largeur disponible.
- Le hero de la page d’accueil est proportionnel à la hauteur de l’écran pour une meilleure expérience tablette.

If you want, I can also add a small `service` test, integration tests, or sample screenshots to this README.

If you want, I can add examples for deep links, shell routes, or a bottom navigation bar.
