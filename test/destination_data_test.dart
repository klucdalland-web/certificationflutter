// test/destination_data_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:navigation/data/destination_data.dart';

void main() {
  test('categories contains All and known categories', () {
    final cats = DestinationData.categories;
    expect(cats, contains('All'));
    expect(cats, contains('Beach'));
    expect(cats.length, greaterThanOrEqualTo(4));
  });

  test('destinations non vide et ids uniques', () {
    final list = DestinationData.destinations;
    expect(list, isNotEmpty);
    final ids = list.map((d) => d.id).toSet();
    expect(ids.length, equals(list.length));
  });
}
