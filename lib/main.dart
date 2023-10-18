import 'package:flutter/material.dart';
import 'package:riimu_coffee/models/beverage.dart';
import 'package:riimu_coffee/views/screens/home_screen/home_screen.dart';
import 'package:riimu_coffee/views/shared/loading/loading.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(const MaterialApp(home: Start()));

class Start extends StatefulWidget {
  const Start({super.key});
  @override
  State<StatefulWidget> createState() {
    return _Start();
  }
}

class _Start extends State<Start> {
  List<Beverage> beverages = [];

  final url = Uri.https(
    'run.mocky.io',
    '/v3/775950d3-cd5d-449a-be70-50f8a6f40697',

    // 681ec46b-08ce-4a23-bd98-81fd98c41328',
  );
  @override
  void initState() {
    super.initState();
    // _fetchItems();
    //  Future.delayed(const Duration(seconds: 1, milliseconds: 200), () {
    //   navigateToHomeScreen();
    // });
  }

  Future<List<Beverage>> _fetchItems() async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);

      final List<Beverage> loadedItems =
          jsonList.map((json) => Beverage.fromJson(json)).toList();

      if (mounted) {
        // check whether the state object is in tree
        setState(() {
          beverages = loadedItems;
        });
        navigateToHomeScreen();
      }
    } else {
      throw Exception('Failed to load album');
    }
    return beverages;
  }

  void navigateToHomeScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => HomeScreen(beverages: beverages)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 253, 233, 236),
        body: FutureBuilder<List<Beverage>>(
          future: _fetchItems(),
          builder: (context, snapshot) {
            print(snapshot);
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingAnimation(
                timeout: 10,
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return HomeScreen(beverages: snapshot.data ?? []);
            }
          },
        ),
        // LoadingAnimation(
        //   timeout: 5,
        // ),
      ),
    );
  }
}
