import 'dart:math';

import 'package:flutter/material.dart';
// import 'dart:math';

class ShipAnimation extends StatelessWidget {
  const ShipAnimation({super.key, required this.timeout});

  final int timeout;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 4),
      duration: Duration(seconds: timeout),
      // The 'translate' parameter receives values from the tween and moves the image
      builder: (_, double translate, __) {
        // Calculate a wavy offset using the sine function
        final waveOffset = cos(translate * pi) * 9.0;

        // Move the ship left to right using the 'translate' value
        // Also, apply the wavy offset to the ship's vertical position
        return Transform.translate(
          offset: Offset(translate * 100, waveOffset),
          child: Image.asset('assets/images/background/vikingship.png'),
        );
      },
    );
  }
}
