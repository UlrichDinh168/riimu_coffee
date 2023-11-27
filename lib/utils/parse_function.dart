import 'dart:convert';

import 'package:http/http.dart';
import 'package:riimu_coffee/models/available_items.dart';
import 'package:riimu_coffee/models/beverage.dart';
import 'package:riimu_coffee/models/inventory_items.dart';
import 'package:riimu_coffee/models/person.dart';

Map<String, List<AvailableItem>> parseAvailableItems(
    Response availableItemsResponse) {
  final fetchedAvailableItems = json.decode(availableItemsResponse.body);
  final Map<String, List<AvailableItem>> availableItems = {};
  fetchedAvailableItems.forEach(
    (key, value) {
      final List<AvailableItem> categoryItems = value
          .map<AvailableItem>((item) => AvailableItem.fromJson(item))
          .toList();
      availableItems[key] = categoryItems;
    },
  );

  return availableItems;
}

Map<String, String> parseBeverageLabels(Response beveragesResponse) {
  final fetchedBeverageLabels = json.decode(beveragesResponse.body);
  final Map<String, String> beverageLabels = {};
  fetchedBeverageLabels.forEach(
    (key, value) {
      beverageLabels[key] = value;
    },
  );

  return beverageLabels;
}

Map<String, List<InventoryItem>> parseInventoryItems(
  Response inventoryItemsResponse,
) {
  final fetchedInventoryItems = json.decode(inventoryItemsResponse.body);
  final Map<String, List<InventoryItem>> inventoryItems = {};
  fetchedInventoryItems.forEach(
    (key, value) {
      final categoryInventoryItems = value
          .map<InventoryItem>(
            (item) => InventoryItem.fromJson(item),
          )
          .toList();
      inventoryItems[key] = categoryInventoryItems;
    },
  );

  return inventoryItems;
}

// List<Person> parsePersonChips(Response peopleDataResponse) {
//   final fetchedPeopleData = json.decode(peopleDataResponse.body);
//   final List<Person> personChips = fetchedPeopleData
//       .map<Person>(
//         (personData) => PersonChip(
//           id: personData['id'],
//           imageUrl: personData['imageUrl'],
//           fullName: personData['fullName'],
//           description: personData['description'],
//         ),
//       )
//       .toList();

//   return personChips;
// }

Map<String, String> parseBeveragesIdentifiers(Response identifiersResponse) {
  final fetchedIdentifiersData = json.decode(identifiersResponse.body);

  final Map<String, String> identifiersData = {};
  fetchedIdentifiersData.keys.forEach((key) {
    identifiersData[key] = fetchedIdentifiersData[key].toString();
  });

  return identifiersData;
}

List<Beverage> parseBeverages({
  required Response beveragesResponse,
  required Map<String, String> labels,
  required Map<String, List<InventoryItem>> inventoryItems,
  required Map<String, List<AvailableItem>> availableItems,
}) {
  final List<dynamic> fetchedBeverages = json.decode(beveragesResponse.body);
  final List<Beverage> beverages = fetchedBeverages.map<Beverage>(
    (beverage) {
      final Map<String, dynamic> beverageJson = {
        'id': beverage['id'],
        'title': beverage['title'],
        'type': beverage['type'],
        'persons': List<String>.from(beverage['persons']),
        'info': beverage['info'] ?? '',
        'temperature': beverage['temperature'] ?? '',
        'minutesFromBrewing': beverage['minutesFromBrewing'] ?? '',
        'dateCleaned': beverage['dateCleaned'] ?? '',
        'imageUrl': beverage['imageUrl']
      };

      // Process beverage labels
      final List<String> beverageLabels = [];
      beverage['labels'].forEach(
        (labelKey) {
          beverageLabels.add(labels[labelKey]!);
        },
      );
      beverageJson['labels'] = beverageLabels;

      // Process inventory items
      final List<List<InventoryItem>> beverageInventoryItems = [];
      beverage['inventoryItems'].forEach(
        (itemKey) {
          beverageInventoryItems.add(inventoryItems[itemKey]!);
        },
      );
      final List<InventoryItem> flattenedInventoryItems =
          beverageInventoryItems.expand((i) => i).toList();
      beverageJson['inventoryItems'] = flattenedInventoryItems;

      // Process available available items
      final List<List<AvailableItem>> beverageAvailableItems = [];
      beverage['availableItems'].forEach(
        (itemKey) {
          beverageAvailableItems.add(availableItems[itemKey]!);
        },
      );
      final List<AvailableItem> flattenedAvailableItems =
          beverageAvailableItems.expand((i) => i).toList();
      beverageJson['availableItems'] = flattenedAvailableItems;

      // Build and return fial value
      return Beverage.fromJson(beverageJson);
    },
  ).toList();

  return beverages;
}
