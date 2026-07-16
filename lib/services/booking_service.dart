// services/booking_service.dart
import '../models/booking.dart';

class BookingService {
  final List<Booking> _bookings = [];

  Future<Booking> book({
    required String destinationName,
    required String guestName,
    required String guestEmail,
    required int numGuests,
    required DateTime travelDate,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));

    final booking = Booking(
      destinationName: destinationName,
      guestName: guestName,
      guestEmail: guestEmail,
      numGuests: numGuests,
      travelDate: travelDate,
      bookedAt: DateTime.now(),
    );

    _bookings.add(booking);
    return booking;
  }

  List<Booking> get history => List.unmodifiable(_bookings);
}

final bookingService = BookingService();
