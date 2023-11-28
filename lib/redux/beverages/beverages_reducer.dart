import 'package:riimu_coffee/redux/beverages/beverages_actions.dart';
import 'package:riimu_coffee/redux/beverages/beverages_state.dart';

BeveragesState beverageReducer(BeveragesState state, dynamic action) {
  if (action is SetBeveragesAction) {
    return BeveragesState(
        isLoading: false,
        isError: action.data.isError,
        beverages: action.data.beverages,
        pageNumber: action.data.pageNumber,
        end: action.data.end);
  }

  return state;
}
