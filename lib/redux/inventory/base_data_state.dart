// import 'package:meta/meta.dart';

import 'package:meta/meta.dart';
import 'package:riimu_coffee/models/available_items.dart';

import 'package:riimu_coffee/models/inventory_items.dart';

@immutable
class BaseDataState {
  final bool isError;
  final bool isLoading;
  final Map<String, List<InventoryItem>> inventories;
  final Map<String, String> labels;
  final Map<String, List<AvailableItem>> availableItems;
  final Map<String, String> identifiers;

  const BaseDataState({
    required this.isError,
    required this.isLoading,
    required this.inventories,
    required this.labels,
    required this.availableItems,
    required this.identifiers,
  });

// provide a default or initial state for an object.
  factory BaseDataState.initial(
      {bool isError = false, bool isLoading = false}) {
    return const BaseDataState(
      isLoading: false,
      isError: false,
      inventories: {},
      labels: {},
      availableItems: {},
      identifiers: {},
    );
  }

//create a new instance of an object with updated values while maintaining immutability.
  BaseDataState copyWith({
    bool? isError,
    bool? isLoading,
    Map<String, List<InventoryItem>>? inventories,
    Map<String, String>? labels,
    Map<String, List<AvailableItem>>? availableItems,
    Map<String, String>? identifiers,
  }) {
    return BaseDataState(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      inventories: inventories ?? this.inventories,
      labels: labels ?? this.labels,
      availableItems: availableItems ?? this.availableItems,
      identifiers: identifiers ?? this.identifiers,
    );
  }
}
