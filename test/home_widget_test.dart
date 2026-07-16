// test/home_widget_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:navigation/main.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  testWidgets('Home shows Explore button and toggles theme', (tester) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      // Bouton Explore visible
      expect(find.text('Explore All Destinations'), findsOneWidget);

      // Icon initial (ThemeMode.light -> dark_mode icon)
      expect(find.byIcon(Icons.dark_mode), findsOneWidget);

      // Toggle theme
      await tester.tap(find.byIcon(Icons.dark_mode));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.light_mode), findsOneWidget);
    });
  });

  testWidgets('Navigate to Explore screen', (tester) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Explore All Destinations'));
      await tester.pumpAndSettle();

      expect(find.text('Explore Destinations'), findsOneWidget);
    });
  });
}
