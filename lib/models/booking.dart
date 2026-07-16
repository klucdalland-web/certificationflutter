// models/booking.dart
class Booking {
  final String destinationName;
  final String guestName;
  final String guestEmail;
  final int numGuests;
  final DateTime travelDate;
  final DateTime bookedAt;

  const Booking({
    required this.destinationName,
    required this.guestName,
    required this.guestEmail,
    required this.numGuests,
    required this.travelDate,
    required this.bookedAt,
  });

  String get formattedTravelDate => '${travelDate.day}/${travelDate.month}/${travelDate.year}';
  String get bookedAtLabel => '${bookedAt.day}/${bookedAt.month}/${bookedAt.year} ${bookedAt.hour.toString().padLeft(2, '0')}:${bookedAt.minute.toString().padLeft(2, '0')}';
}
