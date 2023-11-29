import 'package:riimu_coffee/redux/baseData/base_data_state.dart';
import 'package:riimu_coffee/redux/baseData/base_data_actions.dart';

BaseDataState baseDataReducer(BaseDataState state, dynamic action) {
  if (action is SetBaseDataAction) {
    return BaseDataState(
      isLoading: action.data.isLoading,
      isError: action.data.isError,
      inventories: action.data.inventories,
      labels: action.data.labels,
      availableItems: action.data.availableItems,
      identifiers: action.data.identifiers,
    );
  }

  return state;
}
