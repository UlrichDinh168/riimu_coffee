import 'package:flutter/material.dart';
import 'package:riimu_coffee/views/screens/home_screen/home.dart';

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
    Widget screenWidget = const HomeScreen();
    // Widget screenWidget = const TestScreen();

    if (activeScreen == 'details-screen') {
      // screenWidget =  DetailScreen();
    }

    // TODO: Add Layout for same pages
    // return MaterialApp(
    //   home: Scaffold(
    //     backgroundColor: Colors.red[50],
    //     body: screenWidget,
    //   ),
    // );

    return MaterialApp(
      home: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: SizedBox(
          width: 40,
          height: 40,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.red[50],
            child: const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 20,
              ),
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            // Header Image
            Image.asset(
              'assets/images/background/coffees.png',
              fit: BoxFit.cover,
            ),

            // Dynamic Body Widget
            Expanded(child: screenWidget),

            // Footer Image
            Container(
              color: const Color.fromARGB(255, 65, 2, 2),
              width: MediaQuery.of(context)
                  .size
                  .width, // Set the width to the screen width

              height: 65,
              child: Image.asset(
                'assets/images/background/riimu_logo.png',
                height: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
