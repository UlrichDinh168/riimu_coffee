import 'package:riimu_coffee/redux/beverages/beverages_actions.dart';
import 'package:riimu_coffee/redux/beverages/beverages_state.dart';

beveragesReducer(BeveragesState prevState, SetBeveragesStateAction action) {
  final payload = action.beveragesState;
  return prevState.copyWith(
    isError: payload.isError,
    isLoading: payload.isLoading,
    beverages: payload.beverages,
  );
}
