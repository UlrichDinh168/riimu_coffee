import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:riimu_coffee/redux/store.dart';
import 'package:shared_preferences/shared_preferences.dart';

@immutable
class ChangeThemeModeAction {
  final String themeMode;
  const ChangeThemeModeAction({required this.themeMode});
}

// change language
Future setOrChangeTheme(Store<AppState> store, dynamic themeMode) async {
  print('themeMode $themeMode');
  store.dispatch(ChangeThemeModeAction(themeMode: themeMode));

  setTheme(themeMode);
}

// set theme to cache
Future setTheme(String themeMode) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('theme', themeMode);
}

// get theme from cache
Future<String?> getSavedTheme() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getString('theme');
}
