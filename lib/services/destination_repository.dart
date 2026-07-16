// services/destination_repository.dart
import '../data/destination_data.dart';
import '../models/destination.dart';

class DestinationRepository {
  const DestinationRepository();

  List<Destination> getAll() => DestinationData.destinations;

  List<String> get categories => DestinationData.categories;

  Destination? getById(String id) {
    for (final destination in DestinationData.destinations) {
      if (destination.id == id) {
        return destination;
      }
    }
    return null;
  }
}

const destinationRepository = DestinationRepository();
