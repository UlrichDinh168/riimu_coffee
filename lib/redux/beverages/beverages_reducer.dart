import 'package:riimu_coffee/redux/beverages/beverages_actions.dart';
import 'package:riimu_coffee/redux/beverages/beverages_state.dart';

BeveragesState beverageReducer(BeveragesState state, dynamic action) {
  if (action is SetBeveragesAction) {
    return BeveragesState(
        isLoading: false,
        isError: action.data.isError,
        beverages: action.data.beverages,
        pageNumber: action.data.pageNumber,
        end: action.data.end,
        selectedBeveragesTitles: state.selectedBeveragesTitles);
  }
  if (action is ToggleTitleSelectionAction) {
    final String title = action.title;
    final List<String> updatedSelectedTitles =
        List.from(state.selectedBeveragesTitles);

    if (updatedSelectedTitles.contains(title)) {
      updatedSelectedTitles.remove(title);
    } else {
      updatedSelectedTitles.add(title);
    }

    return state.copyWith(selectedBeveragesTitles: updatedSelectedTitles);
  }

  if (action is ClearAllTitleSelectionsAction) {
    return state.copyWith(selectedBeveragesTitles: []);
  }

  return state;
}
