// integration_test/app_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:navigation/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('App launches and navigates to Explore', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.text('Explore All Destinations'), findsOneWidget);
    await tester.tap(find.text('Explore All Destinations'));
    await tester.pumpAndSettle();

    expect(find.text('Explore Destinations'), findsOneWidget);
  });
}
