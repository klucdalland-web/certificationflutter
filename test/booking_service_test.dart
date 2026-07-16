// test/booking_service_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:navigation/services/booking_service.dart';

void main() {
  test('BookingService stores a booking result', () async {
    const destinationName = 'Santorini';
    const guestName = 'Alice';
    const guestEmail = 'alice@example.com';

    final booking = await bookingService.book(
      destinationName: destinationName,
      guestName: guestName,
      guestEmail: guestEmail,
      numGuests: 2,
      travelDate: DateTime.now().add(const Duration(days: 30)),
    );

    expect(booking.destinationName, equals(destinationName));
    expect(booking.guestName, equals(guestName));
    expect(booking.guestEmail, equals(guestEmail));
    expect(booking.numGuests, equals(2));
    expect(bookingService.history, contains(booking));
  });
}
