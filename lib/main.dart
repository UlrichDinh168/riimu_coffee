import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.red[100]),
      home: Scaffold(
        backgroundColor: Colors.red[50],
        body: const HomeScreen(),
      ),
    );

    // return CustomScrollView(
    //   slivers: <Widget>[
    //     SliverToBoxAdapter(
    //       child:
    //           Image.asset('assets/images/background/coffees.png'), // Your image
    //     ),
    //     SliverPadding(
    //       padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    //       sliver: SliverList(
    //         delegate: SliverChildBuilderDelegate(
    //           (BuildContext context, int index) {
    //             if (activeScreen == 'home-screen') {
    //               return Home(showDetails: showDetails);
    //             } else if (activeScreen == 'details-screen') {
    //               return const DetailsScreen();
    //             } else {
    //               // Handle other cases or return a default widget
    //               return Home(showDetails: showDetails);
    //             }
    //           },
    //           childCount: 1,
    //         ),
    //       ),
    //     ),
    //     SliverToBoxAdapter(
    //       child: Container(
    //         color: const Color.fromARGB(
    //             255, 65, 2, 2), // Set the background color to red
    //         height: 70, // Set the desired height
    //         child: Image.asset(
    //           'assets/images/background/riimu-logo.png',
    //           width: 10, // Set the desired width
    //           height: 10, // Set the desired height), // Your image
    //         ),
    //       ),
    //     )
    //   ],
    // );
  }
}
