import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({super.key, required this.progress});

  final int progress;
  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward_ios_rounded),
        onPressed: () {
          setState(() {});
        },
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 38),
        child: Center(
            child: LinearProgressIndicator(
          backgroundColor: Colors.red,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
        )),
      ),
    );
  }
}
