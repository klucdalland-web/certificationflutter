// test/booking_history_screen_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:navigation/main.dart';
import 'package:navigation/services/booking_service.dart';

void main() {
  testWidgets('Booking history screen shows recent reservations', (
    tester,
  ) async {
    final booking = await bookingService.book(
      destinationName: 'Santorini',
      guestName: 'Test User',
      guestEmail: 'test@example.com',
      numGuests: 3,
      travelDate: DateTime.now().add(const Duration(days: 10)),
    );

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.byTooltip('Booking history'), findsOneWidget);
    await tester.tap(find.byTooltip('Booking history'));
    await tester.pumpAndSettle();

    expect(find.text('Booking History'), findsOneWidget);
    expect(find.text(booking.destinationName), findsOneWidget);
    expect(
      find.textContaining('Voyageur : ${booking.guestName}'),
      findsOneWidget,
    );
  });
}
