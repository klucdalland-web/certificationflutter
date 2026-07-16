// main.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/home_screen.dart';
import 'screens/explore_list_screen.dart';
import 'screens/detail_screen.dart';
import 'screens/booking_screen.dart';
import 'screens/booking_confirmation_screen.dart';
import 'screens/booking_history_screen.dart';
import 'models/booking.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ValueNotifier<ThemeMode> _themeNotifier = ValueNotifier(
    ThemeMode.light,
  );

  late final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => HomeScreen(themeNotifier: _themeNotifier),
      ),
      GoRoute(
        path: '/explore',
        name: 'explore',
        builder: (context, state) =>
            ExploreListScreen(category: state.uri.queryParameters['category']),
      ),
      GoRoute(
        path: '/details/:id',
        name: 'details',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return DetailScreen(destinationId: id);
        },
      ),
      GoRoute(
        path: '/booking',
        name: 'booking',
        builder: (context, state) {
          final destinationName =
              state.uri.queryParameters['name'] ?? 'Unknown destination';
          return BookingScreen(destinationName: destinationName);
        },
      ),
      GoRoute(
        path: '/booking/confirmation',
        name: 'bookingConfirmation',
        builder: (context, state) {
          final booking = state.extra as Booking?;
          if (booking == null) {
            return const Scaffold(
              body: Center(child: Text('Booking confirmation unavailable.')),
            );
          }
          return BookingConfirmationScreen(booking: booking);
        },
      ),
      GoRoute(
        path: '/history',
        name: 'history',
        builder: (context, state) => const BookingHistoryScreen(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _themeNotifier,
      builder: (context, currentThemeMode, child) {
        return MaterialApp.router(
          title: 'ExploreWorld',
          debugShowCheckedModeBanner: false,
          themeMode: currentThemeMode,
          theme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: Colors.teal,
            brightness: Brightness.light,
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: Colors.teal,
            brightness: Brightness.dark,
          ),
          routerConfig: _router,
        );
      },
    );
  }
}
