// test/booking_flow_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:navigation/main.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  testWidgets('Full booking flow from home to confirmation', (tester) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      expect(find.text('Explore All Destinations'), findsOneWidget);
      await tester.tap(find.text('Explore All Destinations'));
      await tester.pumpAndSettle();

      expect(find.text('Explore Destinations'), findsOneWidget);
      expect(find.text('Santorini'), findsOneWidget);
      await tester.tap(find.text('Santorini'));
      await tester.pumpAndSettle();

      expect(find.text('Book Now'), findsOneWidget);
      await tester.ensureVisible(find.text('Book Now'));
      await tester.tap(find.text('Book Now'));
      await tester.pumpAndSettle();

      expect(find.text('Book Your Trip'), findsOneWidget);
      await tester.enterText(find.byType(TextFormField).first, 'Luc Test');
      await tester.enterText(find.byType(TextFormField).at(1), 'luc@example.com');
      await tester.pumpAndSettle();

      await tester.tap(find.byType(ListTile));
      await tester.pumpAndSettle();

      // Tap the OK button in the date picker dialog
      final okButton = find.text('OK');
      expect(okButton, findsOneWidget);
      await tester.tap(okButton);
      await tester.pumpAndSettle();

      await tester.tap(find.text('Confirm Booking'));
      await tester.pumpAndSettle();

      expect(find.textContaining('Merci'), findsOneWidget);
      expect(find.text('Destination : Santorini'), findsOneWidget);
    });
  });
}
