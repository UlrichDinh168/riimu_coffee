import 'package:flutter/material.dart';

class ShipAnimation extends StatefulWidget {
  const ShipAnimation({super.key, required this.timeout});

  final int timeout;

  @override
  State<StatefulWidget> createState() {
    return _ShipAnimationState();
  }
}

class _ShipAnimationState extends State<ShipAnimation> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 4),
        duration: Duration(seconds: widget.timeout),
        builder: (_, double translate, __) {
          return Transform.translate(
              // offset: const Offset(0.0, 15.0),
              offset: Offset(translate * 150 - 150, 0),
              child: Image.asset('assets/images/background/vikingship.png'));
        });
  }
}
