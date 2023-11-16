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
        // translate receive values from tween and move the image
        builder: (_, double translate, __) {
          // final waveOffset = sin(translate * pi + 90) * 12.0;
          return Transform.translate(
              // * 100: frames
              // offset: Offset(translate * 100, 0),
              offset: Offset(translate * 100, 0),
              child: Image.asset('assets/images/background/vikingship.png'));
        });
  }
}
