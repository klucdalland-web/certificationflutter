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

## Tests & CI

- Unit and widget tests are under `test/`. Widget tests mock network images using `network_image_mock`.
- A GitHub Actions workflow is included at `.github/workflows/flutter_test.yml` to run tests on push/PR.

## Responsive & accessibility notes

- `ExploreListScreen` adapts between `ListView` and `GridView` based on available width.
- The home hero section uses a proportional height via `LayoutBuilder` for better tablet support.

If you want, I can also add a small `service` test, integration tests, or sample screenshots to this README.

If you want, I can add examples for deep links, shell routes, or a bottom navigation bar.
