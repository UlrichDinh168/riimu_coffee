import 'package:redux/redux.dart';
import 'package:riimu_coffee/controllers/api/api.dart';
import 'package:riimu_coffee/models/available_items.dart';
import 'package:riimu_coffee/models/inventory_items.dart';
import 'package:riimu_coffee/redux/baseData/base_data_state.dart';
import 'package:http/http.dart' as http;
import 'package:riimu_coffee/redux/store.dart';
import 'package:riimu_coffee/utils/parse_function.dart';

class FetchBaseDataAction {}

class SetBaseDataAction {
  final BaseDataState data;

  SetBaseDataAction({required this.data});
}

Future<void> fetchBaseData(Store<AppState> store) async {
  try {
    // Set loading state
    store.dispatch(
        SetBaseDataAction(data: BaseDataState.initial(isLoading: true)));

    final beverageLabelsResponse =
        await http.get(Uri.parse(endpoints['beverageLabels']!));
    final inventoryItemsResponse =
        await http.get(Uri.parse(endpoints['inventories']!));
    final availableItemsResponse =
        await http.get(Uri.parse(endpoints['availableItems']!));
    final beveragesIdentifiersResponse =
        await http.get(Uri.parse(endpoints['beveragesIdentifiers']!));

    if (beverageLabelsResponse.statusCode == 200 &&
        inventoryItemsResponse.statusCode == 200 &&
        availableItemsResponse.statusCode == 200 &&
        beveragesIdentifiersResponse.statusCode == 200) {
      // Parse beverage labels
      final Map<String, String> labels =
          parseBeverageLabels(beverageLabelsResponse);

      // Parse inventory items
      final Map<String, List<InventoryItem>> inventoryItems =
          parseInventoryItems(inventoryItemsResponse);

      // Parse available items
      final Map<String, List<AvailableItem>> availableItems =
          parseAvailableItems(availableItemsResponse);

      // Parse beverages identifiers
      final Map<String, String> beveragesIdentifiers =
          parseBeveragesIdentifiers(beveragesIdentifiersResponse);

      final BaseDataState baseData = BaseDataState(
        isError: false,
        isLoading: false,
        labels: labels,
        inventories: inventoryItems,
        availableItems: availableItems,
        identifiers: beveragesIdentifiers,
      );

      store.dispatch(SetBaseDataAction(data: baseData));
    }
  } catch (error) {
    print('Error fetching base data: $error');
    store.dispatch(
        SetBaseDataAction(data: BaseDataState.initial(isError: true)));
  }
}
