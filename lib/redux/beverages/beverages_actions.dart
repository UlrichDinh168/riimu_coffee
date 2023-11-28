import 'dart:developer' as dev;

import 'package:redux/redux.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:riimu_coffee/controllers/api/api.dart';
import 'package:riimu_coffee/models/available_items.dart';
import 'package:riimu_coffee/models/beverage.dart';
import 'package:riimu_coffee/models/inventory_items.dart';
import 'package:riimu_coffee/redux/beverages/beverages_state.dart';
import 'package:riimu_coffee/redux/store.dart';
import 'package:riimu_coffee/utils/parse_function.dart';

@immutable
class FetchBeveragesAction {}

class SetBeveragesAction {
  final BeveragesState data;

  SetBeveragesAction({required this.data});
}

// Future<void> fetchBeverages(Store<AppState> store, {int pageNumber = 1}) async {
//     final state = store.state.beveragesState;

//  if (state.isLoading || state.end) {
//     return;
//   }

//   store.dispatch(
//       SetBeveragesAction(data: BeveragesState.initial(isLoading: true)));

//   try {
//     final beveragesResponse = await http
//         .get(Uri.parse('${endpoints['beverageList']!}?page=$pageNumber'));

//     if (beveragesResponse.statusCode == 200) {
//       final Map<String, String> labels = store.state.baseDataState.labels;
//       final Map<String, List<InventoryItem>> inventoryItems =
//           store.state.baseDataState.inventories;
//       final Map<String, List<AvailableItem>> availableItems =
//           store.state.baseDataState.availableItems;

//       final List<Beverage> beverages = parseBeverages(
//         beveragesResponse: beveragesResponse,
//         labels: labels,
//         inventoryItems: inventoryItems,
//         availableItems: availableItems,
//       );

//       final updatedBeverages = List.from(state.beverages)..addAll(beverages.values);

//       store.dispatch(
//         SetBeveragesAction(
//           data: BeveragesState(
//             isLoading: false,
//             isError: false,
//             beverages: updatedBeverages,
//           ),
//         ),
//       );
//     }
//   } catch (error) {
//     dev.log('Error decoding JSON: $error');
//     store.dispatch(SetBeveragesAction(
//         data: const BeveragesState(
//             isLoading: false, isError: true, beverages: [])));
//   }
// }
Future<void> fetchBeverages(Store<AppState> store) async {
  final state = store.state.beveragesState;

  if (state.isLoading || state.end) {
    return;
  }

  store.dispatch(
      SetBeveragesAction(data: BeveragesState.initial(isLoading: true)));
  print(state.pageNumber);
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

      final List<Beverage> newBeverages = parseBeverages(
        beveragesResponse: beveragesResponse,
        labels: labels,
        inventoryItems: inventoryItems,
        availableItems: availableItems,
      );

      final List<Beverage> updatedBeverages = List.from(state.beverages)
        ..addAll(newBeverages);

      // Check if there are more items to fetch on the next page
      final bool end = newBeverages.isEmpty;

      store.dispatch(
        SetBeveragesAction(
          data: BeveragesState(
            isLoading: false,
            isError: false,
            beverages: updatedBeverages,
            pageNumber: nextPageNumber,
            end: end,
          ),
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
