import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:redux/redux.dart';
import 'package:riimu_coffee/redux/store.dart';
import 'package:shared_preferences/shared_preferences.dart';

@immutable
class ChangeLanguageAction {
  final String languageCode;
  const ChangeLanguageAction({required this.languageCode});
}

// change language
Future changeLanguage(Store<AppState> store, dynamic languageCode) async {
  final FlutterLocalization localization = FlutterLocalization.instance;
  store.dispatch(ChangeLanguageAction(languageCode: languageCode));
  localization.translate(languageCode);

  setLanguage(languageCode);
}

// set language to cache
Future setLanguage(String languageCode) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('selectedLanguage', languageCode);
}

// get language from cache
Future<String?> getSavedLanguage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getString('selectedLanguage');
}
