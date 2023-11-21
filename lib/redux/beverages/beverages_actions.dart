import 'dart:convert';

import 'package:redux/redux.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:riimu_coffee/models/beverage.dart';
import 'package:riimu_coffee/redux/beverages/beverages_state.dart';
import 'package:riimu_coffee/redux/store.dart';

@immutable
class SetBeveragesStateAction {
  final BeveragesState beveragesState;

  const SetBeveragesStateAction(this.beveragesState);
}

Future<void> fetchBeveragesAction(Store<AppState> store) async {
  store.dispatch(const SetBeveragesStateAction(
      BeveragesState(isLoading: true, isError: false, beverages: [])));

  final stopwatch = Stopwatch()..start();

  try {
    final response = await http.get(Uri.parse(
        'https://run.mocky.io/v3/775950d3-cd5d-449a-be70-50f8a6f40697'));

    await Future.delayed(const Duration(seconds: 4));

    stopwatch.stop();

    final remainingTime = stopwatch.elapsed;

    if (remainingTime < const Duration(seconds: 2)) {
      await Future.delayed(const Duration(seconds: 2));
    }

    final jsonData = json.decode(response.body);
    store.dispatch(
      SetBeveragesStateAction(
        BeveragesState(
          isLoading: false,
          beverages: Beverage.listFromJson(jsonData),
          isError: false,
        ),
      ),
    );
  } catch (error) {
    store.dispatch(const SetBeveragesStateAction(
        BeveragesState(isLoading: false, isError: true, beverages: [])));
  }
}