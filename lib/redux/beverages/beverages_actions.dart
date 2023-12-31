import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:riimu_coffee/controllers/api/api.dart';
import 'package:riimu_coffee/models/available_items.dart';
import 'package:riimu_coffee/models/beverage.dart';
import 'package:riimu_coffee/models/inventory_items.dart';
import 'package:riimu_coffee/redux/beverages/beverages_state.dart';
import 'package:riimu_coffee/redux/people/people_actions.dart';
import 'package:riimu_coffee/redux/store.dart';
import 'package:riimu_coffee/utils/parse_function.dart';

@immutable
class ToggleTitleSelectionAction {
  final String title;
  const ToggleTitleSelectionAction(this.title);
}

class ClearAllTitleSelectionsAction {
  ClearAllTitleSelectionsAction();
}

@immutable
class SetBeveragesAction {
  final BeveragesState data;

  const SetBeveragesAction({required this.data});
}

Future<void> fetchBeverages(Store<AppState> store) async {
  final state = store.state.beveragesState;

  if (state.isLoading || state.end) {
    return;
  }

  try {
    final int nextPageNumber = state.pageNumber + 1;

    final beveragesResponse = await http
        .get(Uri.parse('${endpoints['beverageList']!}?page=$nextPageNumber'));

    if (beveragesResponse.statusCode == 200) {
      final Map<String, String> labels = store.state.baseDataState.labels;
      final Map<String, List<InventoryItem>> inventoryItems =
          store.state.baseDataState.inventories;
      final Map<String, List<AvailableItem>> availableItems =
          store.state.baseDataState.availableItems;

      final List<Beverage> beverages = parseBeverages(
        beveragesResponse: beveragesResponse,
        labels: labels,
        inventoryItems: inventoryItems,
        availableItems: availableItems,
      );

      final List<Beverage> updatedBeverages = List.from(state.beverages)
        ..addAll(beverages);

      final bool end = beverages.isEmpty;

      final List<String> personIDs =
          beverages.expand((beverage) => beverage.persons).toSet().toList();
      await fetchPeopleData(store, personIDs);

      store.dispatch(
        SetBeveragesAction(
          data: BeveragesState(
              isLoading: false,
              isError: false,
              beverages: updatedBeverages,
              pageNumber: nextPageNumber,
              end: end,
              selectedBeveragesTitles: const []),
        ),
      );
    }
  } catch (error) {
    dev.log('Error decoding JSON: $error');
    store.dispatch(
      SetBeveragesAction(
        data: state.copyWith(
          isLoading: false,
          isError: true,
          beverages: [],
        ),
      ),
    );
  }
}
