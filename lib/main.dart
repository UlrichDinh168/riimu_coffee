import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:riimu_coffee/redux/beverages/beverages_actions.dart';

import 'package:riimu_coffee/redux/baseData/base_data_actions.dart';

import 'package:riimu_coffee/redux/store.dart';
import 'package:riimu_coffee/redux/theme/theme_state.dart';
import 'package:riimu_coffee/theme/default_theme.dart';
import 'package:riimu_coffee/views/screens/detail_screen/detail_screen.dart';

import 'package:riimu_coffee/views/screens/home_screen/home_screen.dart';
import 'package:riimu_coffee/views/shared/loading/loading.dart';
import 'package:riimu_coffee/views/shared/translation.dart';
import 'package:riimu_coffee/utils/presettings.dart';

void main() async {
  final store = await createStore();

  runApp(
    Main(
      store: store,
    ),
  );
}

class Main extends StatefulWidget {
  final Store<AppState> store;

  const Main({
    super.key,
    required this.store,
  });

  @override
  createState() => _AppState();
}

class _AppState extends State<Main> {
  // String loadingText = ''; // Add this line

  final FlutterLocalization _localization = FlutterLocalization.instance;
  bool _dataInitialized = false;

  Future<void> _initializeData() async {
    await preSettings(widget.store);
    await fetchBaseData(widget.store);
    await fetchBeverages(widget.store);

    await Future.delayed(const Duration(seconds: 1));
    setState(() {});
  }

  @override
  void initState() {
    _localization.init(
      mapLocales: [
        const MapLocale(
          'en',
          AppLocale.en,
          countryCode: 'US',
          fontFamily: 'Font EN',
        ),
        const MapLocale(
          'vi',
          AppLocale.vi,
          countryCode: 'VN',
          fontFamily: 'Font VN',
        ),
      ],
      initLanguageCode: widget.store.state.languageState.languageCode,
    );
    _localization.onTranslatedLanguage = _onTranslatedLanguage;

    super.initState();
  }

  void _onTranslatedLanguage(Locale? locale) async {
    if (!_dataInitialized) {
      await _initializeData();
      setState(() {
        _dataInitialized = true;
      });
    } else {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: widget.store,
      child: StoreConnector<AppState, ThemeState>(
        converter: (store) => store.state.themeState,
        builder: (context, themeState) {
          return MaterialApp(
            darkTheme:
                ThemeData.dark().copyWith(colorScheme: DarkTheme().colorScheme),
            themeMode: themeState.themeMode == 'dark'
                ? ThemeMode.dark
                : ThemeMode.light,
            theme: ThemeData(
              colorScheme: DefaultTheme().colorScheme,
              useMaterial3: true,
              fontFamily: _localization.fontFamily,
            ),
            home: _dataInitialized
                ? const HomeScreen()
                : const LoadingAnimation(),
            routes: <String, WidgetBuilder>{
              "/home": (BuildContext context) {
                return const HomeScreen();
              },
              "/detail": (BuildContext context) {
                final selectedBeverage =
                    StoreProvider.of<AppState>(context).state.selectedBeverage;
                return DetailScreen(selectedBeverage: selectedBeverage);
              },
              "/loading": (BuildContext context) {
                return const LoadingAnimation();
              }
            },
            supportedLocales: _localization.supportedLocales,
            localizationsDelegates: _localization.localizationsDelegates,
          );
        },
      ),
    );
  }
}
