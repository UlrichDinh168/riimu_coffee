import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:riimu_coffee/models/beverage.dart';
import 'package:riimu_coffee/redux/beverages/beverages_reducer.dart';
import 'package:riimu_coffee/redux/beverages/beverages_state.dart';
import 'package:riimu_coffee/redux/baseData/base_data_reducer.dart';
import 'package:riimu_coffee/redux/baseData/base_data_state.dart';
import 'package:riimu_coffee/redux/language/language_reducer.dart';
import 'package:riimu_coffee/redux/language/language_state.dart';
import 'package:riimu_coffee/redux/people/people_reducer.dart';
import 'package:riimu_coffee/redux/people/people_state.dart';
import 'package:riimu_coffee/redux/theme/theme_reducer.dart';
import 'package:riimu_coffee/redux/theme/theme_state.dart';

class SelectItemAction {
  final Beverage selectedBeverage;
  SelectItemAction(this.selectedBeverage);
}

AppState appReducer(AppState state, dynamic action) {
  if (action is SelectItemAction) {
    return AppState(
        selectedBeverage: action.selectedBeverage,
        beveragesState: beverageReducer(state.beveragesState, action),
        baseDataState: baseDataReducer(state.baseDataState, action),
        peopleState: peopleReducer(state.peopleState, action),
        languageState: languageReducer(state.languageState, action),
        themeState: themeReducer(state.themeState, action));
  }

  return AppState(
    selectedBeverage: state.selectedBeverage,
    beveragesState: beverageReducer(state.beveragesState, action),
    baseDataState: baseDataReducer(state.baseDataState, action),
    peopleState: peopleReducer(state.peopleState, action),
    languageState: languageReducer(state.languageState, action),
    themeState: themeReducer(state.themeState, action),
  );
}

@immutable
class AppState {
  final Beverage selectedBeverage;

  final BaseDataState baseDataState;
  final BeveragesState beveragesState;
  final PeopleState peopleState;
  final LanguageState languageState;
  final ThemeState themeState;

  const AppState({
    required this.selectedBeverage,
    required this.beveragesState,
    required this.baseDataState,
    required this.peopleState,
    required this.languageState,
    required this.themeState,
  });

  @override
  String toString() {
    return 'AppState(languageCode: $languageState)';
  }

  factory AppState.initial() {
    const defaultBeverage = Beverage(
      id: '',
      title: '',
      labels: [],
      inventoryItems: [],
      persons: [],
      type: '',
      imageUrl: '',
      availableItems: [],
      info: '',
      temperature: '',
      dateCleaned: '',
      minutesFromBrewing: '',
    );

    return AppState(
      selectedBeverage: defaultBeverage,
      beveragesState: BeveragesState.initial(),
      baseDataState: BaseDataState.initial(),
      peopleState: PeopleState.initial(),
      languageState: LanguageState.initial(),
      themeState: ThemeState.initial(),
    );
  }
}

Future<Store<AppState>> createStore() async {
  final store = Store(
    appReducer,
    initialState: AppState.initial(),
    middleware: [
      thunkMiddleware,
    ],
  );

  return store;
}
