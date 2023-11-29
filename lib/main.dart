import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:riimu_coffee/models/beverage.dart';
import 'package:riimu_coffee/redux/beverages/beverages_actions.dart';
import 'package:riimu_coffee/redux/beverages/beverages_state.dart';
import 'package:riimu_coffee/redux/baseData/base_data_actions.dart';
import 'package:riimu_coffee/redux/people/people_actions.dart';

import 'package:riimu_coffee/redux/store.dart';
import 'package:riimu_coffee/theme/default_theme.dart';
import 'package:riimu_coffee/views/screens/detail_screen/detail_screen.dart';

import 'package:riimu_coffee/views/screens/home_screen/home_screen.dart';
import 'package:riimu_coffee/views/shared/loading/loading.dart';

void main() async {
  // final redux = Redux();
  final store = await createStore();

  runApp(Main(store: store));
}

class Main extends StatefulWidget {
  final Store<AppState> store;

  const Main({super.key, required this.store});

  @override
  createState() => _AppState();
}

class _AppState extends State<Main> {
  Future<void> _initializeData() async {
    await fetchBaseData(widget.store);
    await fetchBeverages(widget.store);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: widget.store,
      child: MaterialApp(
        theme: ThemeData(
            colorScheme: DefaultTheme().colorScheme, useMaterial3: true),
        home: Scaffold(
            backgroundColor: const Color.fromARGB(255, 253, 233, 236),
            body: FutureBuilder(
              future: _initializeData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const LoadingAnimation(
                    timeout: 10,
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Scaffold(
                    body: StoreConnector<AppState, BeveragesState>(
                      converter: (store) {
                        return store.state.beveragesState;
                      },
                      builder: (context, beveragesState) {
                        return const HomeScreen();
                      },
                    ),
                  );
                }
              },
            )),
        routes: <String, WidgetBuilder>{
          "/home": (BuildContext context) => const HomeScreen(),
          // "/detail": (BuildContext context) => const DetailScreen(selectedBeverage: ,),
          "/detail": (BuildContext context) {
            final selectedBeverage =
                StoreProvider.of<AppState>(context).state.selectedBeverage;
            return DetailScreen(selectedBeverage: selectedBeverage);
          },
        },
        // theme: ThemeData(),
      ),
    );
  }
}
