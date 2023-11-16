import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:riimu_coffee/redux/beverages/beverages_actions.dart';
import 'package:riimu_coffee/redux/beverages/beverages_reducer.dart';
import 'package:riimu_coffee/redux/beverages/beverages_state.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is SetBeveragesStateAction) {
    final nextBeveragesState = beveragesReducer(state.beveragesState, action);

    return state.copyWith(beveragesState: nextBeveragesState);
  }

  return state;
}

@immutable
class AppState {
  final BeveragesState beveragesState;

  const AppState({
    required this.beveragesState,
  });

  AppState copyWith({
    required BeveragesState beveragesState,
  }) {
    return AppState(
      beveragesState: beveragesState,
    );
  }
}

class Redux {
  late Store<AppState> _store;

  Store<AppState> get store {
    return _store;
  }

  Future<void> init() async {
    final beveragesStateInitial = BeveragesState.initial();

    _store = Store<AppState>(
      appReducer,
      middleware: [thunkMiddleware],
      initialState: AppState(beveragesState: beveragesStateInitial),
    );
  }
}
