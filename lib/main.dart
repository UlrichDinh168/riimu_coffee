import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:riimu_coffee/models/beverage.dart';
import 'package:riimu_coffee/redux/beverages/beverages_actions.dart';
import 'package:riimu_coffee/redux/beverages/beverages_state.dart';
import 'package:riimu_coffee/redux/store.dart';
import 'package:riimu_coffee/views/screens/home_screen/home_screen.dart';
import 'package:riimu_coffee/views/shared/loading/loading.dart';

void main() async {
  final redux = Redux();

  await redux.init();
  runApp(Main(redux: redux));
}

class Main extends StatelessWidget {
  final Redux redux;

  const Main({super.key, required this.redux});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StoreProvider<AppState>(
        store: redux.store,
        child: MyApp(redux: redux),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  final Redux redux;

  const MyApp({super.key, required this.redux});
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  List<Beverage> beverages = [];

  @override
  void initState() {
    super.initState();
    _onFetchBeveragesPressed();
  }

  final url = Uri.https(
    'run.mocky.io',
    '/v3/775950d3-cd5d-449a-be70-50f8a6f40697',
  );

  void _onFetchBeveragesPressed() {
    widget.redux.store.dispatch(fetchBeveragesAction(widget.redux.store));
  }
//TODO: routing

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 253, 233, 236),
        body: StoreConnector<AppState, BeveragesState>(
          converter: (store) {
            return store.state.beveragesState;
          },
          builder: (context, beveragesState) {
            if (beveragesState.isLoading) {
              return const LoadingAnimation(
                timeout: 10,
              );
            } else {
              return HomeScreen(beverages: beveragesState.beverages);
            }
          },
        ),
      ),
      // theme: ThemeData(),
    );
  }
}
