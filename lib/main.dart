import 'package:flutter/material.dart';
import 'package:riimu_coffee/screens/detail.dart';
import 'package:riimu_coffee/screens/home.dart';

void main() {
  runApp(const Start());
}

class Start extends StatefulWidget {
  const Start({super.key});
  @override
  State<StatefulWidget> createState() {
    return _Start();
  }
}

class _Start extends State<Start> {
  var activeScreen = 'home-screen';

  void showDetails() {
    // when call setState -> build method runs again and updates the state
    setState(() {
      activeScreen = 'details-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = Home(showDetails: showDetails);

    if (activeScreen == 'details-screen') {
      screenWidget = const DetailsScreen();
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red[50],
        body: screenWidget,
      ),
    );
  }
}

  // decoration: const BoxDecoration(
  //         gradient: LinearGradient(
  //             colors: [Colors.purpleAccent, Color.fromARGB(255, 88, 88, 88)],
  //             begin: Alignment.topLeft,
  //             end: Alignment.bottomRight),
  //       ),