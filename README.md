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

If you want, I can add examples for deep links, shell routes, or a bottom navigation bar.
