// screens/explore_list_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../services/destination_repository.dart';
import '../models/destination.dart';
import '../widgets/destination_card.dart';

class ExploreListScreen extends StatefulWidget {
  final String? category;

  const ExploreListScreen({super.key, this.category});

  @override
  State<ExploreListScreen> createState() => _ExploreListScreenState();
}

class _ExploreListScreenState extends State<ExploreListScreen> {
  late String _selectedCategory;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.category ?? 'All';
  }

  List<Destination> get _filteredDestinations {
    final all = destinationRepository.getAll();
    return all.where((d) {
      final matchesCategory = _selectedCategory == 'All' || d.category == _selectedCategory;
      final matchesSearch = d.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          d.location.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final categories = destinationRepository.categories;
    final filteredList = _filteredDestinations;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Destinations'),
      ),
      body: Column(
        children: [
          // Search and Filter Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _searchController,
                  onChanged: (value) => setState(() => _searchQuery = value),
                  decoration: InputDecoration(
                    hintText: 'Search by name or location...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: theme.colorScheme.surfaceVariant.withAlpha(100),
                  ),
                ),
                const SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: categories.map((cat) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: FilterChip(
                          label: Text(cat),
                          selected: _selectedCategory == cat,
                          onSelected: (selected) {
                            setState(() => _selectedCategory = cat);
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          // Results
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (filteredList.isEmpty) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search_off, size: 64, color: Colors.grey),
                        SizedBox(height: 16),
                        Text('No destinations found'),
                      ],
                    ),
                  );
                }

                // Responsive Layout: Grid for tablet/desktop, List for mobile
                if (constraints.maxWidth > 600) {
                  return GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.1,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: filteredList.length,
                    itemBuilder: (context, index) {
                      final dest = filteredList[index];
                      return DestinationCard(
                        destination: dest,
                        onTap: () => context.goNamed('details', pathParameters: {'id': dest.id}),
                      );
                    },
                  );
                } else {
                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: filteredList.length,
                    itemBuilder: (context, index) {
                      final dest = filteredList[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: DestinationCard(
                          destination: dest,
                          onTap: () => context.goNamed('details', pathParameters: {'id': dest.id}),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
