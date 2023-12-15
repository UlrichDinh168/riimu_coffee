import 'package:redux/redux.dart';
import 'package:riimu_coffee/redux/language/language_actions.dart';
import 'package:riimu_coffee/redux/store.dart';

Future preSettings(Store<AppState> store) async {
  var savedLanguageCode = await getSavedLanguage();

  await changeLanguage(store, savedLanguageCode);
}
