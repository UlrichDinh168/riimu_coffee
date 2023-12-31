import 'package:riimu_coffee/redux/theme/theme_actions.dart';
import 'package:riimu_coffee/redux/theme/theme_state.dart';

ThemeState themeReducer(ThemeState state, dynamic action) {
  if (action is ChangeThemeModeAction) {
    return state.copyWith(themeMode: action.themeMode);
  }
  return state;
}
