import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:redux/redux.dart';
import 'package:riimu_coffee/redux/language/language_actions.dart';
import 'package:riimu_coffee/redux/store.dart';
import 'package:riimu_coffee/redux/theme/theme_actions.dart';

Future preSettings(Store<AppState> store) async {
  // get device theme setting
  var brightness =
      SchedulerBinding.instance.platformDispatcher.platformBrightness;
  bool isDarkMode = brightness == Brightness.dark;

  // language
  final savedLanguageCode = await getSavedLanguage();
  await changeLanguage(store, savedLanguageCode);

  // theme
  final savedThemeMode = await getSavedTheme();
  print('savedThemeMode $savedThemeMode');

  if (savedThemeMode == 'null') {
    final deviceThemeMode = isDarkMode ? 'dark' : 'light';
    return await setOrChangeTheme(store, deviceThemeMode);
  } else {
    return await setOrChangeTheme(store, savedThemeMode);
  }
}
