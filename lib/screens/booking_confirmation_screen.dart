// screens/booking_confirmation_screen.dart
import 'package:flutter/material.dart';
import '../models/booking.dart';
import 'package:go_router/go_router.dart';

class BookingConfirmationScreen extends StatelessWidget {
  final Booking booking;

  const BookingConfirmationScreen({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmation de réservation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Merci ${booking.guestName} !',
              style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'Votre réservation pour ${booking.destinationName} a bien été enregistrée.',
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: 24),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Destination : ${booking.destinationName}', style: theme.textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text('Nombre de voyageurs : ${booking.numGuests}', style: theme.textTheme.bodyLarge),
                    const SizedBox(height: 8),
                    Text('Date du voyage : ${booking.formattedTravelDate}', style: theme.textTheme.bodyLarge),
                    const SizedBox(height: 8),
                    Text('Email de contact : ${booking.guestEmail}', style: theme.textTheme.bodyLarge),
                    const SizedBox(height: 8),
                    Text('Réservé le : ${booking.bookedAtLabel}', style: theme.textTheme.bodyLarge),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Center(
                child: ElevatedButton(
                  onPressed: () => context.goNamed('home'),
                  child: const Text('Retour à l’accueil'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
