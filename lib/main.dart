import 'package:flutter/material.dart';
import 'package:riimu_coffee/screens/home.dart';
import 'package:percent_indicator/percent_indicator.dart';

// void main() {
//   runApp(const Start());
// }

void main() => runApp(const MaterialApp(home: Start()));

class Start extends StatefulWidget {
  const Start({super.key});
  @override
  State<StatefulWidget> createState() {
    return _Start();
  }
}

class _Start extends State<Start> {
  @override
  void initState() {
    super.initState();
    // Start a timer for 5 seconds
    Future.delayed(const Duration(seconds: 2), () {
      // // Navigate to the main screen after the timeout
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(builder: (context) => const HomeScreen()),
      // );
      navigateToHomeScreen();
    });
  }

  // Function to navigate to the main screen.
  void navigateToHomeScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: const Color.fromARGB(255, 253, 233, 236)),
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 253, 233, 236),
        body: Stack(children: [
          Positioned(
            top: 30, // Adjust to your desired position from the top
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'assets/images/background/riimu_logo_2.png',
                width: 100,
                height: 100,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Loading prototype",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.red[900],
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120),
                child: LinearPercentIndicator(
                  // width: 150,
                  animation: true,
                  lineHeight: 10.0,
                  animationDuration: 2000,
                  barRadius: const Radius.circular(10),
                  percent: 1,
                  backgroundColor: Colors.black,
                  progressColor: Colors.red[700],
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 5,
            child: Center(
              child: Image.asset(
                'assets/images/background/vikingship.png',
                width: 100,
                height: 100,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Center(
              child: Image.asset(
                'assets/images/background/waves.png',
              ),
            ),
          ),
        ]),
        //  const HomeScreen(),
      ),
    );
  }
}
