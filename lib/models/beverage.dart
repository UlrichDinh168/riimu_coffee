import 'package:riimu_coffee/models/available_items.dart';
import 'package:riimu_coffee/models/inventory_items.dart';

class Beverage {
  const Beverage({
    required this.id,
    required this.title,
    required this.labels,
    required this.inventoryItems,
    required this.persons,
    required this.type,
    required this.imageUrl,
    required this.availableItems,
    this.info = '',
    this.temperature = '',
    this.dateCleaned = '',
    this.minutesFromBrewing = '',
  });

  final String id;
  final String title;
  final List<String> labels;
  final List<InventoryItem> inventoryItems;
  final List<String> persons;
  final String info;
  final String type;
  final String imageUrl;
  final List<AvailableItem> availableItems;
  final String temperature;
  final String minutesFromBrewing;
  final String dateCleaned;

  factory Beverage.fromJson(Map<String, dynamic> json) {
    return Beverage(
      id: json['id'],
      title: json['title'],
      labels: List<String>.from(json['labels']),
      inventoryItems: json['inventoryItems'],
      persons: json['persons'],
      type: json['type'],
      imageUrl: json['imageUrl'],
      availableItems: json['availableItems'],
      info: json['info'] ?? '',
      temperature: json['temperature'] ?? '',
      dateCleaned: json['dateCleaned'] ?? '',
      minutesFromBrewing: json['minutesFromBrewing'] ?? '',
    );
  }

  @override
  String toString() {
    return 'Beverage{id: $id, title: $title, labels: $labels, inventoryItems: $inventoryItems, persons: $persons, '
        'type: $type, imageUrl: $imageUrl, availableItems: $availableItems, info: $info, temperature: $temperature, '
        'minutesFromBrewing: $minutesFromBrewing, dateCleaned: $dateCleaned}';
  }
}
