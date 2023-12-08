import 'package:riimu_coffee/redux/language/language_actions.dart';
import 'package:riimu_coffee/redux/language/language_state.dart';

LanguageState languageReducer(LanguageState state, dynamic action) {
  if (action is ChangeLanguageAction) {
    return LanguageState(languageCode: action.languageCode);
  }
  return state;
}
