import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../data/destination_data.dart';
import '../widgets/rating_stars.dart';
import '../widgets/stat_badge.dart';

class DetailScreen extends StatelessWidget {
  final String destinationId;

  const DetailScreen({super.key, required this.destinationId});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final destination = DestinationData.destinations.firstWhere(
      (d) => d.id == destinationId,
      orElse: () => DestinationData.destinations.first,
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Header with Overlays
            Stack(
              children: [
                Hero(
                  tag: 'dest-${destination.id}',
                  child: Image.network(
                    destination.imageUrl,
                    height: 400,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.black.withAlpha(100),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => context.pop(),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          theme.scaffoldBackgroundColor,
                        ],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              StatBadge(
                                icon: Icons.category,
                                label: destination.category,
                                color: theme.colorScheme.primary,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                destination.name,
                                style: theme.textTheme.headlineMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '\$${destination.price.toInt()}',
                          style: theme.textTheme.headlineSmall?.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.grey, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        destination.location,
                        style: theme.textTheme.titleMedium?.copyWith(color: Colors.grey),
                      ),
                      const Spacer(),
                      RatingStars(rating: destination.rating, size: 24),
                      const SizedBox(width: 4),
                      Text(
                        '(${destination.rating})',
                        style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildInfoIcon(context, Icons.timer, destination.duration, 'Duration'),
                      _buildInfoIcon(context, Icons.wb_sunny, 'High 25°C', 'Weather'),
                      _buildInfoIcon(context, Icons.translate, 'English', 'Language'),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'About this place',
                    style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    destination.description,
                    style: theme.textTheme.bodyLarge?.copyWith(height: 1.5),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () => context.goNamed('booking', queryParameters: {'name': destination.name}),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                        foregroundColor: theme.colorScheme.onPrimary,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      child: const Text(
                        'Book Now',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoIcon(BuildContext context, IconData icon, String value, String label) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: theme.colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: theme.colorScheme.onSecondaryContainer),
        ),
        const SizedBox(height: 8),
        Text(value, style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold)),
        Text(label, style: theme.textTheme.bodySmall),
      ],
    );
  }
}
