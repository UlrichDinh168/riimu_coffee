import 'package:flutter/material.dart';
import 'package:riimu_coffee/views/screens/home_screen/home.dart';
import 'package:riimu_coffee/views/shared/loading/loading.dart';

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
    Future.delayed(const Duration(seconds: 2, milliseconds: 700), () {
      // navigateToHomeScreen();
    });
  }

  void navigateToHomeScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
          backgroundColor: Color.fromARGB(255, 253, 233, 236),
          body: LoadingAnimation(
            timeout: 2,
          )),
    );
  }
}
