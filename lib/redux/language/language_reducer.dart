import 'package:riimu_coffee/redux/language/language_actions.dart';
import 'package:riimu_coffee/redux/language/language_state.dart';

LanguageState languageReducer(LanguageState state, dynamic action) {
  if (action is ChangeLanguageAction) {
    final newLanguageState = LanguageState(languageCode: action.languageCode);
    return state.copyWith(languageCode: newLanguageState.languageCode);
  }
  return state;
}
