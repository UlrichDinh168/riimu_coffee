import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:riimu_coffee/redux/beverages/beverages_reducer.dart';
import 'package:riimu_coffee/redux/beverages/beverages_state.dart';
import 'package:riimu_coffee/redux/inventory/base_data_reducer.dart';
import 'package:riimu_coffee/redux/inventory/base_data_state.dart';

// AppState appReducer(AppState state, dynamic action) {
//   return AppState(
//       beveragesState: beveragesReducer(state.beveragesState, action),
//       inventoryState: inventoryReducer(state.inventoryState, action));
// }

// ... other actions for different data types

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    beveragesState: beverageReducer(state.beveragesState, action),
    baseDataState: baseDataReducer(state.baseDataState, action),
  );
}

@immutable
class AppState {
  final BaseDataState baseDataState;
  final BeveragesState beveragesState;

  const AppState({
    required this.beveragesState,
    required this.baseDataState,
  });

  factory AppState.initial() {
    return AppState(
      beveragesState: BeveragesState.initial(),
      baseDataState: BaseDataState.initial(),
    );
  }
}

Future<Store<AppState>> createStore() async {
  return Store(
    appReducer,
    initialState: AppState.initial(),
    middleware: [
      thunkMiddleware,
      // ValidationMiddleware(),
      // LoggingMiddleware.printer(),
      // LocalStorageMiddleware(prefs),
      // NavigationMiddleware()
    ],
  );
}
