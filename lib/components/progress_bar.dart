import 'package:flutter/material.dart';

// <2>
class ProgressBar extends StatefulWidget {
  const ProgressBar({super.key, this.progress});

  final double? progress;
  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    double progress =
        widget.progress ?? 50; // Use a default value if progress is null

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward_ios_rounded),
        onPressed: () {
          setState(() {});
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        child: Center(
            child: Container(
          constraints: const BoxConstraints(maxWidth: 10),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.red,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
          ),
        )),
      ),
    );
  }
}
