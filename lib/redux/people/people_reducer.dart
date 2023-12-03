import 'package:riimu_coffee/redux/people/people_actions.dart';
import 'package:riimu_coffee/redux/people/people_state.dart';

PeopleState peopleReducer(PeopleState state, dynamic action) {
  if (action is SetPeopleAction) {
    return PeopleState(
        isLoading: false,
        isError: action.data.isError,
        people: action.data.people);
  }

  return state;
}
