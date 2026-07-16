import '../models/destination.dart';

class DestinationData {
  static const List<Destination> destinations = [
    Destination(
      id: '1',
      name: 'Santorini',
      location: 'Greece',
      description: 'Famous for its stunning sunsets, white-washed buildings, and blue domes overlooking the Aegean Sea.',
      price: 1200,
      rating: 4.8,
      category: 'Beach',
      imageUrl: 'https://images.unsplash.com/photo-1570077188670-e3a8d69ac5ff?auto=format&fit=crop&q=80&w=800',
      duration: '5 Days',
    ),
    Destination(
      id: '2',
      name: 'Swiss Alps',
      location: 'Switzerland',
      description: 'Experience the ultimate mountain adventure with breathtaking landscapes and world-class skiing.',
      price: 1500,
      rating: 4.9,
      category: 'Mountain',
      imageUrl: 'https://images.unsplash.com/photo-1531310197839-ccf54634509e?auto=format&fit=crop&q=80&w=800',
      duration: '7 Days',
    ),
    Destination(
      id: '3',
      name: 'Kyoto',
      location: 'Japan',
      description: 'A city that perfectly blends ancient traditions with modern life, featuring beautiful temples and gardens.',
      price: 1800,
      rating: 4.7,
      category: 'City',
      imageUrl: 'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?auto=format&fit=crop&q=80&w=800',
      duration: '6 Days',
    ),
    Destination(
      id: '4',
      name: 'Bora Bora',
      location: 'French Polynesia',
      description: 'Luxury overwater bungalows and turquoise lagoons make this the perfect romantic getaway.',
      price: 2500,
      rating: 4.9,
      category: 'Beach',
      imageUrl: 'https://images.unsplash.com/photo-1532408840957-031d8034aeef?auto=format&fit=crop&q=80&w=800',
      duration: '4 Days',
    ),
    Destination(
      id: '5',
      name: 'Banff National Park',
      location: 'Canada',
      description: 'Discover the majesty of the Canadian Rockies with emerald lakes and abundant wildlife.',
      price: 1100,
      rating: 4.6,
      category: 'Mountain',
      imageUrl: 'https://images.unsplash.com/photo-1517411032315-54ef2cb783bb?auto=format&fit=crop&q=80&w=800',
      duration: '5 Days',
    ),
    Destination(
      id: '6',
      name: 'Marrakech',
      location: 'Morocco',
      description: 'A vibrant city filled with bustling souks, beautiful palaces, and rich cultural heritage.',
      price: 900,
      rating: 4.5,
      category: 'City',
      imageUrl: 'https://images.unsplash.com/photo-1539020140153-e479b8c22e70?auto=format&fit=crop&q=80&w=800',
      duration: '3 Days',
    ),
  ];

  static List<String> get categories => ['All', 'Beach', 'Mountain', 'City'];
}
