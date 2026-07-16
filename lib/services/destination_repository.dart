// services/destination_repository.dart
import '../data/destination_data.dart';
import '../models/destination.dart';

class DestinationRepository {
  const DestinationRepository();

  List<Destination> getAll() => DestinationData.destinations;

  List<String> get categories => DestinationData.categories;

  Destination getById(String id) {
    return DestinationData.destinations.firstWhere(
      (d) => d.id == id,
      orElse: () => DestinationData.destinations.first,
    );
  }
}

const destinationRepository = DestinationRepository();
