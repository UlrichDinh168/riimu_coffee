import 'dart:convert';
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

Future<void> fetchBeverages(Store<AppState> store, {int pageNumber = 1}) async {
  store.dispatch(
      SetBeveragesAction(data: BeveragesState.initial(isLoading: true)));

  // final stopwatch = Stopwatch()..start();

  try {
    final beveragesResponse = await http
        .get(Uri.parse('${endpoints['beverageList']!}?page=$pageNumber'));

    if (beveragesResponse.statusCode == 200) {
      final Map<String, String> labels = store.state.baseDataState.labels;
      final Map<String, List<InventoryItem>> inventoryItems =
          store.state.baseDataState.inventories;
      final Map<String, List<AvailableItem>> availableItems =
          store.state.baseDataState.availableItems;

      // final List<dynamic> jsonData = json.decode(beveragesResponse.body);

      // List<Beverage> beverages =
      //     jsonData.map((item) => Beverage.fromJson(item)).toList();

      final List<Beverage> beverages = parseBeverages(
        beveragesResponse: beveragesResponse,
        labels: labels,
        inventoryItems: inventoryItems,
        availableItems: availableItems,
      );

      store.dispatch(
        SetBeveragesAction(
          data: BeveragesState(
            isLoading: false,
            beverages: beverages,
            isError: false,
          ),
        ),
      );
    }

    // List<Beverage> beverages = jsonData.map((item) => Beverage.fromJson(item)).toList();

    // await Future.delayed(const Duration(seconds: 2));
    // stopwatch.stop();

    // final remainingTime = stopwatch.elapsed;

    // if (remainingTime < const Duration(seconds: 1)) {
    //   await Future.delayed(const Duration(seconds: 1));
    // }
    // if (response.statusCode == '200') {
    //   final jsonData = json.decode(response.body);

    //   print(jsonData);

    //   dev.log(
    //     jsonData,
    //   );

    // }

    // List<Beverage> beverages =
    //     List.from(jsonData['beverages'].map((item) => Beverage.fromJson(item)));
  } catch (error) {
    dev.log('Error decoding JSON: $error');
    store.dispatch(SetBeveragesAction(
        data: const BeveragesState(
            isLoading: false, isError: true, beverages: [])));
  }
}
